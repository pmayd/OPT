/**
* Author: James
* determine repair time in dependence of damage
*
* Arguments:
* 0: <OBJECT> vehicle
*
* Return Value:
* 0: <NUMBER> repair time in seconds
*
* Example:
* [vehicle] call fnc_getPartsRepairTime.sqf;
*
*/
#include "script_component.hpp"

params [["_veh", objNull]];

if (_veh isEqualTo objNull) exitWith {false};

private _rprTime = 0;
{
	private _cdmg = _veh getHitPointDamage (_x);

	if (not isNil {_cdmg} ) then {
		if (_cdmg > 0.64) exitWith {
			if (_x in GVAR(hardRepairParts)) then {
				_rprTime = _rprTime + DEFAULT_FIELDREPAIR_EACH_HARDPART_TIME;

			} else {
				_rprTime = _rprTime + DEFAULT_FIELDREPAIR_EACH_PART_TIME;

			};

		};

	};

} forEach GVAR(repair_hps);

_rprTime

