/**
* Description:
* deactivate all cargo functions for given object
*
* Author:
* James
*
* Arguments:
* 0: <OBJECT> object for which cargo should be deactivated
*
* Return Value:
* <BOOLEAN> true - deactivation was succesful, false - otherwise
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
* deactivate ACE cargo for given object
*
* Example:
* [vehicle player] call EFUNC(cargo,deactivateCargo);
*/
#include "script_component.hpp"

/* PARAMS */
params
[
   ["_item", objNull, [objNull], 1]
];

/* VALIDATION */
if (_item isEqualTo objNull) exitWith{false};

/* CODE BODY */
[_item, -1] call ace_cargo_fnc_setSpace; // deactivate space -> cannot take items
[_item, -1] call ace_cargo_fnc_setSize; // deactivate inventory -> cannot be loaded

true