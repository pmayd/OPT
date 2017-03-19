//by psycho
diag_log format ["%1 --- Executing TcB init.sqf",diag_ticktime];
#include "setup.sqf"

if (!isNil "tcb_init_started") exitWith {
	diag_log format ["%1 --- TcB init.sqf executed more than once",diag_ticktime];
};
tcb_init_started = true;


#ifdef __INTRO_ENABLED__
titleCut ["","BLACK IN", 999];
#endif


X_INIT = false;X_Server = isServer; X_Client = !isDedicated; X_JIP = false;X_SPE = false;X_MP = isMultiplayer;
#define __waitpl 0 spawn {scriptName "spawn_WaitForNotIsNullPlayer";waitUntil {!isNull player};X_INIT = true}
if (isServer) then {
	if (!isDedicated) then {
		X_SPE = true;
	};
	X_INIT = true;
} else {
	if (isNull player) then {
		X_JIP = true;
		__waitpl;
	} else {
		X_INIT = true;
	};
};
if (X_Client) then {
	if (isMultiplayer) then {
		0 spawn {
			scriptName "spawn_WaitForX_INIT";
			waitUntil {X_INIT};
		};
	};
};

if (isNil "paramsArray") then {
	if (isClass (missionConfigFile/"Params")) then {
		_conf = missionConfigFile/"Params";
		for "_i" from 0 to (count _conf - 1) do {
			_paramName = configName (_conf select _i);
			_paramval = getNumber (_conf/_paramName/"default");
			if (_paramval != -99999) then {
				missionNamespace setVariable [_paramName, _paramval];
			};
		};
	};
} else {
	for "_i" from 0 to (count paramsArray - 1) do {
		_paramval = paramsArray select _i;
		if (_paramval != -99999) then {
			missionNamespace setVariable [configName ((missionConfigFile/"Params") select _i), _paramval];
		};
	};
};

// By James: Verschoben aus i_server hierher, da init.sqf für jeden Spieler ausgeführt wird!
#ifdef __MAP__
if (player hasWeapon "ItemMap") then {player removeWeapon "ItemMap"};
if (player hasWeapon "ItemGPS") then {player removeWeapon "ItemGPS"};
#endif

#ifdef __VIEWDISTANCE__
setViewDistance __VIEWDISTANCE__;
#endif

#ifdef __GRASS_OFF__
	setTerrainGrid 50;
#else
if (tcb_grass == 0) then {
	setTerrainGrid 50;
} else {
	setTerrainGrid 3.125;
};
#endif

#include "setup_classnames.sqf"

if (isNil "tcb_netinit") then {
	__ccppfln(common\x_netinit.sqf);
	__ccppfln(common\netEvents.sqf);
	tcb_netinit = true;
};
tf_give_microdagr_to_soldier = false;

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

tcb_init_processed = true;
diag_log format ["%1 --- TcB init.sqf is processed",diag_ticktime];

#include "init_custom.sqf"