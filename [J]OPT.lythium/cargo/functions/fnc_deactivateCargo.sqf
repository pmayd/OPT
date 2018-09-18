/**
* Author: James
* deactivate all cargo functions for given object
*
* Arguments:
* 0: <OBJECT> object for which cargo should be deactivated
*
* Return Value:
* None
*
* Example:
* [vehicle] call fnc_deactivateCargo.sqf;
*
*/
#include "script_component.hpp"

params [
    ["_item", objNull, [objNull], 1]
];

if (_item isEqualTo objNull) exitWith{false};

[_item, -1] call ace_cargo_fnc_setSpace; // deactivate space -> cannot take items
[_item, -1] call ace_cargo_fnc_setSize; // deactivate inventory -> cannot be loaded

true