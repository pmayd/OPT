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
    params ["_unitType", "_spawnPos", "_empty_pos"];

    [_unitType, _spawnPos, _empty_pos] spawn FUNC(spawnVehicle);

}] call CBA_fnc_addEventHandler;

[QGVAR(handleDeadVehicle), {
    (_this) call FUNC(handleDeadVehicle);
}] call CBA_fnc_addEventHandler;