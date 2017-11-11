////////////////////////////////////////////////
// Show Nearby Friendly Medics
////////////////////////////////////////////////
private ["_unit"];
_return = false;
_unit = _this;
_isMedic = _unit call opt_addons_fnc_isMedic;

if (alive _unit && {(_unit getVariable "opt_var_playerSide") == FAR_PlayerSide} && {_unit getVariable "FAR_isUnconscious" == 0} && {_isMedic || FAR_ReviveMode > 0}) then {
	_return = if (FAR_ReviveMode > 2 && {!_isMedic}) then {false} else {true};
};

_return