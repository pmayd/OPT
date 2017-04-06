private ["_unit", "_units", "_medics", "_hintMsg"];
	
_units = nearestObjects [getpos player, ["CAManBase", "Car", "Air", "Ship"], 300];
_medics = [];
_dist = 300;
_hintMsg = "";
	
// Find nearby friendly medics
if (count _units > 1) then {
	{
		if (_x isKindOf "Car" || _x isKindOf "Air" || _x isKindOf "Ship") then {
			if (alive _x && count (crew _x) > 0) then {
				{
					if (_x call opt_addons_fnc_IsFriendlyMedic) then {
						_medics = _medics + [_x];
						if (true) exitWith {};
					};
				} forEach crew _x;
			};
		} else {
			if (_x call opt_addons_fnc_IsFriendlyMedic) then {
				_medics = _medics + [_x];
			};
		};
	} forEach _units;
};

// Sort medics by distance
if (count _medics > 0) then {
	{
		if (player distance _x < _dist) then {
			_unit = _x;
			_dist = player distance _x;
		};
	} forEach _medics;

	if (!isNull _unit) then {
		_unitName	= name _unit;
		_distance	= floor (player distance _unit);	
		_hintMsg = format["Nearby Medic:\n%1 is %2m away.", _unitName, _distance];
	};
} else {
	_hintMsg = "No medic nearby.";
};

_hintMsg