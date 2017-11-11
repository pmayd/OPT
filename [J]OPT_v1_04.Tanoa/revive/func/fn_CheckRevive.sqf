////////////////////////////////////////////////
// Revive Action Check
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
_isDragged = _target getVariable "FAR_isDragged";
_Handler = _target getVariable "tcb_healer";

// Make sure target is unconscious and player is a medic 
if (_isTargetUnconscious == 1 && {_isDragged == 0} && {isNull _Handler} && {(player call opt_addons_fnc_isMedic) || FAR_ReviveMode > 0}) then {
	_return = true;
	// [ReviveMode] Check if player has a Medikit
	if ( FAR_ReviveMode > 1 && !("Medikit" in (items player)) ) then {
		_return = false;
	};
};

_return