/**
* Author: James
* check whether player is medic
*
* Arguments:
* 0: <OBJECT> target we want to check
*
* Return Value:
* None
*
* Example:
* [player] call fnc_isMedic.sqf;
*
*/
#include "script_component.hpp"

params ["_unit"];

private _isMedic = if (typeOf _unit in GVARMAIN(medic)) then {
	true
} else {
	false
};
	
_isMedic