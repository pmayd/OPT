/**
* Author: James
* initialize server CBA Event Handler
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

[QGVAR(setFlagOwner), {
	params [_side, _flag];
	[_side, _flag] call FUNC(setFlagOwner);

}] call CBA_fnc_addEventHandler;