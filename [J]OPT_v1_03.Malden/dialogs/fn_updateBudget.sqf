/*
	author: 		James
	file: 			fn_updateBudget.sqf
	version: 		1.00
	date: 			2017-05-20
	purpose: 		Aktualisiert Budget Anzeige im Vehicle Order Dialog	
	arguments: 	none
	return value:	none

	example call: 		[] execVM "fn_updateBudget.sqf"
*/
disableSerialization;

// arguments
private _display = uiNamespace getVariable ["opt_orderDialog", displayNull];
private _budget = _display displayCtrl 20102;

// begin of script
if (_display isEqualTo displayNull) exitWith {};

[_budget] call opt_fnc_renderBudget;