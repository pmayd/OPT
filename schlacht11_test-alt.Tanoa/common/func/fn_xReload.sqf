// by Xeno

//angepasst von psycho
//#include "x_setup.sqf"
private ["_config","_count","_i","_magazines","_object","_type","_type_name"];
_object = _this select 0;
_type = typeof _object;
if (_object isKindOf "ParachuteBase") exitWith {};
x_reload_time_factor = 1;


_object action ["engineOff", _object];
if (!alive _object) exitWith {};
_object setFuel 0;

/*
_object setVehicleAmmo 1;

_type_name = getText(configFile >> "CfgVehicles" >> format["%1", _type] >> "displayName");
_object vehiclechat format ["Servicing %1... Please stand by...", _type_name];
_magazines = getArray(configFile >> "CfgVehicles" >> _type >> "magazines");


if (count _magazines > 0) then {
	_removed = [];
	{
		if (!(_x in _removed)) then {
			_object removeMagazines _x;
			_removed pushBack _x;
		};
	} forEach _magazines;
	{
		_object vehiclechat format ["Reloading %1", _x];
		sleep x_reload_time_factor;
		if (!alive _object) exitWith {};
		_object addMagazine _x;
	} forEach _magazines;
};


_turrets = [configFile >> "CfgVehicles" >> _type >> "Turrets"] call tcb_fnc_returnVehicleTurrets;


_reloadTurrets = {
	private ["_turrets", "_path"];
	_turrets = _this select 0;
	_path = _this select 1;

	private ["_i"];
	_i = 0;
	while {_i < (count _turrets)} do {
		private ["_turretIndex", "_thisTurret"];
		_turretIndex = _turrets select _i;
		_thisTurret = _path + [_turretIndex];
		
		_magazines = _object magazinesTurret _thisTurret;
		if (!alive _object) exitWith {};
		_removed = [];
		{
			if (!(_x in _removed)) then {
				_object removeMagazinesTurret [_x, _thisTurret];
				_removed pushBack _x;
			};
		} forEach _magazines;
		if (!alive _object) exitWith {};
		{
			_mag_disp_name = getText(configFile >> "CfgMagazines" >> format["%1", _type] >> "displayName");
			if (_mag_disp_name == "") then {_mag_disp_name = _x};
			_object vehiclechat format ["Reloading %1", _mag_disp_name];
			sleep x_reload_time_factor;
			if (!alive _object) exitWith {};
			_object addMagazineTurret [_x, _thisTurret];
			sleep x_reload_time_factor;
			if (!alive _object) exitWith {};
		} forEach _magazines;
		
		if (!alive _object) exitWith {};
		
		[_turrets select (_i + 1), _thisTurret] call _reloadTurrets;
		_i = _i + 2;
		if (!alive _object) exitWith {};
	};
};


if (count _turrets > 0) then {
	[_turrets, []] call _reloadTurrets;
};


if (!alive _object) exitWith {};
_object setVehicleAmmo 1;
*/

sleep x_reload_time_factor;
if (!alive _object) exitWith {};
_object vehiclechat "Repairing...";
_object setDamage 0;
sleep x_reload_time_factor;
if (!alive _object) exitWith {};
_object vehiclechat "Refueling...";
while {fuel _object < 0.99} do {
	_object setFuel 1;
	sleep 0.01;
};
sleep x_reload_time_factor;
if (!alive _object) exitWith {};
_object vehiclechat format ["%1 is ready...", _type_name];

reload _object;
_object action ["engineOn", _object];