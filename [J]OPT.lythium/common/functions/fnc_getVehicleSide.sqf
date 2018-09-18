/**
* Author: James
* read side from config
*
* Arguments:
* 0: <OBJECT> vehicle
*
* Return Value:
* 0: <SIDE> side of vehicle
*
* Example:
* [vehicle] call fnc_getVehicleSide.sqf;
*
*/
#include "script_component.hpp"

params [
    ["_vec", objNull, [objNull], 1]
];

if (_vec isEqualTo objNull) exitWith{};

private _sideNum = getNumber (configFile >> "CfgVehicles" >> typeOf _vec >> "side");
private _side = switch (_sideNum) do {
    case 0: {east};
    case 1: {west};
    case 2: {resistance};
    default {sideUnknown};
};

_side