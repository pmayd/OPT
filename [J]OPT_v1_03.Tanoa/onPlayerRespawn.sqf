/**
* EVENT Script, wird bei Respawn ausgeführt.
* Wegen respawnOnStart = -1 in description.ext nicht bei Missionsbeginn
*/
#include "setup\setup.sqf"
diag_log format ["%1 --- TcB onPlayerRespawn.sqf startet", diag_ticktime];

params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];


/* NUR ZU BEGINN */
if (_oldUnit isEqualTo objNull) then {

} /* NUR NACH RESPAWN */
else {
	
	// Kosten für Seite abziehen + log
	["opt_eh_server_update_budget", [playerSide, opt_respawn_cost, "-"]] call CBA_fnc_serverEvent;
	["opt_eh_server_log_write", ["Respawn", format["Spieler: %1 - Kosten: %2", name player, opt_respawn_cost]]] call CBA_fnc_serverEvent;

	waitUntil {!isNil "EtVInitialized"};
	[player] spawn EtV_Actions;
	player setVariable ["charges",[]]; // alte Sprengladungen löschen

	// Mine detector
	call OPT_Detector_fnc_postInit;

};


#ifdef __NO_MAP__
	if (player hasWeapon "ItemMap") then {player removeWeapon "ItemMap"};
	if (player hasWeapon "ItemGPS") then {player removeWeapon "ItemGPS"};
#endif

#ifdef __NO_NVG__
	player call tcb_fnc_removeNVG;
	execFSM "fsms\RemoveGoogles.fsm";
#endif


#ifdef __PLAYER_GRAPHIC_SETTINGS__
	player addAction ["Settings" call XGreyText, "dialogs\mission_settings\create.sqf", [], 0, false, true, '', "alive _target"];
#endif
// Enable Dynamic Groups
["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;

if (OPT_TELEPORT == 1 && OPT_TRAINING == 1) then {
	player addAction ["Teleport" call XGreyText, {[] call opt_fnc_teleport}, [], 0, false, true, '', "alive _target"];
};

if (OPT_TRAINING == 1) then {
	player addAction ["Flagge versetzen" call XGreyText, {createDialog "FlagDialog"}, [], 0, false, true, '', "alive _target"];
};

/*
[] spawn {
	[] spawn opt_TFARfrequencies;
	[] spawn opt_tfarVehicleLr;
};
*/

enableRadio false;
player disableConversation true;
enableSentences false;

// Zeus neu zuweisen im Trainingsmodus
["opt_eh_server_renew_curator", [player]] call CBA_fnc_serverEvent;

diag_log format ["%1 --- TcB player_jip.sqf processed",diag_ticktime];