/**
* EVENT Script, wird bei Respawn ausgeführt.
* Wegen respawnOnStart = -1 in description.ext nicht bei Missionsbeginn
*/
#include "setup\setup.sqf"
diag_log format ["%1 --- TcB onPlayerRespawn.sqf startet", diag_ticktime];

params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];

// Kosten für Seite abziehen + log
["opt_eh_server_update_budget", [playerSide, opt_respawn_cost, "-"]] call CBA_fnc_serverEvent;
["opt_eh_server_log_write", ["Spieler Respawn", format["Spieler: %1 - Kosten: %2", name player, opt_respawn_cost]]] call CBA_fnc_localEvent;

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

// By James: Verschoben aus i_server hierher, da init.sqf für jeden Spieler ausgeführt wird!
#ifdef __NO_MAP__
	if (player hasWeapon "ItemMap") then {player removeWeapon "ItemMap"};
	if (player hasWeapon "ItemGPS") then {player removeWeapon "ItemGPS"};
#endif

#ifdef __NO_NVG__
	player call tcb_fnc_removeNVG;
	execFSM "fsms\RemoveGoogles.fsm";
#endif


#ifdef __PLAYER_GRAPHIC_SETTINGS__
	player addAction ["Settings" call XGreyText, "dialogs\mission_settings\create.sqf", [], 0, false];
#endif
// Enable Dynamic Groups
["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;

if (OPT_TELEPORT == 1) then {
	player addAction ["Teleport" call XGreyText, {[] call opt_fnc_teleport}, [], 0, false];
};

[] spawn {
	[] spawn opt_TFARfrequencies;
	[] spawn opt_tfarVehicleLr;
};

// Mine detector
call OPT_Detector_fnc_postInit;

// prüft, ob ein Fahrzeug auf dem Kopf liegt.
// TODO: Als EH bei Fahrzeug?

diag_log format ["%1 --- TcB player_jip.sqf processed",diag_ticktime];