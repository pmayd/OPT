/**
* Author: James
* check if there is already an object in the hash at the same position
*
* Arguments:
* 0: <OBJECT> object to add to hash
* 1: <ARRAY> list of already stored objects in hash
* 
* Return Value:
* 0: <BOOL> true - object is already in hash, false - otherwise
*
* Example:
* [vehicle player, HASH_GET(GVAR(hash), "vehicles")] call opt_persistence_fnc_isDoubleEntry.sqf;
*
* Server only:
* yes
*
* Public:
* yes
*/
#include "script_component.hpp"

/* PARAMS */
params [
   ["_newElement", objNull, [objNull], 1],
   ["_storage", [], [[]]]
];

/* VALIDATION */
private _check = false;
if (_newElement isEqualTo objNull) exitWith{_check};
if (_storage isEqualTo []) exitWith{_check};

/* CODE BODY */
private _checkPos = getPosATL _newElement;

{
    // Current result is saved in variable _x
    // all data in hash has position as second element
    // if one element is nearly at the same position and has same type, return true and exit
    private _classname = _x select 0;
    private _pos = _x select 1;

    if (_pos distance2D _checkPos < 0.05 and _classname isEqualTo (typeOf _newElement)) exitWith {
        _check = true;
    };

} forEach _storage;

_check;