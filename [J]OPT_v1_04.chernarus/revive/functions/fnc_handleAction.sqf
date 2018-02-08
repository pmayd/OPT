/**
* Author: James
* call appropriate function 
*
* Arguments:
* 0: <OBJECT> target add action is attached to
* 1: <OBJECT> unit that called the add action
* 2: <STRING> action to handle
*
* Return Value:
* None
*
* Example:
* [cursorObject, player, "action_revive"] call fnc_handleAction.sqf;
*
*/
#include "script_component.hpp"

params ["_target", "_caller", "_action"];

////////////////////////////////////////////////
// Handle actions
////////////////////////////////////////////////
switch (_action) do {
	case "action_revive": {
		[_target, _caller] spawn FUNC(handleRevive);
	};
    case "action_first_aid": {
		[_caller] spawn FUNC(handleFirstAid);
	};
	case "action_stabilize": {
		[_target, _caller] spawn FUNC(handleStabilize);
	};
	case "action_suicide": {
		_caller setDamage 1;
	};
	case "action_drag": {
		[_target] spawn FUNC(drag);
	};
	case "action_release": {
		[] spawn FUNC(release);
	};
	default {

	};
};
