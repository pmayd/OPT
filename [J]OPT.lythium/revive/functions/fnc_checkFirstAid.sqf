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

// damage calculation
private _damagedParts = ({_x > (FAR_REVIVE_FIRST_AID_MIN_DAMAGE + _multiplier * FAR_REVIVE_FIRST_AID_MULTIPLIER) } count (getAllHitPointsDamage _caller select 2)) + ([0, 1] select (damage _caller > (FAR_REVIVE_FIRST_AID_MIN_DAMAGE + _multiplier * FAR_REVIVE_FIRST_AID_MULTIPLIER))); 

// Make sure player is alive and not unconscious and has at least 25% damage
if(!alive _caller || {_caller getVariable "FAR_isUnconscious" == 1} || FAR_isDragging || _damagedParts == 0) exitWith {
	_return
};

true

