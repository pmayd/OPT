/**
* Author: James
* check whether player can stabilize target 
*
* Arguments:
* 0: <OBJECT> target add action is attached to
* 1: <OBJECT> unit that called the add action
*
* Return Value:
* 0: <BOOL> true - patient can be stabilized, false - otherwise
*
* Example:
* [cursorObject, player] call fnc_checkStabilize.sqf;
*
*/
#include "script_component.hpp"

params ["_target", "_caller"];

private _return = false;
// Unit that will excute the action
private _isPlayerUnconscious = _caller getVariable "FAR_isUnconscious";

// Make sure _caller is alive and target is an injured unit
if(!alive _caller || {_isPlayerUnconscious == 1} || {FAR_isDragging} || {isNil "_target"} || {!alive _target} || {!isPlayer _target && !FAR_Debugging} || {(_target distance _caller) > 5}) exitWith {
	_return
};

private _isTargetUnconscious = _target getVariable "FAR_isUnconscious";
private _isTargetStabilized = _target getVariable "FAR_isStabilized";
private _isDragged = _target getVariable "FAR_isDragged";
private _Handler = _target getVariable "FAR_healer";

// Make sure target is unconscious and hasn't been stabilized yet
if (_isTargetUnconscious == 1 && {_isTargetStabilized == 0} && {_isDragged == 0} && {isNull _Handler}) then {
	_return = true;
};

_return