/**
* Author: James
* initialize server side CBA Event Handler
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_initServerCBAEvents.sqf;
*
*/
#include "script_component.hpp"

/* CUSTOM EH */
[QGVAR(spawnVehicle), {
    params ["_unit", "_vecType", "_spawnObj"];

    [_unit, _vecType, _spawnObj] spawn FUNC(spawnVehicle);

}] call CBA_fnc_addEventHandler;

[QGVAR(handleDeadVehicle), {
    (_this) call FUNC(handleDeadVehicle);
}] call CBA_fnc_addEventHandler;