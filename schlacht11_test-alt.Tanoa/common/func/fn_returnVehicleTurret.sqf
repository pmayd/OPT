/*
		File: fn_returnVehicleTurrets.sqf
		Author: Joris-Jan van 't Land

		Description:
		Function return the path to all turrets and sub-turrets in a vehicle.

		Parameter(s):
		_this select 0: vehicle config entry (Config)

		Returns:
		Array of Scalars and Arrays - path to all turrets
*/

if ((count _this) < 1) exitWith {[]};
private ["_entry"];

_entry = _this select 0;
if ((typeName _entry) != (typeName configFile)) exitWith {[]};
private ["_turrets", "_turretIndex"];
_turrets = [];
_turretIndex = 0;
for "_i" from 0 to ((count _entry) - 1) do {
	private ["_subEntry"];
	_subEntry = _entry select _i;
	if (isClass _subEntry) then {
		private ["_hasGunner"];
		_hasGunner = [_subEntry, "hasGunner"] call tcb_fnc_returnConfigEntry;
		if (!(isNil "_hasGunner")) then {
			if (_hasGunner == 1) then {
				_turrets pushBack _turretIndex;
				if (isClass (_subEntry >> "Turrets")) then {
					_sub = [_subEntry >> "Turrets"] call tcb_fnc_returnVehicleTurret;
					_turrets pushBack _sub;
				} else {
					_turrets pushBack [];
				};
			};
		};
		_turretIndex = _turretIndex + 1;
	};
};
_turrets