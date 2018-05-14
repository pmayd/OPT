/**
* Author: James
* partially repair a vehicle - if damage is too high, rest damage remains
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [vehicle] call fnc_partRepair.sqf;
*
*/
#include "script_component.hpp"


params [["_veh", objNull]];

if (_veh isEqualTo objNull) exitWith {false}; 

// repair each part if it is damaged more than 30%, but repair only 90%
{
	private _dmg = _veh getHitPointDamage _x;
	if (not isNil {_dmg}) then {
		if ( _dmg > 0.3 ) then {
				_veh setHitPointDamage [_x, 0.1];
		};
	};

} foreach GVAR(repair_hps);

[_veh] call FUNC(setMinFuel);

true