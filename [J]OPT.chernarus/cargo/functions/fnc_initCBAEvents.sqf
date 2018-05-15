/**
* Author: James
* initialize CBA Events
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


[QGVAR(deactivateDragging), {
	params ["_item"];

	[_item] call FUNC(deactivateDragging);

}] call CBA_fnc_addEventHandler;

[QGVAR(initDragging), {
	params ["_item"];

	[_item] call FUNC(initDragging);

}] call CBA_fnc_addEventHandler;