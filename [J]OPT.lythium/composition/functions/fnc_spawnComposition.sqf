/**
* Description:
* spawn all objects of a composition
*
* Author:
* James
*
* Arguments:
* 0: <ARRAY> composition with elements in format [classname, relativPos (offset), dir, initCode]
*
* Return Value:
* <ARRAY> list of spawned objects
*
* Server only:
* no
*
* Public:
* no - should be called only within deployComposition.sqf
*
* Global:
* yes
*
* Sideeffects:
* yes
*
* Example:
* [[classname, relativPos (offset), dir, initCode]]  call EFUNC(composition,spawnComposition);
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
private _retVal = [];
_composition apply
{
    _x params
    [
        ["_type", "", ["s"], 1],
        ["_offset", [0,0,0], [[]], 3],
        ["_newDir", 0, [0], 1],
        ["_code", "",  ["", {}], 1]
    ];

    _obj = createVehicle [_type, [0,0,0], [], 0, "CAN_COLLIDE"];
    _obj allowDamage false;

    [_centerObj, _obj, _offset, _newdir, true, true] call BIS_fnc_relPosObject;
    _retVal pushBack _obj;

    if !(_code isEqualTo "") then
    {
        _code = [_code] call FUNC(compileCode);
        [[_obj, _centerObj], _code] remoteExec ["BIS_fnc_spawn", 0, true];
    };
};

_retVal