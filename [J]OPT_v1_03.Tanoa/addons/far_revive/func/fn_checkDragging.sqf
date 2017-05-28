////////////////////////////////////////////////
// Dragging Action Check
////////////////////////////////////////////////
private ["_target", "_isPlayerUnconscious", "_isDragged"];
_return = false;
_target = cursorTarget;
_isPlayerUnconscious = player getVariable "FAR_isUnconscious";

if (!alive player || {_isPlayerUnconscious == 1} || {FAR_isDragging} || {isNil "_target"} || {!alive _target} || {!isPlayer _target && !FAR_Debugging} || {(_target distance player) > 2}) exitWith {
	_return;
};

// Target of the action
_isTargetUnconscious = _target getVariable "FAR_isUnconscious";
_isDragged = _target getVariable "FAR_isDragged"; 

if (_isTargetUnconscious == 1 && {_isDragged == 0}) then {
	_return = true;
};

_return