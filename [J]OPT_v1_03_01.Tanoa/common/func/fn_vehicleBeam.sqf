// by psycho
params ["_beamPos","_target","_ID"];

/*
_svec = sizeOf (typeOf _target);
_isFlat = _beamPos isFlatEmpty [_svec / 2, 30, 0.7, _svec, 0, false, _target];
if (count _isFlat > 1) then {
	_posv1 = _isFlat;
	_posv1 set [2, 0];
};*/

["<t size='0.8' shadow='1' color='#ffffff'>Fahrzeug versetzt</t>", (safeZoneX - 0.2), (safeZoneY + 0.3), 3, 1, 0, 1] spawn BIS_fnc_dynamicText;
_posX = (_beamPos select 0);
_posY = (_beamPos select 1);
_target setPosATL [_posX, _posY, 0.1];

_target removeAction _ID;

// log beam position
_grid = mapGridPosition _target;
_vec = (getText(configFile >> 'CfgVehicles' >> typeOf _target >> 'displayName'));
_txt = format ["%1 wurde auf folgende Position gebeamt: %2", _vec, _grid];
["opt_logEvent", _txt] call tcb_fnc_netCallEvent;