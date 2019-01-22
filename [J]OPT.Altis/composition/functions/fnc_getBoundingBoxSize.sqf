/**
* Description:
* calculate the diameter of the bounding box a given object object
*
* Author:
* James
*
* Arguments:
* 0: <STRING> classname for object to calculate bounding box size for
* 1: <BOOL> true - return 2D boundig box size, false - return 3D bounding box size
*
* Return Value:
* <NUMBER> bounding box size
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
* [typeOf vehicle] call EFUNC(composition,getBoundingBoxSize);
*/
#include "script_component.hpp"

/* PARAMS */
params 
[
    ["_type", "", ["s"], 1],
    ["_2D", true, [true], 1]
];

/* VALIDATION */
private _retVal = 0;
if (_type isEqualTo "") exitWith {_retVal};

/* CODE BODY */
private _dummy = _type createVehicleLocal [0,0,0];
private _boundingBox = boundingBoxReal _dummy;

_retVal = if (_2D) then 
{
    (_boundingBox select 0) distance2D (_boundingBox select 1) 
}
else 
{
    (_boundingBox select 0) distance (_boundingBox select 1) 
};

_retVal
