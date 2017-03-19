#include "setup.sqf"
diag_log format ["%1 --- TcB onPlayerRespawn.sqf startet",diag_ticktime];
if (!X_Client || {!isNil "jip_started"}) exitWith {};
jip_started = true;

/*
_curators = [];
_curators = call BIS_fnc_listCuratorPlayers;
if (!isNil "TCB_CURATOR") then {
	if (!isNull TCB_CURATOR) then {
		if (player in _curators && {str(player) == "TCB_CURATOR"}) then {
			_logic = getAssignedCuratorLogic player;
			_logic addCuratorPoints 1;
			_logic setVariable ["tcb_zeus", [player, getplayerUID player], true];
			0 spawn {
				waitUntil {!isNil "intro_done"};
				openCuratorInterface;
			};
		};
	};
};

["addToCurator", player] call tcb_fnc_netCallEventCTS;
*/
if (isMultiplayer && !isServer) then {
	if (OPT_TEAMBALANCE > 0) then {
		_en_pa = if (playerSide == blufor) then {playersNumber opfor} else {playersNumber blufor};
		if ((playersNumber playerSide) > (_en_pa + OPT_TEAMBALANCE)) then {
			endMission (switch (playerSide) do {
				case (blufor) : {"balanceBLUFOR"};
				case (opfor) : {"balanceOPFOR"};
				default {"LOSER"};
			});
		};
	};
};

private ["_strp", "_i"];
_strp = str(player);
tcb_respawns = 0;

#ifdef __NO_NVG__
	player call tcb_fnc_removeNVG;
	execFSM "fsms\RemoveGoogles.fsm";
#endif

#ifdef __WEAPON_SAVER__
	player addEventhandler ["killed", {[_this select 0, [missionNamespace, "tcb_inv"]] call BIS_fnc_saveInventory}];
#endif

player setVariable ["opt_pw_storage", primaryWeapon player];
player addEventHandler ["Take", {_this call opt_fnc_weaponCheck}];

player addEventHandler ["HandleRating", {0}];

if (__RESPAWN_TYPE__ != 0 || __RESPAWN_TYPE__ != 1) then {
	player AddEventHandler ["Respawn",{_this call tcb_fnc_playerRespawn}];
	player AddEventHandler ["killed",{
		_this spawn {
			sleep (__RESPAWN_DELAY__ + random 5);
			deleteVehicle (_this select 0);
		};
	}];
};

removeAllMissionEventHandlers "Draw3D";
tcb_draw3D_reset_done = true;

#ifdef __FIRSTPERSON__
	if (difficultyEnabled "3rdPersonView") then {
		addMissionEventHandler ["Draw3D", {
			if ((cameraView == "EXTERNAL") && {vehicle player == player}) then {
				vehicle player switchCamera "INTERNAL";
			};
		}];
	};
#endif

// Wenn HUD in setup.sqf ein, füge EH für HUD hinzu
// HUD wird dann jedes Frame neu gezeichnet
// belastet nur Client FPS, wenn überhaupt
/**
Runs the EH code each frame in unscheduled environment. Client side EH only (presence of UI). Will stop executing when UI loses focus (if user Alt+Tabs for example). Usually used with drawIcon3D, drawLine3D. 
*/
#ifdef __HUD_ON__
	("opt_HUD" call BIS_fnc_rscLayer) cutRsc ["opt_HudDisplay","PLAIN"];
	addMissionEventHandler ["Draw3D", {
		[] spawn opt_fnc_updateHUD;
		uiSleep 1;
	}];
#endif

// known issue: missionEH wont remove if the player switch during the mission the slot! that means if the mEH was set one time it will be activated regardless if you switch the lobby slot f.e. - maybee line 32 will fix this(?)
#ifdef __ONLY_PILOTS_CAN_FLY__
	if (tcb_b_check_pilot == 1) then {
		if (!(typeOf player in tcb_pilots) && {!(typeOf player in ["O_Helipilot_F","B_Helipilot_F"])}) then {
			addMissionEventHandler ["Draw3D", {
				if ((vehicle player) isKindOf "Air" && player == assignedDriver (vehicle player) || {player == (vehicle player) turretUnit [0] && (vehicle player) isKindOf "Air"}) then {
					if (!(typeOf (vehicle player) in ["Steerable_Parachute_F", "NonSteerable_Parachute_F"])) then {
						player action ["GetOut",vehicle player];
						TitleRsc ["only_pilots", "plain", 0.5];
					};
				};
			}];
		};
	};

#endif
#ifdef __ONLY_CREW_CAN_DRIVE__
	if (tcb_b_check_crew == 1) then {
		if (!(typeOf player in tcb_crew) && {!(typeOf player in ["O_crew_F","B_crew_F"])}) then {
			addMissionEventHandler ["Draw3D", {
				if (player == driver (vehicle player)) then {
					if (typeOf (vehicle player) in tcb_crewVecs || {(vehicle player) isKindOf "Tank"}) then {
						player action ["GetOut",vehicle player];
						TitleRsc ["only_crew", "plain", 0.5];
					};
				};
			}];
		};
	};
#endif

// call OPT specific items
If (OPT_TFAR_INTERCEPTION == 1) then {
	_log_briefing = player createDiaryRecord ["keys", ["gegnerischer Funk", "
	Die Option um gegnerischen Funk (Vehicle Radios) abhören zu können ist aktiv! Die eingestellte gegnerische Frequenz kann beim entern eines gegnerischen Fahrzeuges jedoch nicht direkt abgelesen werden sondern muss selber gefunden werden.
	"]];
};
[] execVM "common\client\opt_endMission.sqf";


#ifdef __PLAYER_GRAPHIC_SETTINGS__
	player addAction ["Settings" call XGreyText, "dialogs\mission_settings\create.sqf", [], 0, false];
#endif
// Enable Dynamic Groups
["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;

if (OPT_TELEPORT == 1) then {
	player addAction ["Teleport" call XGreyText, {[] call opt_fnc_teleport}, [], 0, false];
};

deleteVehicle client_jip_init_trigger;
client_jip_init_trigger = nil;


#ifndef __INTRO_ENABLED__
	waitUntil {!isNil "BIS_fnc_init"};
	waitUntil {!isNull (findDisplay 46)};
	[] spawn {
		sleep 6;
		[parseText format [ "<t align='right' size='1.2'><t font='PuristaBold' size='1.6'>""%1""</t><br/>
		%2</t>", __MISSION_NAME__, "von: " + __MADEBY__], true, nil, 7, 0.7, 0] spawn BIS_fnc_textTiles;
	};

	_layer = "tcbIntroLayer" call BIS_fnc_rscLayer;
	_layer cutRsc ["mission_Label", "PLAIN"];
	[] spawn tcb_fnc_JukeBox;
	intro_done = true;
#endif

[] spawn {
	sleep 5;	// delay... make sure TFAR had initialized
	[] spawn opt_TFARfrequencies;
	[] spawn opt_tfarVehicleLr;
};

(findDisplay 46) displayAddEventHandler ["KeyDown", {_this call opt_fnc_earplugs}];
// OPT Maintainer
if (player isKindOf "OPT_Maintainer" || {getPlayerUID player == "76561197977676036"} || {getPlayerUID player == "76561198095507681"} || {getPlayerUID player == "76561197998124797"}) then {
	(findDisplay 46) displayAddEventHandler ["KeyDown", {_this call opt_fnc_maintainerDialog}];
};


// vehicle flip
player addAction ["Fahrzeug aufrichten" call XTuerkiesText, "call opt_fnc_unFlip", [], 0, false, true, "", "[_this] call opt_fnc_flipCheck"];

// create repPad Triggers (wont work since  arma 1.56)
/*
_sidePad = [];
_sidePad = if (playerSide == blufor) then {[b_pad_1,b_pad_2,b_pad_3]} else {[o_pad_1,o_pad_2,o_pad_3]};
{[position _x, [5, 5, 0, false],["ANY", "PRESENT", true], ["this && ((getPos (thisList select 0)) select 2 < 2) && speed (thisList select 0) < 1", "_xx = [(thisList select 0)] execVM 'common\x_reload.sqf'", ""]] call tcb_fnc_CreateTrigger} forEach _sidePad;
*/

diag_log format ["%1 --- TcB player_jip.sqf processed",diag_ticktime];