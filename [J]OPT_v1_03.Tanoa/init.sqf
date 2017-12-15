//by psycho
diag_log format ["%1 --- Executing TcB init.sqf", diag_ticktime];

#include "setup\setup.sqf"

// legt alle wichtigen classnames wie Flaggen und Einheiten fest
__ccppfln(setup\setup_classnames.sqf);

// sicherstellen, dass alle Parameter eingelesen wurden
waitUntil {!isNil "OPT_PLAYTIME"};

setTerrainGrid 3.125;

if (isNil "tcb_netinit") then {
	__ccppfln(common\x_netinit.sqf);
	__ccppfln(common\netEvents.sqf);
	tcb_netinit = true;
};

#ifdef __STARTTIME__
	if (OPT_DAYTIME != 99) then {
		setDate [date select 0, date select 1, date select 2, OPT_DAYTIME, 0];
	};
#endif

__ccppfln(addons\far_revive\FAR_revive_init.sqf); 											//farooq

// post-init area:
[] spawn {
	__ccppfln(addons\zlt_fieldrepair\zlt_fieldrepair.sqf);								//repscript
	execVM "addons\R3F_LOG\init.sqf";																			// r3f Logistics
	execVM "addons\attach_exp\init.sqf";																	// etv charges
	_ws_time = if (OPT_TRAINING == 1) then {30} else {OPT_TRUCETIME + OPT_FREEZE_TIME};
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

diag_log format ["%1 --- TcB init.sqf is processed", diag_ticktime];

#include "init_custom.sqf"