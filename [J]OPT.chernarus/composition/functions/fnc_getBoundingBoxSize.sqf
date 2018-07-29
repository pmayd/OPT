/**
* Author: James
* calculate the bounding box size of an object (larger value of bounding box)
*
* Arguments:
* 0: <STRING> classname for object to calculate bounding box size for
* 1: <BOOL> true - return 2D boundig box size, false - return 3D bounding box size
*
* Return Value:
* 0: <NUMBER> bounding box size
*
* Example:
* [vehicle] call fnc_getBoundingBoxSize.sqf;
*
*/
#include "script_component.hpp"

params [
    ["_type", "", ["s"], 1],
    ["_2D", true, [true], 1]
];

if (_type isEqualTo "") exitWith {0};

private _dummy = _type createVehicleLocal [0,0,0];
private _boundingBox = boundingBoxReal _dummy;

private _size = 0;
if (_2D) then {
    _size = (_boundingBox select 0) distance2D (_boundingBox select 1) 
} else {
    _size = (_boundingBox select 0) distance (_boundingBox select 1) 
};

_size
