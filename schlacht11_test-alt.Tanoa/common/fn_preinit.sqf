#include "../setup.sqf"
diag_log format ["############################# %1 #############################", missionName];

XGreyText = {"<t color='#f0bfbfbf'>" + _this + "</t>"};
XRedText = {"<t color='#f0ff0000'>" + _this + "</t>"};
XOrangeText = {"<t color='#F3B601'>" + _this + "</t>"};
XBlueText = {"<t color='#655EDE'>" + _this + "</t>"};
XTuerkiesText = {"<t color='#00D3BF'>" + _this + "</t>"};
tf_receivingDistanceMultiplicator_Value = 5;
tf_sendingDistanceMultiplicator_Value = 5;
TF_terrain_interception_coefficient = 0;
tf_no_auto_long_range_radio	= true;
opt_allowedSides = [blufor, opfor];

///////////////////////////////////////////////////////////////////////////////////
// Global Variables
SM3_started		= false;

///////////////////////////////////////////////////////////////////////////////////

/*
tcb_gamemaster addEventHandler [
	"CuratorObjectRegistered", {
		_classes = _this select 1;
		_costs = [];
		{
			_cost = if (_x isKindOf "Man") then {[true,0.1]} else {[false,0]}; // Show only objects of type "Man", hide everything else
			_costs = _costs + [_cost];
		} forEach _classes; // Go through all classes and assign cost for each of them
		_costs
	}
];
*/

if (!isDedicated) then {
	client_jip_init_trigger = createTrigger ["EmptyDetector", [0,0,0]];
	client_jip_init_trigger setTriggerArea [0,0,0,false];
	client_jip_init_trigger setTriggerActivation ["NONE", "PRESENT", false];
	client_jip_init_trigger setTriggerTimeout [1, 1, 1, false];
	X_INIT = false;
	client_jip_init_trigger setTriggerStatements ["X_INIT && {!isNil 'tcb_init_processed'}","diag_log [diag_frameno, diag_tickTime, time, 'Executing local player JIP trigger']; psy = [] execVM 'common\client\jip.sqf'", ""];
	tcb_fnc_preloadfin = {
		[tcb_prl_fin_id, "onPreloadFinished"] call BIS_fnc_removeStackedEventHandler;
		tcb_prl_fin_id = nil;
		tcb_fnc_preloadfin = nil;
		tcb_preload_done = true;
	};
	tcb_prl_fin_id = ["tcb_ID", "onPreloadFinished", "tcb_fnc_preloadfin"] call BIS_fnc_addStackedEventHandler;
};

diag_log format ["%1 --- preinit.sqf is processed",diag_ticktime];