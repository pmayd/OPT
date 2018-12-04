/**
* Description:
* return cached side of player unit
*
* Author:
* James
*
* Arguments:
* 0: <OBJECT> unit
*
* Return Value:
* <SIDE> side of unit, usually equal to playerSide
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
* [player] call EFUNC(common,playerSide);
*/
#include "script_component.hpp"

/* PARAMS */
params 
[
    ["_unit", objNull, [objNull], 1]
];

/* VALIDATION */
private _ret = sideUnknown;
if (_unit isEqualTo objNull) exitWith{_ret};

/* CODE BODY */
_ret = side _unit;
_ret = _unit getVariable [QGVARMAIN(playerSide), _ret];

_ret