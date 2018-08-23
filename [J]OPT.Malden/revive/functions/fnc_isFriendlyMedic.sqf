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

params ["_unit"];

private _return = false;

_isMedic = _unit call FUNC(isMedic);

if (
	alive _unit and
	UNIT_SIDE(_unit) == PLAYER_SIDE and
	_unit getVariable "FAR_isUnconscious" == 0 and
	(_isMedic || FAR_REVIVE_MODE > 0)
) then {
	_return = if (FAR_REVIVE_MODE > 2 and !_isMedic) then {
		false
	} else {
		true
	};
};

_return