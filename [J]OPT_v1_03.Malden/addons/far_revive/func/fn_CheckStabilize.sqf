////////////////////////////////////////////////
// Stabilize Action Check
////////////////////////////////////////////////
private ["_target", "_isTargetUnconscious", "_isDragged"];
_return = false;

// Unit that will excute the action
_isPlayerUnconscious = player getVariable "FAR_isUnconscious";
_target = cursorTarget;

// Make sure player is alive and target is an injured unit
if(!alive player || {_isPlayerUnconscious == 1} || {FAR_isDragging} || {isNil "_target"} || {!alive _target} || {!isPlayer _target && !FAR_Debugging} || {(_target distance player) > 2}) exitWith {
	_return
};
_isTargetUnconscious = _target getVariable "FAR_isUnconscious";
_isTargetStabilized = _target getVariable "FAR_isStabilized";
_isDragged = _target getVariable "FAR_isDragged";
_Handler = _target getVariable "tcb_healer";

// Make sure target is unconscious and hasn't been stabilized yet
if (_isTargetUnconscious == 1 && {_isTargetStabilized == 0} && {_isDragged == 0} && {isNull _Handler}) then {
	_return = true;
};

_return