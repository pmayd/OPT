// init script for players
#include "script_component.hpp"

diag_log format ["%1 --- opt_mission_fnc_postInit started", diag_ticktime];

// store playerSide for logs and other functions
player setVariable ["opt_var_playerSide", playerSide, true];

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

// lade alle EH
[] call FUNC(initPlayerEH);

// new command since 1.52 - to disable the player raycasts in PvP cause not needed functionality but a lot of cpu calcuation
disableRemoteSensors true;
setTerrainGrid 3.125;
enableEnvironment true;
enableRadio false;
//0 fadeRadio 0;	<-- produce the mysterie bug ;-P
player disableConversation true;
enableSentences false;
oldSubs = showSubtitles false;
enableSaving [false, false];
enableTeamswitch false;

diag_log format ["%1 --- opt_mission_fnc_postInit processed", diag_ticktime];