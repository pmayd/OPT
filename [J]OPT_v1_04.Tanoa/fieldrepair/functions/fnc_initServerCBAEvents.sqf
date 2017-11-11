/**
* Author: James
* initialize player side CBA Event Handler
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_initPlayerCBAEvents.sqf;
*
*/
#include "script_component.hpp"

["AllVehicles", "init", {
    params ["_vec"];
    [QEGVAR(common,addAction), 
        [
            _vec, 
            [
				"<t color='#ff0000'>"+STR_FIELD_REPAIR+"</t>", 
				{[] call FUNC(repairVehicle)}
				, 
				[], 
				-1, 
				false,
				true, 
				'',
				QUOTE([_target] call FUNC(needRepair))
			]
        ]
    ] call CBA_fnc_globalEventJIP;

	[QEGVAR(common,addAction), 
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
				format["_truck= vehicle _this; _truck getVariable ['%1', -1] != -1 and {alive _target} and {_truck distance _target <= 15} and {(_target isKindOf 'LandVehicle' or _target isKindOf 'Ship' or _target isKindOf 'Air')} and {not %2} and {speed _target <= 3} and {(damage _target != 0)};", QGVAR(repair_cargo), GVAR(mutexAction)]
			]
        ]
    ] call CBA_fnc_globalEventJIP;

}] call CBA_fnc_addClassEventHandler;