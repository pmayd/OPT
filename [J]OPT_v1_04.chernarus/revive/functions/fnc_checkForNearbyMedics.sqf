/**
* Author: James
* find near medics
*
* Arguments:
* None
*
* Return Value:
* 0: <STRING> message for player
*
* Example:
* [] call fnc_checkForNearbyMedics.sqf;
*
*/
#include "script_component.hpp"

private _units = nearestObjects [getpos player, ["CAManBase", "Car", "Air", "Ship"], 300];
private _dist = FAR_REVIVE_NEARBY_MEDIC_DISTANCE;
private _medics = [];
private _hintMsg = "";
	
// Find nearby friendly medics
if (count _units > 1) then {
	{
		if (_x isKindOf "Car" || _x isKindOf "Air" || _x isKindOf "Ship") then {
			if (alive _x && count (crew _x) > 0) then {
				{
					if ([_x] call FUNC(isFriendlyMedic)) exitWith {
						_medics pushBack _x;
					};
				} forEach crew _x;
			};
		} else {
			if ([_x] call FUNC(isFriendlyMedic)) then {
				_medics pushBack _x;
			};
		};
	} forEach _units;
};

// Sort medics by distance
private _unit = objNull;
if (count _medics > 0) then {
	{
		if (player distance _x < _dist) then {
			_unit = _x;
			_dist = player distance _x;
		};
	} forEach _medics;

	if (!isNull _unit) then {
		private _unitName	= UNIT_NAME(_unit);	
		_hintMsg = format["Sanitäter in der Nähe:\n%1 ist %2m entfernt.", _unitName, floor _dist];
	};
} else {
	_hintMsg = "Kein Sanitäter in der Nähe.";
};

_hintMsg