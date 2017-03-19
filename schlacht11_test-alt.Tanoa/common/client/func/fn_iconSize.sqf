//	fn_iconSize

//changed by psycho

private ["_v","_i"];
_v = _this select 0;
_i = 0;

/*
if (_v isKindOf "Man") exitWith {_i = 22;_i;};
if (_v isKindOf "LandVehicle") exitWith {_i = 28;_i;};
if (_v isKindOf "Air") exitWith {_i = 28;_i;};
if (_v isKindOf "Ship") exitWith {_i = 26;_i;};
*/

_i = switch (true) do {
	case (_v isKindOf "Man") : {18};
	case (_v isKindOf "LandVehicle") : {22};
	case (_v isKindOf "Air") : {24};
	case (_v isKindOf "Ship") : {22};
	default {18};
};

_i