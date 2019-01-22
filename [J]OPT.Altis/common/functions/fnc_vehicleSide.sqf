/**
* Description:
* read vehicle side from config file
*
* Author:
* James
*
* Arguments:
* 0: <OBJECT> vehicle
*
* Return Value:
* <SIDE> side of vehicle
*
* Server only:
* no
*
* Public:
* yes
*
* Global:
* no
*
* Sideeffects:
* no
*
* Example:
* [vehicle] call EFUNC(common,vehicleSide);
*/
#include "script_component.hpp"

/* PARAMS */
params 
[
    ["_vec", objNull, [objNull], 1]
];

/* VALIDATION */
if (_vec isEqualTo objNull) exitWith{sideUnknown};

/* CODE BODY */
private _sideNum = getNumber (configFile >> "CfgVehicles" >> typeOf _vec >> "side");
private _side = switch (_sideNum) do {
    case 0: {east};
    case 1: {west};
    case 2: {resistance};
    default {sideUnknown};
};

_side