//by psycho
//init only by client
#include "setup\setup.sqf";
diag_log format ["%1 --- TcB initPlayerLocal.sqf startet",diag_ticktime];

// store playerSide for logs and other functions
player setVariable ["opt_var_playerSide", playerSide, true];

// legt alle wichtigen classnames wie Flaggen und Einheiten fest
__ccppfln(setup\setup_classnames.sqf);
// legt alle bestellbaren Fahrzeuge und Kisten fest
__ccppfln(dialogs\vehiclePool_war.hpp);
// lädt die CBA EH für clients
__ccppfln(common\client\i_events.sqf);

// checking for failed player init
if (isMultiplayer && !isServer) then {	// only on dedicated environment
	true spawn {
		private "_puid";
		waitUntil {player == player && local player};
		_puid = getPlayerUID player;
		if (isNil "_puid") exitWith {diag_log "UID is Nil - init stoped"; endMission "LOSER";};
		if (_puid == "") exitWith {diag_log "UID is empty - init stoped"; endMission "LOSER";};
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

player action ["WeaponOnBack", player];
sleep 1;

// friere Spieler, falls freezeTime aktiv
if (!opt_allow_movement) then {

	// init weiter durchladen
	[] spawn {

		// freeze Spieler zu Beginn
		player enableSimulation false;

		// warte OPT_FREEZE_TIME
		waitUntil {sleep 1; opt_allow_movement};

		// gib Spieler frei
		player enableSimulation true;
	};

};

if (isNil "x_global_chat_logic") then {x_global_chat_logic = "Logic" createVehicleLocal [0,0,0]};

// starte alle addon Scripte
[] execVM "addons\opt3_magRepack\MagRepack_init_sv.sqf";
//[] call opt_fnc_tfarFrequencies;

// call OPT specific items
if (OPT_TFAR_INTERCEPTION == 1) then {
	_log_briefing = player createDiaryRecord 
    [
        "keys", 
        [
            "gegnerischer Funk", 
            "Die Option um gegnerischen Funk (Vehicle Radios) abhören zu können ist aktiv! Die eingestellte gegnerische Frequenz kann beim entern eines gegnerischen Fahrzeuges jedoch nicht direkt abgelesen werden sondern muss selber gefunden werden."
        ]
    ];
};

// startet das End-Skript. Wartet, bis Ende eintrifft
[] execVM "common\client\opt_endMission.sqf";


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

/*-------------------------------
Event Handler für Spieler
Sind auch nach Respawn persistent
---------------------------------*/

// EH bei Aufnahme von Waffen
// ruft client/func/fn_weaponCheck
player setVariable ["opt_pw_storage", primaryWeapon player];
player addEventHandler ["Take", {_this call opt_fnc_weaponCheck}];

//player addEventHandler ["HandleRating", {0}];

/* EH für das Versetzen der Flaggen im Trainingsmodus */
if (OPT_TRAINING == 1) then {
	player createDiarySubject ["Training", "Training"];
	player createDiaryRecord ["Training", ["Flaggen verschieben", "
	Im Trainingsmodus kann jeder Spieler die CSAT und NATO Flagge verschieben. Dazu einfach auf der Karte ALT + Linksklick auf die Flaggenmarkierung. Unten links erscheint ein Text, wenn die Aktion erfolgreich war. Wurde die Flagge ausgewählt, so kann mit erneutem ALT + Linksklick die neue Position gewählt werden.
	"]];

	player createDiaryRecord ["Training", ["Zeus", "
	Im Trainingsmodus hat jeder Gruppenführer Zugriff auf Zeus und kann so das Training für seine Gruppe gestalten.
	"]];

	player createDiaryRecord ["Training", ["Teleport", "
	Im Trainingsmodus kann jeder Spieler den Teleport benutzen. Dieser findet sich im Mausradmenü unter Teleport. Einfach auf der Karte den gewünschten Zielort auswählen.
	"]];
	// use stackedEH, cannot override default behavior
	["OPT_MOVE_FLAG", "onMapSingleClick", {
		/*
	    units: Array - leader selected units, same as groupSelectedUnits (same as _units param)
	    pos: Array - world Position3D of the click in format [x,y,0] (same as _pos param)
	    alt: Boolean - true if Alt key was pressed (same as _alt param)
	    shift: Boolean - true if Shift key was pressed (same as _shift param)
		*/

		// exit if no alt key was pressed
		if (!_alt) exitWith {};

		// if alt key was pressed -> was a flag chosen or should a flag be moved?
		// is there a flag that should be moved?
		_flag = objNull;
		{
			if (_x getVariable ["opt_var_flag_moveFlag", false]) exitWith {_flag = _x};
		} foreach opt_csat_flags + opt_nato_flags;

		if (_flag isEqualTo objNull) then {

			// check for flag nearby
			_obj = nearestObjects [_pos, ["FLAG_CSAT_F","FLAG_NATO_F"], 50];
			if (count _obj == 0) exitWith {};

			_obj = _obj select 0;
			_obj setVariable ["opt_var_flag_moveFlag", true];
			systemChat "Flagge kann verschoben werden. Platzieren mit erneutem ALT + Linksklick";
		} else {
			_flag setpos _pos;
			_flag setVariable ["opt_var_flag_moveFlag", false];
			_marker = _flag getVariable "opt_var_flag_marker";
			_marker setMarkerPos _pos; // global new marker
		};
		
	}] call BIS_fnc_addStackedEventHandler;
};

// EH für Minensperre
#ifdef __MINE_FREE_FLAG__
	if (OPT_MINE_FREE_FLAG == 1) then {

		player addEventHandler ["FiredMan", {
			/* 
			  0 unit: Object - Unit the event handler is assigned to (the instigator)
		    1 weapon: String - Fired weapon
		    2 muzzle: String - Muzzle that was used
		    3 mode: String - Current mode of the fired weapon
		    4 ammo: String - Ammo used
		    5 magazine: String - magazine name which was used
		    6 projectile: Object - Object of the projectile that was shot out
		    7 vehicle: Object - Vehicle, if weapon is vehicle weapon, otherwise objNull
    	*/
    	if (_this select 1 == "Put" && ({(_x distance player) <= __MINE_FREE_FLAG_RADIUS__} count (opt_csat_flags + opt_nato_flags) > 0)) then {
    		// lösche Mine
    		deleteVehicle (_this select 6);
    		// gib Spieler Mine zurück
    		player addMagazine (_this select 5);
    		// Warnhinweis
    		_txt = "Mine in der Minensperrzone gelegt!<br/>Mine wurde zurück ins Inventar gelegt.";
    		[format ["<t size='0.8' shadow='1' color='#ff0000'>%1</t>", _txt], (safeZoneX - 0.0), (safeZoneY + 0.25), 3, 1, 0, 3] spawn BIS_fnc_dynamicText;
    	};  

		}];

	};
#endif

// EH für TFAR Frequenzen in Fahrzeugen
//__ccppfln(common\client\opt_tfarVehicleLr.sqf);

// EH für Aufnahme von Funkgeräten 
/*
player addEventHandler["Take", {
    *
        unit: Object - Unit to which the event handler is assigned
        container: Object - The container from which the item was taken (vehicle, box, etc.)
        item: String - The class name of the taken item
    *
    params ["_unit", "_container", "_item"];

    if ((_item find "TFAR_" == 0) or (_item find "tf_" == 0)) then {
        [] call opt_fnc_tfarFrequencies;
    };

}];
*/

// EH fürs Einsteigen
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
					if (_vec isKindOf "Air" && _pos in __BLOCKED_VEHICLE_POSITIONS__) then {
						if (!(typeOf _vec in ["Steerable_Parachute_F", "NonSteerable_Parachute_F"])) then {
							_unit action ["GetOut", _vec];
							["Es ist nur Piloten erlaubt zu fliegen!"] call OPT_Core_fnc_dynamicText;
						};
					};
				};
			};
			
		#endif

		#ifdef __ONLY_CREW_CAN_DRIVE__
			if (OPT_ONLY_CREW == 1) then {
				if (!(typeOf _unit in opt_crew) && {!(typeOf _unit in ["O_crew_F","B_crew_F"])}) then {
					if (_pos in __BLOCKED_VEHICLE_POSITIONS__) then {
						if (typeOf _vec in opt_crew_vecs || _vec isKindOf "Tank") then {
							_unit action ["GetOut", _vec];
							["Dieser Platz ist Besatzungsmitgliedern vorbehalten!"] call OPT_Core_fnc_dynamicText;
						};
					};
				};
			};

		#endif
}];

// EH fürs Platztauschen
player addEventHandler ["SeatSwitchedMan", {
		/*  
	   	unit1: Object - Unit switching seat.
    	unit2: Object - Unit with which unit1 is switching seat.
    	vehicle: Object - Vehicle where switching seats is taking place.
    */
    params ["_unit1", "_unit2", "_vec"];

    #ifdef __ONLY_PILOTS_CAN_FLY__
			if (OPT_ONLY_PILOTS == 1) then {
				if (!(typeOf _unit1 in opt_pilots) && {!(typeOf _unit1 in ["O_Helipilot_F","B_Helipilot_F"])}) then {
					if (_vec isKindOf "Air" && (assignedVehicleRole  _unit1 select 0) in __BLOCKED_VEHICLE_POSITIONS__) then {
						if (!(typeOf _vec in ["Steerable_Parachute_F", "NonSteerable_Parachute_F"])) then {
							_unit1 action ["GetOut", _vec];
							["Es ist nur Piloten erlaubt zu fliegen!"] call OPT_Core_fnc_dynamicText;
						};
					};
				};
			};
			
		#endif

		#ifdef __ONLY_CREW_CAN_DRIVE__
			if (OPT_ONLY_CREW == 1) then {
				if (!(typeOf _unit1 in opt_crew) && {!(typeOf _unit1 in ["O_crew_F","B_crew_F"])}) then {
					if ( (assignedVehicleRole _unit1 select 0) in __BLOCKED_VEHICLE_POSITIONS__) then {
						if (typeOf _vec in opt_crew_vecs || _vec isKindOf "Tank") then {
							_unit1 action ["GetOut", _vec];
							["Dieser Platz ist Besatzungsmitgliedern vorbehalten!"] call OPT_Core_fnc_dynamicText;
						};
					};
				};
			};

		#endif
}];

// lösche alle alten Draw3D EH
tcb_draw3D_reset_done = true;

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
		if (!isNil "opt_startTime") then {
			[] spawn {
				[] call opt_fnc_updateHUD;
				sleep 1;		
			};
		};
	}];

	// only when opening or closing map
	addMissionEventHandler ["Map", {
		// no sheduled environment -> create one
		[] spawn {
			waitUntil{[] spawn opt_fnc_updateHUD; not visibleMap};
		};

	}];
#endif

#ifdef __SHOW_CUSTOM_PLAYERMARKER__
	[] execVM "common\client\GPS.sqf";

#endif

if (OPT_RADAR == 1) then {
	[] execVM "addons\opt3_radar\init.sqf";
};

#ifdef __BREATH_VISIBLE__
	[]	execVM "common\client\foggy_breath.sqf";

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

if (isNil "respawndelay") then {
	_num = getNumber (missionConfigFile/"respawndelay");
	if (_num != 0) then {
		missionNamespace setVariable ["tcb_ais_respawndelay", _num];
	};
} else {
	missionNamespace setVariable ["tcb_ais_respawndelay", 999];
};

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