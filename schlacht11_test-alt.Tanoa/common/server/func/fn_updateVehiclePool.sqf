/*
	Vehicle Order scripts

	Author: Phantom (OPT MOD Team)
		Modified by schmingo (OPT MOD Team)

	v2015-03-01 | this script is part of OperationPandoraTrigger ArmA3 script collection
*/

//changed by psycho
params ["_unitType", "_unitCost", "_spawnpos", "_side"];

//update budget
if (toUpper(_side) == "WEST") then {
	opt_west_budget = opt_west_budget - _unitCost;
	publicVariable "opt_west_budget";
} else {
	opt_east_budget = opt_east_budget - _unitCost;
	publicVariable "opt_east_budget";
};


[_unitType, _spawnpos] call opt_fnc_spawnVehicle;

true