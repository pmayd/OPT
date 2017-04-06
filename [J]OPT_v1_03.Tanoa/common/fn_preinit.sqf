#include "..\setup\setup.sqf"
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

// Startparameter auslesen und als globale Variablen verfügbar machen
// By James: moderner Ansatz ohne 20 Zeilen Code
// Das spiel liest bereits alle Parameter aus und speichert sie in "BIS_fnc_storeParamsValues_data"
// 1. Namen aller Parameter, 2. führe globale Variable mit diesem Namen ein
_paramNames = ("true" configClasses (missionConfigFile >> "Params")) apply {configName _x};
{	
	// braucht nicht global sein, da init.sqf für jeden ausgeführt wird
	missionNamespace setVariable [_x, [_x] call BIS_fnc_getParamValue];
} forEach _paramNames;

diag_log format ["%1 --- preinit.sqf is processed",diag_ticktime];