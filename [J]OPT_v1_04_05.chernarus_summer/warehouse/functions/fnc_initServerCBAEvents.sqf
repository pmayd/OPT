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
    params ["_unitType", "_spawnPos"];

    [_unitType, _spawnPos] call FUNC(spawnVehicle);

}] call CBA_fnc_addEventHandler;

[QGVAR(handleDeadVehicle), {
     (_this select [0,2]) call FUNC(handleDeadVehicle);
}] call CBA_fnc_addEventHandler;