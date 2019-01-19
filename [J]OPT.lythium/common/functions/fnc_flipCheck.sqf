/**
* Description:
* condition for detecting flipped vehicles
*
* Author:
* James
*
* Arguments:
* 0: <OBJECT> vehicle to check
* 1: <OBJECT> unit to give action to flip
*
* Return Value:
* <BOOLEAN> true - vehicle is flipped, false - otherwise
*
* Server only:
* no
*
* Public:
* no - should be called via condition of addAction
*
* Global:
* no
*
* Sideeffects:
* no
*
* Example:
* [vec, unit] call EFUNC(common,flipCheck);
*/
#include "script_component.hpp"

/* PARAMS */
params 
[
    ["_target", objNull, [objNull], 1],
    ["_caller", objNull, [objNull], 1]
];

/* VALIDATION */
private _ret = false;
if (_target isEqualTo objNull or _caller isEqualTo objNull) exitWith{_ret};

/* CODE BODY */
// check speed of vehicle, distance between target and caller, type and status of vehicle and facing dir 
private _cond = 
(
    (speed _target < 1) and 
    ((_target distance _caller) < 10) and 
    (_target isKindOf 'landVehicle') and 
    (alive _target) and 
    ((vectorUp _target) select 2 < 0.4)
);

if (_cond) then 
{
    _ret = true;
};

_ret
