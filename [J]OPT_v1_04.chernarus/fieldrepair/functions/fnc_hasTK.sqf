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

private _ret = false;

if (
	("ToolKit" in (items player)) or 
	("ToolKit" in (itemCargo _veh)) or 
	((_veh getVariable [QGVAR(longRepairTimes), 0]) < DEFAULT_FREE_REPAIRS)
	) then {
		_ret = true
};

_ret
