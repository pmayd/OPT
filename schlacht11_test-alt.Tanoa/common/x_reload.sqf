// by Xeno

//angepasst von psycho
#include "../../../setup.sqf"
private ["_config","_count","_i","_magazines","_object","_type","_type_name"];
_object = _this select 0;
_type = typeof _object;
if (_object isKindOf "ParachuteBase") exitWith {};
if (_object isKindOf "Man") exitWith {};
x_reload_time_factor = 5;


_object action ["engineOff", _object];
if (!alive _object) exitWith {};
//_object setFuel 0;
//_object setVehicleAmmo 1;
_dummy = position _object;

_type_name = getText(configFile >> "CfgVehicles" >> format["%1", _type] >> "displayName");
if (player == driver _object) then {
	systemchat format ["Wartung %1... Bitte warten...", _type_name];
};

#ifndef __OPT_SERVICE_NO_AMMO__
_magazines = getArray(configFile >> "CfgVehicles" >> _type >> "magazines");
sleep x_reload_time_factor;

/*
if (count _magazines > 0) then {
	_removed = [];
	{
		if (!(_x in _removed)) then {
			_object removeMagazines _x;
			_removed set [count _removed, _x];
		};
	} forEach _magazines;
	{
		if (player == driver _object) then {systemChat format ["Reloading %1", _x]};
		sleep x_reload_time_factor;
		if (!alive _object) exitWith {};
		_object addMagazine _x;
	} forEach _magazines;
};*/

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
			if (player == driver _object) then {systemChat format ["Reloading %1", _mag_disp_name]};
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

_turrets = [configFile >> "CfgVehicles" >> _type >> "Turrets"] call tcb_fnc_returnVehicleTurret;
if (count _turrets > 0) then {
	[_turrets, []] call _reloadTurrets;
};

if (!alive _object) exitWith {};
_object setVehicleAmmo 1;
#endif


sleep x_reload_time_factor;
if (!alive _object) exitWith {};
if (player == driver _object) then {
	systemChat "Reparieren...";
};
while {damage _object > 0 && {((vehicle player) distance2D _dummy) < 1}} do {
	_object setDamage ((damage _object) - 0.005);
	sleep 0.15;
};
if (((vehicle player) distance2D _dummy) >= 1) exitWith {
	if (player == driver _object) then {
		systemChat "Wartung abgebrochen...";
	};
};
_object setDamage 0;
_object setRepairCargo 1;

sleep x_reload_time_factor;
if (!alive _object) exitWith {};
if (player == driver _object) then {
	systemChat "Auftanken...";
};
while {fuel _object < 0.99 && {((vehicle player) distance2D _dummy) < 1}} do {
	_object setFuel (fuel _object + 0.005);
	sleep 0.15;
};
if (((vehicle player) distance2D _dummy) >= 1) exitWith {
	if (player == driver _object) then {
		systemChat "Wartung abgebrochen...";
	};
};
_object setFuelCargo 1;
_object setAmmoCargo 1;

sleep x_reload_time_factor;
if (!alive _object) exitWith {};
if (player == driver _object) then {
	systemChat format ["%1 ist bereit...", _type_name];
};

reload _object;
_object action ["engineOn", _object];