/**
* Author: James
* drag action
*
* Arguments:
* 0: <OBJECT> target the player wants to drag
*
* Return Value:
* None
*
* Example:
* [cursorObject] call fnc_handleAction.sqf;
*
*/
#include "script_component.hpp"

params ["_target"];
FAR_isDragging = true;

_target attachTo [player, [0, 1.1, 0.092]];
_target setVariable ["FAR_isDragged", 1, true];
player playMoveNow "AcinPknlMstpSrasWrflDnon";

// Rotation fix
[_target, 180] remoteExecCall ["setDir", -2, false];

// Add release action and save its id so it can be removed
_id = player addAction [
	"<t color=""#C90000"">" + FAR_REVIVE_ACTION_DROP + "</t>",
	{_caller = _this select 1; [cursorTarget, _caller, "action_release"] call FUNC(handleAction);},
	[], 
	10, 
	true, 
	true, 
	"", 
	"true"
];
hintSilent "Drücke 'C', falls du dich nicht bewegen kannst.";

// Wait until release action is used
waitUntil {
	!alive player || player getVariable "FAR_isUnconscious" == 1 || !alive _target || _target getVariable "FAR_isUnconscious" == 0 || !FAR_isDragging || _target getVariable "FAR_isDragged" == 0 
};

// Handle release action
FAR_isDragging = false;
	
if (!isNull _target && alive _target) then {
	//_target switchMove "AinjPpneMstpSnonWrflDnon";
	_target playActionNow "Unconscious";
	_target setVariable ["FAR_isDragged", 0, true];
	detach _target;
};
player removeAction _id;


true