/**
* Author: James
* fully repair a vehicle - no damage left
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [vehicle] call fnc_fullRepair.sqf;
*
*/
#include "script_component.hpp"

params [["_veh", objNull]];

if (_veh isEqualTo objNull) exitWith {false};

_veh setDamage 0;
[_veh] call FUNC(setMinFuel);

true

