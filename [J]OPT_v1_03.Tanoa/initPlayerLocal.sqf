//by psycho
//init only by client
#include "setup\setup.sqf";
diag_log format ["%1 --- TcB initPlayerLocal.sqf startet",diag_ticktime];

// Startparameter auslesen und als globale Variablen verfügbar machen
// By James: moderner Ansatz ohne 20 Zeilen Code
// Das spiel liest bereits alle Parameter aus und speichert sie in "BIS_fnc_storeParamsValues_data"
// 1. Namen aller Parameter
// 2. führe globale Variable mit diesem Namen ein
_paramNames = ("true" configClasses (getMissionConfig "Params")) apply {configName _x};
{	
	// braucht nicht global sein, da init.sqf für jeden ausgeführt wird
	missionNamespace setVariable [_x, [_x] call BIS_fnc_getParamValue];
} forEach _paramNames;

// checking for failed player init
if (isMultiplayer && !isServer) then {	// only on dedicated environment
	true spawn {
		private "_puid";
		waitUntil {player == player && local player};
		_puid = getPlayerUID player;
		if (isNil "_puid") exitWith {diag_log "UID is Nil - init stoped"; endMission "LOSER";};
		if (_puid == "") exitWith {diag_log "UID is empty - init stoped"; endMission "LOSER";};
		if (!isNil "opt_allowedSides") then {
			if !(playerSide in opt_allowedSides) exitWith {diag_log format ["wrong side: %1", playerSide]; endMission "LOSER";};
		};
	};
};

// TEAM BALANCE - end mission for player if side is full
// nicht in onPlayerRespawn, da nur zu Missionsbeginn prüfen
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

if (isNil "x_global_chat_logic") then {x_global_chat_logic = "Logic" createVehicleLocal [0,0,0]};

// starte alle addon Scripte
__ccppfln(common\client\func\x_perframe.sqf); // startet Rsc für Anzeige von Meldungen
[] execVM "addons\opt3_magRepack\MagRepack_init_sv.sqf";
__cppfln(opt_TFARfrequencies,common\client\opt_TFARfrequencies.sqf);
__cppfln(opt_tfarVehicleLr,common\client\opt_tfarVehicleLr.sqf);

if ((typeOf player) in opt_gps_units) then {execVM "common\client\opt3_gps.sqf"};

// call OPT specific items
if (OPT_TFAR_INTERCEPTION == 1) then {
	_log_briefing = player createDiaryRecord ["keys", ["gegnerischer Funk", "
	Die Option um gegnerischen Funk (Vehicle Radios) abhören zu können ist aktiv! Die eingestellte gegnerische Frequenz kann beim entern eines gegnerischen Fahrzeuges jedoch nicht direkt abgelesen werden sondern muss selber gefunden werden.
	"]];
};

// startet das End-Skript. Wartet, bis Ende eintrifft
[] execVM "common\client\opt_endMission.sqf";

// lädt die CBA EH für clients
#include "common\client\i_events.sqf"

/**
Display Event Handler auf Tastendruck
Sind auch nach Respawn persistent
*/
waitUntil {!isNull (findDisplay 46)};
// Ear Plugs
(findDisplay 46) displayAddEventHandler ["KeyDown", {_this call opt_fnc_earplugs}];

// OPT Maintainer
if (player isKindOf "OPT_Maintainer" || getPlayerUID player == "76561197977676036" || getPlayerUID player == "76561198095507681" || getPlayerUID player == "76561197998124797" || getPlayerUID player == "76561197970731085") then {
	(findDisplay 46) displayAddEventHandler ["KeyDown", {_this call opt_fnc_maintainerDialog}];
};

/**
Event Handler für Spieler
Sind auch nach Respawn persistent
*/
#ifdef __WEAPON_SAVER__
	/* aktuell keine Bedeutung? */
	player addEventHandler ["killed", {[_this select 0, [missionNamespace, "tcb_inv"]] call BIS_fnc_saveInventory}];
#endif

// EH bei Aufnahme von Waffen
// ruft client/func/fn_weaponCheck
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

player addEventHandler ["GetInMan", {
		/*  
	   	unit: Object - Unit the event handler is assigned to
	    position: String - Can be either "driver", "gunner" or "cargo"
	    vehicle: Object - Vehicle the unit entered
	    turret: Array - turret path
    */
    params ["_unit", "_pos", "_vec", "_turret"];

    #ifdef __ONLY_PILOTS_CAN_FLY__
			if (OPT_ONLY_PILOTS == 1) then {
				if (!(typeOf _unit in opt_pilots) && {!(typeOf _unit in ["O_Helipilot_F","B_Helipilot_F"])}) then {
					if (_vec isKindOf "Air" && (_unit == assignedDriver _vec || _unit == _vec turretUnit [0])) then {
						if (!(typeOf _vec in ["Steerable_Parachute_F", "NonSteerable_Parachute_F"])) then {
							_unit action ["GetOut", _vec];
							TitleRsc ["only_pilots", "plain", 0.5];
						};
					};
				};
			};
			
		#endif

		#ifdef __ONLY_CREW_CAN_DRIVE__
			if (OPT_ONLY_CREW == 1) then {
				if (!(typeOf _unit in opt_crew) && {!(typeOf _unit in ["O_crew_F","B_crew_F"])}) then {
					if (_unit == driver _vec || _unit == gunner _vec || _unit == commander _vec) then {
						if (typeOf _vec in opt_crew_vecs || _vec isKindOf "Tank") then {
							_unit action ["GetOut", _vec];
							TitleRsc ["only_crew", "plain", 0.5];
						};
					};
				};
			};

		#endif
}];

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
	// each frame
	addMissionEventHandler ["Draw3D", {
		[] spawn opt_fnc_updateHUD;

	}];

	// only when opening or closing map
	addMissionEventHandler ["Map", {
		while {visibleMap} do {
			[] spawn opt_fnc_updateHUD;
		}
	}];
#endif

#ifdef __SHOW_CUSTOM_PLAYERMARKER__
	__ccppfln(common\client\func\player_marker.sqf);

#endif

#ifdef __INTRO_ENABLED__
	execVM "common\client\intro.sqf";

	/* veraltet? siehe Skript oben
	waitUntil {!isNil "BIS_fnc_init"};
	waitUntil {!isNull (findDisplay 46)};
	[] spawn {
		sleep 6;
		[parseText format [ "<t align='right' size='1.2'><t font='PuristaBold' size='1.6'>""%1""</t><br/>
		%2</t>", __MISSION_NAME__, "von: " + __MADE_BY__], true, nil, 7, 0.7, 0] spawn BIS_fnc_textTiles;
	};

	_layer = "tcbIntroLayer" call BIS_fnc_rscLayer;
	_layer cutRsc ["mission_Label", "PLAIN"];
	[] spawn tcb_fnc_JukeBox;
	intro_done = true;


	[] spawn {
		titleCut ["","BLACK IN", 3.5];
		"dynamicblur" ppeffectenable true;
		"dynamicblur" ppeffectadjust [5];
		"dynamicblur" ppeffectcommit 0;
		"dynamicblur" ppeffectadjust [0];
		"dynamicblur" ppeffectcommit 5;
	};
	*/
	
#endif

#ifdef __BREATH_VISIBLE__
	execVM "common\client\foggy_breath.sqf";

#endif

#ifdef __BLOOD_SCREEN__
	player addeventhandler ["hit",{
		_hit = _this select 2;
		_sqf = [0.7 + _hit] spawn tcb_fnc_screen;
		"dynamicblur" ppeffectenable true;
		"dynamicblur" ppeffectadjust [1];
		"dynamicblur" ppeffectcommit 0;
		"dynamicblur" ppeffectadjust [0];
		"dynamicblur" ppeffectcommit (1 + random 1);
	}];

#endif

_pos = if (playerSide == blufor) then {getMarkerPos "respawn_east"} else {getMarkerPos "respawn_west"};
["ProtectionZone_Invisible_F", _pos, 150, 20] spawn opt_fnc_wallChain;

if (isNil "respawndelay") then {
	_num = getNumber (missionConfigFile/"respawndelay");
	if (_num != 0) then {
		missionNamespace setVariable ["tcb_ais_respawndelay", _num];
	};
} else {
	missionNamespace setVariable ["tcb_ais_respawndelay", 999];
};

// legt alle bestellbaren Fahrzeuge und Kisten fest
#include "dialogs\vehiclePool_war.hpp"

tcb_ais_killcam_quotes = [
	[(localize "STR_QUOTE_1"),(localize "STR_AUTHOR_1")],
	[(localize "STR_QUOTE_2"),(localize "STR_AUTHOR_2")],
	[(localize "STR_QUOTE_3"),(localize "STR_AUTHOR_3")],
	[(localize "STR_QUOTE_4"),(localize "STR_AUTHOR_4")],
	[(localize "STR_QUOTE_5"),(localize "STR_AUTHOR_5")],
	[(localize "STR_QUOTE_6"),(localize "STR_AUTHOR_6")],
	[(localize "STR_QUOTE_7"),(localize "STR_AUTHOR_7")],
	[(localize "STR_QUOTE_8"),(localize "STR_AUTHOR_8")],
	[(localize "STR_QUOTE_9"),(localize "STR_AUTHOR_9")],
	[(localize "STR_QUOTE_10"),(localize "STR_AUTHOR_10")],
	[(localize "STR_QUOTE_11"),(localize "STR_AUTHOR_11")],
	[(localize "STR_QUOTE_12"),(localize "STR_AUTHOR_12")],
	[(localize "STR_QUOTE_13"),(localize "STR_AUTHOR_13")],
	[(localize "STR_QUOTE_14"),(localize "STR_AUTHOR_14")],
	[(localize "STR_QUOTE_15"),(localize "STR_AUTHOR_15")],
	[(localize "STR_QUOTE_16"),(localize "STR_AUTHOR_16")],
	[(localize "STR_QUOTE_17"),(localize "STR_AUTHOR_17")],
	[(localize "STR_QUOTE_18"),(localize "STR_AUTHOR_18")],
	[(localize "STR_QUOTE_19"),(localize "STR_AUTHOR_19")],
	[(localize "STR_QUOTE_20"),(localize "STR_AUTHOR_20")],
	[(localize "STR_QUOTE_21"),(localize "STR_AUTHOR_21")],
	[(localize "STR_QUOTE_22"),(localize "STR_AUTHOR_22")],
	[(localize "STR_QUOTE_23"),(localize "STR_AUTHOR_23")],
	[(localize "STR_QUOTE_24"),(localize "STR_AUTHOR_24")],
	[(localize "STR_QUOTE_25"),(localize "STR_AUTHOR_25")],
	[(localize "STR_QUOTE_26"),(localize "STR_AUTHOR_26")],
	[(localize "STR_QUOTE_27"),(localize "STR_AUTHOR_27")],
	[(localize "STR_QUOTE_28"),(localize "STR_AUTHOR_28")],
	[(localize "STR_QUOTE_29"),(localize "STR_AUTHOR_29")],
	[(localize "STR_QUOTE_30"),(localize "STR_AUTHOR_30")],
	[(localize "STR_QUOTE_31"),(localize "STR_AUTHOR_31")],
	[(localize "STR_QUOTE_32"),(localize "STR_AUTHOR_32")],
	[(localize "STR_QUOTE_33"),(localize "STR_AUTHOR_33")],
	[(localize "STR_QUOTE_34"),(localize "STR_AUTHOR_34")],
	[(localize "STR_QUOTE_35"),(localize "STR_AUTHOR_35")],
	[(localize "STR_QUOTE_36"),(localize "STR_AUTHOR_36")],
	[(localize "STR_QUOTE_37"),(localize "STR_AUTHOR_37")],
	[(localize "STR_QUOTE_38"),(localize "STR_AUTHOR_38")],
	[(localize "STR_QUOTE_39"),(localize "STR_AUTHOR_39")],
	[(localize "STR_QUOTE_40"),(localize "STR_AUTHOR_40")],
	[(localize "STR_QUOTE_41"),(localize "STR_AUTHOR_41")],
	[(localize "STR_QUOTE_42"),(localize "STR_AUTHOR_42")],
	[(localize "STR_QUOTE_LAST"),(localize "STR_AUTHOR_LAST")]
];

diag_log format ["%1 --- TcB initPlayerLocal.sqf processed",diag_ticktime];