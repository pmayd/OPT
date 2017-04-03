//by psycho
diag_log format ["%1 --- Executing TcB init.sqf",diag_ticktime];
#include "setup\setup.sqf"

#ifdef __INTRO_ENABLED__
	titleCut ["","BLACK IN", 999];
#endif

// Startparameter auslesen und als globale Variablen verfügbar machen
// By James: moderner Ansatz ohne 20 Zeilen Code
// Das spiel liest bereits alle Parameter aus und speichert sie in "BIS_fnc_storeParamsValues_data"
// 1. Namen aller Parameter, 2. führe globale Variable mit diesem Namen ein
_paramNames = ("true" configClasses (missionConfigFile >> "Params")) apply {configName _x};
{	
	// braucht nicht global sein, da init.sqf für jeden ausgeführt wird
	missionNamespace setVariable [_x, [_x] call BIS_fnc_getParamValue];
} forEach _paramNames;

#ifdef __VIEWDISTANCE__
	setViewDistance __VIEWDISTANCE__;
#endif

#ifdef __GRASS_OFF__
	setTerrainGrid 50;
#else
	if (OPT_GRASS == 0) then {
		setTerrainGrid 50;
	} else {
		setTerrainGrid 3.125;
	};
#endif

// legt alle wichtigen classnames wie Flaggen und Einheiten fest
#include "setup\setup_classnames.sqf"

// registriert auf allen Systemen die CBA EH
#include "i_events.sqf";

if (isNil "tcb_netinit") then {
	__ccppfln(common\x_netinit.sqf);
	__ccppfln(common\netEvents.sqf);
	tcb_netinit = true;
};
tf_give_microdagr_to_soldier = false;

// legt alle bestellbaren Fahrzeuge und Kisten fest
#include "dialogs\vehiclePool_war.hpp"
if (isServer) then {

	#include "i_server.sqf"
};

if (!isDedicated) then {

	#include "i_client.sqf"
};

#ifdef __STARTTIME__
	if (OPT_DAYTIME != 99) then {
		setDate [date select 0, date select 1, date select 2, OPT_DAYTIME, 0];
	};
#endif

__ccppfln(addons\far_revive\FAR_revive_init.sqf); 											//farooq

// post-init area:
[] spawn {
	__ccppfln(addons\fastrope\zlt_fastrope.sqf); 													//fastropescript
	__ccppfln(addons\zlt_fieldrepair\zlt_fieldrepair.sqf);								//repscript
	execVM "addons\R3F_LOG\init.sqf";																			// r3f Logistics
	execVM "addons\attach_exp\init.sqf";																	// etv charges
	_ws_time = if (OPT_TRAINING == 1) then {30} else {OPT_TRUCETIME};
	[_ws_time] execVM "addons\opt3_sectorControl\opt_startMission.sqf";		// startet Timer für Waffenruhe und legt Missionsstart fest!

	// new command since 1.52 - to disable the player raycasts in PvP cause not needed functionality but a lot of cpu calcuation
	disableRemoteSensors true;
	
	waitUntil {time > 0};
	enableEnvironment true;
	enableRadio false;
	//0 fadeRadio 0;	<-- produce the mysterie bug ;-P
	player disableConversation true;
	enableSentences false;
	oldSubs = showSubtitles false;
	enableSaving [false,false];
	enableTeamswitch false;
};


diag_log format ["%1 --- TcB init.sqf is processed",diag_ticktime];

#include "init_custom.sqf"