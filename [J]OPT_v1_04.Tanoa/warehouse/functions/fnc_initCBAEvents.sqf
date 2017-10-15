/**
* Author: James
* initialize CBA Event Handler
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_initCBAEvents.sqf;
*
*/
#include "script_component.hpp"

[QGVAR(spawnVehicle), {

    params ["_unitType", "_spawnPos"];

    [_unitType, _spawnPos] call FUNC(spawnVehicle);

}] call CBA_fnc_addEventHandler;