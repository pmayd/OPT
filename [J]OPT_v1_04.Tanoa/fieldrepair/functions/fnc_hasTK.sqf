/**
* Author: James
* determine number of tool kits the player has
*
* Arguments:
* 0: <OBJECT> vehicle
*
* Return Value:
* 0: <NUMBER> number of tool kits
*
* Example:
* [] call fnc_hasTK.sqf;
*
*/
#include "script_component.hpp"

params [["_veh", objNull]];

if (_veh isEqualTo objNull) exitWith {false};

private _ret = 0;

if ("ToolKit" in (items player)) then {_ret = _ret + 1};
if ("ToolKit" in (itemCargo _veh)) then {_ret = _ret + 1};
if ( (_veh getVariable [QGVAR(longRepairTimes), 0] ) < DEFAULT_FREE_REPAIRS) then {
	_ret = _ret + DEFAULT_FREE_REPAIRS - (_veh getVariable [QGVAR(longRepairTimes), 0])
};

_ret
