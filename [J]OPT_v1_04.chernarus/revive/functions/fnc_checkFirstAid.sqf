/**
* Author: James
* check if unit can do first aid action
*
* Arguments:
* 0: <OBJECT> unit that called the action
*
* Return Value:
* 0: <BOOL> true - patient can use first aid, false - otherwise
*
* Example:
* [patient, healer] call fnc_checkFirstAid.sqf;
*
*/
#include "script_component.hpp"

params ["_caller"];

private _return = false;
private _multiplier = _caller getVariable ["FAR_firstAidMultiplicator", 0];

// Make sure player is alive and not unconscious and has at least 25% damage
if(!alive _caller || {_caller getVariable "FAR_isUnconscious" == 1} || FAR_isDragging || damage _caller < (FAR_REVIVE_FIRST_AID_MIN_DAMAGE + _multiplier * FAR_REVIVE_FIRST_AID_MULTIPLIER)) exitWith {
	_return
};

true

