////////////////////////////////////////////////
// Suicide Action Check
////////////////////////////////////////////////
_return = false;
_isPlayerUnconscious = player getVariable ["FAR_isUnconscious",0];
if (alive player && {_isPlayerUnconscious == 1}) then {
	_return = true;
};

_return