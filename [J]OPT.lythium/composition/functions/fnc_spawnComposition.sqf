/**
* Author: James
* spawn all objects of a composition
*
* Arguments:
* 0: <ARRAY> composition in format [classname, relativPos (offset), dir, initCode]
*
* Return Value:
* 0: <ARRAY> list of spawned objects
*
* Example:
* [[[classname, relativPos (offset), dir, initCode]]] call fnc_spawnComposition.sqf;
*
*/
#include "script_component.hpp"

params [
    "_composition"
];

private _objArray = [];
{
    _x params [
        ["_type", "", ["s"], 1],
        ["_offset", [0,0,0], [[]], 3],
        ["_newDir", 0, [0], 1],
        ["_code", "",  ["", {}], 1]
    ];
    
    _obj = createVehicle [_type, [0,0,0], [], 0, "CAN_COLLIDE"];
    _obj allowDamage false;
    
    [_centerObj, _obj, _offset, _newdir, true, true] call BIS_fnc_relPosObject;
    _objArray pushBack _obj;
    
    if !(_code isEqualTo "") then {
        _code = [_code] call FUNC(compileCode);
        [[[_obj, _centerObj], _code],"BIS_fnc_spawn", true] call BIS_fnc_MP; // TODO
    };
} forEach _composition;

_objArray