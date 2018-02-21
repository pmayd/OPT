/**
* Author: James
* initialize CBA Events for players
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

[QGVAR(updateMarkerWithTimestemp), {
    params ["_marker"];
    [_marker] call FUNC(updateMarker);

}] call CBA_fnc_addEventHandler;