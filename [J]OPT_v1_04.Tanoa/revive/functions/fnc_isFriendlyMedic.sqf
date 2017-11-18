/**
* Author: James
* check if unit is friendly medic
*
* Arguments:
* 0: <OBJECT> unit to check
*
* Return Value:
* 0: <BOOL> true - if unit is medic, false - otherwise
*
* Example:
* [] call fnc_isFriendlyMedic.sqf;
*
*/
#include "script_component.hpp"

params ["_unit"]:

private _return = false;

_isMedic = _unit call FUNC(isMedic);

if (alive _unit && {([_unit] call EFUNC(common,getPlayerSide)) == FAR_PlayerSide} && {_unit getVariable "FAR_isUnconscious" == 0} && {_isMedic || FAR_ReviveMode > 0}) then {
	_return = if (FAR_ReviveMode > 2 && {!_isMedic}) then {
		false
	} else {
		true
	};
};

_return