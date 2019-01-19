/**
* Description:
* calculate the radius of a composition (greatest distance or biggest object)
*
* Author:
* James
*
* Arguments:
* 0: <ARRAY> composition
*
* Return Value:
* <NUMBER> radius  of composition
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
* [[...]] call EFUNC(composition,calcCompositionRadius);
*/
#include "script_component.hpp"

/* PARAMS */
params 
[
    ["_composition", [], [[]]]
];

/* VALIDATION */
if (_composition isEqualTo []) exitWith{};

/* CODE BODY */
private _radius = 0;

private _sortedByDist = 
[
    _composition,
    [],
    {
        _frstNum = abs (_x select 1 select 0);
        _secNum = abs (_x select 1 select 1);
        if (_frstNum > _secNum) then {_frstNum} else {_secNum}
    },
    "DESCEND"
] call BIS_fnc_sortBy;

private _biggestOffset = (_sortedByDist select 0) select 1;
private _biggestOffsetAbs = if (abs (_biggestOffset select 0) > abs (_biggestOffset select 1)) then 
{
    abs (_biggestOffset select 0)
} 
else 
{
    abs (_biggestOffset select 1)
};

private _boundingSize = [_sortedByDist select 0 select 0] call FUNC(getBoundingBoxSize);
_radius = _biggestOffsetAbs + _boundingSize;

private _sortedBySize = 
[
    _composition, 
    [], 
    {sizeOf (_x select 0)}, 
    "DESCEND"
] call BIS_fnc_sortBy;

_boundingSize = [_sortedBySize select 0 select 0] call FUNC(getBoundingBoxSize);

if (_boundingSize > _radius) then 
{
    _radius = _boundingSize
};

_radius