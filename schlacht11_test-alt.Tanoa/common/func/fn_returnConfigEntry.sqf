/*
	File: returnConfigEntry.sqf
	Author: Joris-Jan van 't Land

	Description:
	Explores parent classes in the run-time config for the value of a config entry.
		
	Parameter(s):
	_this select 0: starting config class (Config)
	_this select 1: queried entry name (String)
		
	Returns:
	Number / String - value of the found entry
*/
if ((count _this) < 2) exitWith {nil};
private ["_config", "_entryName"];
_config = _this select 0;
_entryName = _this select 1;
if ((typeName _config) != (typeName configFile)) exitWith {nil};
if ((typeName _entryName) != (typeName "")) exitWith {nil};
private ["_entry", "_value"];
_entry = _config >> _entryName;
if (((configName (_config >> _entryName)) == "") && (!((configName _config) in ["CfgVehicles", "CfgWeapons", ""]))) then {
	[inheritsFrom _config, _entryName] call tcb_fnc_returnConfigEntry;
} else {
	if (isNumber _entry) then {
		_value = getNumber _entry;
	} else {
		if (isText _entry) then {_value = getText _entry};
	};
};

if (isNil "_value") exitWith {nil};
_value