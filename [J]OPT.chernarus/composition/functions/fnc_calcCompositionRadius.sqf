/**
* Author: James
* calculate the radius of a composition (biggest distance or size)
*
* Arguments:
* 0: <ARRAY> composition
*
* Return Value:
* 0: <NUMBER> radius  of composition
*
* Example:
* [[mycomp]]] call fnc_calcCompositionRadius.sqf;
*
*/
#include "script_component.hpp"

params [
    "_composition"
];

private _radius = 0;

private _sortedByDist = [
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
private _biggestOffsetAbs = if (abs (_biggestOffset select 0) > abs (_biggestOffset select 1)) then {
    abs (_biggestOffset select 0)
} else {
    abs (_biggestOffset select 1)
};

private _boundingSize = [_sortedByDist select 0 select 0] call FUNC(getBoundingBoxSize);
_radius = _biggestOffsetAbs + _boundingSize;

private _sortedBySize = [
    _composition, 
    [], 
    {sizeOf (_x select 0)}, 
    "DESCEND"
] call BIS_fnc_sortBy;

_boundingSize = [_sortedBySize select 0 select 0] call FUNC(getBoundingBoxSize);

if (_boundingSize > _radius) then {
    _radius = _boundingSize;
};

_radius