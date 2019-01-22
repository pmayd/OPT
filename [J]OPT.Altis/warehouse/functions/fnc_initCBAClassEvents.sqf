/**
* Author: James
* initialize CBA class event handler
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

// add killed EH to all kind of vehicles, either on map or later spawned via crteateVehicle arrayIntersect
// -> log kill and delete if near base
["LandVehicle", "killed", {
    _this remoteExecCall [QFUNC(handleDeadVehicle), 2, false];

}] call CBA_fnc_addClassEventHandler;

["Air", "killed", {
    _this remoteExecCall [QFUNC(handleDeadVehicle), 2, false];

}] call CBA_fnc_addClassEventHandler;

