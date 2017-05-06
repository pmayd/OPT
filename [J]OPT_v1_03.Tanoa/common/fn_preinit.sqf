#include "..\setup\setup.sqf"
diag_log format ["############################# %1 #############################", missionName];

// legt alle wichtigen classnames wie Flaggen und Einheiten fest
#include "..\setup\setup_classnames.sqf"

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

diag_log format ["%1 --- preInit.sqf is processed",diag_ticktime];