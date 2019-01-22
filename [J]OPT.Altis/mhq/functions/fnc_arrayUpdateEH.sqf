/**
* Author: James
* run code if array changes
*
* Arguments:
* 0: <ARRAY> array to check
* 1: <CODE> code to run

* Return Value:
* None
*
* Example:
* [[], {}] call fnc_arrayUpdateEH.sqf;
*
*/
#include "script_component.hpp"

params ["_array", "_code", "_params"];

for "_i" from 0 to 1 step 0 do {
    private _countArray = count _array;
    waitUntil {count _array != _countArray};
    _params call _code;
};