/**
* Author: James
* add addAction menu entries for player 
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_playerActions.sqf;
*
*/
#include "script_component.hpp"

if (alive player && player isKindOf "CAManBase") then {
	// addAction args: title, filename, (arguments, priority, showWindow, hideOnUse, shortcut, condition, positionInModel, radius, radiusView, showIn3D, available, textDefault, textToolTip)
	player addAction [
		"<t color=""#C90000"">" + FAR_REVIVE_ACTION_REVIVE + "</t>", 
		{params ["_target", "_caller"]; [_target, _caller, "action_revive"] call FUNC(handleAction);},
		[],
		10, 
		true, 
		true, 
		"", 
		format["[cursorObject, _this] call %1", QFUNC(checkRevive)]
	];
	player addAction [
		"<t color=""#C90000"">" + FAR_REVIVE_ACTION_STABILIZE + "</t>", 
		{params ["_target", "_caller"]; [_target, _caller, "action_stabilize"] call FUNC(handleAction);},
		[], 
		10, 
		true,
		true, 
		"", 
		format["[cursorObject, _this] call %1", QFUNC(checkStabilize)]
	];
	/*
	player addAction [
		"<t color=""#C90000"">" + FAR_REVIVE_ACTION_SUICIDE + "</t>", 
		{params ["_target", "_caller"]; [_target, _caller, "action_suicide"] call FUNC(handleAction);},
		[],
		9, 
		false, 
		true, 
		"", 
		QUOTE([_this] call FUNC(checkSuicide))
	];
	*/
	player addAction [
		"<t color=""#C90000"">" + FAR_REVIVE_ACTION_DRAG + "</t>", 
		{params ["_target", "_caller"]; [_target, _caller, "action_drag"] call FUNC(handleAction);}, 
		[],
		9, 
		false, 
		true, 
		"", 
		format["[cursorObject, _this] call %1", QFUNC(checkDragging)]
	];
};

true