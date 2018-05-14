/**
* Author: James
* initialize player CBA Event Handler
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

[QGVAR(removeMarker), {
	params ["_unit"];

	[_unit] call FUNC(removeMarker);

}] call CBA_fnc_addEventHandler;

[QGVAR(createMarker), {
	params ["_unit"];

	[_unit] call FUNC(createMarker);

}] call CBA_fnc_addEventHandler;

[QGVAR(rotate), {
	params ["_unit", "_angle"];
	
	_unit setDir _angle;

}] call CBA_fnc_addEventHandler;