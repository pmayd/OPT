/**
* Author: James
* initialize client side CBA Event Handler
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

// add killed EH to all kind of vehicles, either on map or later spawned via crteateVehicle arrayIntersect
// -> log kill and delete if near base
["AllVehicles", "killed", {
    (_this select [0,2]) call FUNC(handleDeadVehicle);

}] call CBA_fnc_addClassEventHandler;
