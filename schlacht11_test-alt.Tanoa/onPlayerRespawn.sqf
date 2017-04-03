#include "setup\setup.sqf"
diag_log format ["%1 --- TcB onPlayerRespawn.sqf startet", diag_ticktime];

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

#ifdef __NO_NVG__
	player call tcb_fnc_removeNVG;
	execFSM "fsms\RemoveGoogles.fsm";
#endif

// entferne alle Einträge aus dem Mausradmenü
removeAllActions player;

// entferne alle zugewiesenen Event Handler
player removeAllEventHandlers "killed";
player removeAllEventHandlers "take";
player removeAllEventHandlers "HandleRating";

#ifdef __WEAPON_SAVER__
	/* aktuell keine Bedeutung? */
	player addEventHandler ["killed", {[_this select 0, [missionNamespace, "tcb_inv"]] call BIS_fnc_saveInventory}];
#endif

// EH bei Aufnahme von Waffen
player setVariable ["opt_pw_storage", primaryWeapon player];
player addEventHandler ["Take", {_this call opt_fnc_weaponCheck}];

//player addEventHandler ["HandleRating", {0}];

// lösche Körper nach respawn delay
if (__RESPAWN_TYPE__ != 0 || __RESPAWN_TYPE__ != 1) then {
	player AddEventHandler ["killed",{
		_this spawn {
			sleep (__RESPAWN_DELAY__ + random 5);
			deleteVehicle (_this select 0);
		};
	}];
};

// lösche alle alten Draw3D EH
removeAllMissionEventHandlers "Draw3D";
removeAllMissionEventHandlers "Map";
tcb_draw3D_reset_done = true;

// erzwinge first person kamera
#ifdef __FIRSTPERSON__
	if (difficultyEnabled "3rdPersonView") then {
		addMissionEventHandler ["Draw3D", {
			if ((cameraView == "EXTERNAL") && {vehicle player == player}) then {
				vehicle player switchCamera "INTERNAL";
			};
		}];
	};
#endif

// Wenn HUD in setup/setup.sqf ein, füge EH für HUD hinzu
// HUD wird dann jedes Frame neu gezeichnet
// belastet nur Client FPS, wenn überhaupt
/**
Runs the EH code each frame in unscheduled environment. Client side EH only (presence of UI). Will stop executing when UI loses focus (if user Alt+Tabs for example). Usually used with drawIcon3D, drawLine3D. 
*/
#ifdef __HUD_ON__
	("opt_HUD" call BIS_fnc_rscLayer) cutRsc ["opt_HudDisplay","PLAIN"];

	// Aktualisierung des HUD
	addMissionEventHandler ["Draw3D", {
		[] spawn opt_fnc_updateHUD;
	}];

	addMissionEventHandler ["Map", {
		while {visibleMap} do {
			[] spawn opt_fnc_updateHUD;
		}
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
if (OPT_TFAR_INTERCEPTION == 1) then {
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

[] spawn {
	sleep 5;	// delay... make sure TFAR had initialized
	[] spawn opt_TFARfrequencies;
	[] spawn opt_tfarVehicleLr;
};

// vehicle flip
player addAction ["Fahrzeug aufrichten" call XTuerkiesText, "call opt_fnc_unFlip", [], 0, false, true, "", "[_this] call opt_fnc_flipCheck"];

diag_log format ["%1 --- TcB player_jip.sqf processed",diag_ticktime];