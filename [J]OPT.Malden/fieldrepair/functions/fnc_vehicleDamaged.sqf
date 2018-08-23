/**
* Author: James
* determine if vehicle is damaged
*
* Arguments:
* 0: <OBJECT> vehicle
*
* Return Value:
* 0: <BOOL> true: vehicle is damaged, false: not damaged
*
* Example:
* [vehicle] call fnc_vehicleDamaged.sqf;
*
*/
#include "script_component.hpp"

params [["_veh", objNull]];

if (_veh isEqualTo objNull) exitWith {false};

private _type = typeOf _veh;
private _flag = false;

{
	private _cdmg = _veh getHitPointDamage (_x);
	if (not isNil {_cdmg} ) then {
		if (_cdmg > 0.64) exitWith {_flag = true};
	};
} forEach GVAR(repair_hps);

_flag
