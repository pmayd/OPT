/**
* Author: James
* initialize player CBA Events
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [parameter] call fnc_initPlayerCBAEvents.sqf;
*
*/
#include "script_component.hpp"


[QGVAR(clearMarker), {
	params ["_name"];

	[_name] call FUNC(clearMarker);

}] call CBA_fnc_addEventHandler;