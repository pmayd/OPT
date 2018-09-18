/**
* Author: James
* return object variable GVARMAIN(playerSide)
*
* Arguments:
* 0: <OBJECT> unit or list of units
*
* Return Value:
* 0: <SIDE> side of unit, usually equal to playerSide
*
* Example:
* [player] call fnc_getPlayerSide.sqf;
*
*/
#include "script_component.hpp"

/* PARAMS */
params [
    ["_unit", objNull, [objNull], 1]
];

/* VALIDATION */
private _ret = sideUnknown;
if (_unit isEqualTo objNull) exitWith{_ret};

/* CODE BODY */
_ret = side _unit;
_ret = _unit getVariable [QGVARMAIN(playerSide), _ret];

_ret


