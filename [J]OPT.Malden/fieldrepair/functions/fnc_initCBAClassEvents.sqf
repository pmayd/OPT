/**
* Author: James
* initialize CBA class EH
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_initCBAClassEvents.sqf;
*
*/
#include "script_component.hpp"

["LandVehicle", "init", {
    params ["_vec"];
	[
		_vec, 
		[
			"<t color='#ff0000'>"+STR_FIELD_REPAIR+"</t>", 
			{[_this select 0] call FUNC(repairVehicle)},
			[], 
			-1, 
			false,
			true, 
			'',
			QUOTE([_target] call FUNC(needRepair))
		]
	] remoteExecCall ["addAction", 0, true];

	
	[
		_vec, 
		[
			"<t color='#ff0000'>"+STR_SERIOUS_REPAIR+ "</t>", 
			{[_this select 0] call FUNC(heavyRepair)},
			[], 
			-1, 
			false, 
			true, 
			'',
			format["_truck = vehicle _this; [_target] call %1 and _truck getVariable ['%2', -1] != -1 and {alive _target} and {speed _truck < 3}", QFUNC(vehicleDamaged), QGVAR(repair_cargo)]
		]
	] remoteExecCall ["addAction", 0, true];

	if (getRepairCargo _vec > 0) then {
		_vec setRepairCargo 0;
		_vec setVariable [QGVAR(repair_cargo), 1]; 
	};

}, nil, nil, true] call CBA_fnc_addClassEventHandler;

["Air", "init", {
    params ["_vec"];
   
	[
		_vec, 
		[
			"<t color='#ff0000'>"+STR_FIELD_REPAIR+"</t>", 
			{[_this select 0] call FUNC(repairVehicle)},
			[], 
			-1, 
			false,
			true, 
			'',
			QUOTE([_target] call FUNC(needRepair))
		]
	] remoteExecCall ["addAction", 0, true];
     
	[
		_vec, 
		[
			"<t color='#ff0000'>"+STR_SERIOUS_REPAIR+ "</t>", 
			{[_this select 0] call FUNC(heavyRepair)},
			[], 
			-1, 
			false, 
			true, 
			'',
			format["_truck = vehicle _this; [_target] call %1 and _truck getVariable ['%2', -1] != -1 and {alive _target} and {speed _truck < 3}", QFUNC(vehicleDamaged), QGVAR(repair_cargo)]
		]
	] remoteExecCall ["addAction", 0, true];    

	if (getRepairCargo _vec > 0) then {
		_vec setRepairCargo 0;
		_vec setVariable [QGVAR(repair_cargo), 1]; 
	};

}, nil, nil, true] call CBA_fnc_addClassEventHandler;