//	fn_iconType

private ["_v","_i"];
_v = _this select 0;
_i = _v getVariable ["icontype",""];

if (_i == "") then {
	_i = getText (configFile >> "CfgVehicles" >> typeOf _v >> "icon");
	_v setVariable ["icontype",_i];
};

_i