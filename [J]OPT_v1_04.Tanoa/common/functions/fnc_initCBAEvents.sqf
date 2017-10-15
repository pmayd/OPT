/**
* Author: James
* initialize CBA Event Handlers
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

// fügt einen AddAction Eintrag hinzu
[QGVAR(addAction), {
	params ["_obj", "_parameter"];

	_obj addAction _parameter;

}] call CBA_fnc_addEventHandler;