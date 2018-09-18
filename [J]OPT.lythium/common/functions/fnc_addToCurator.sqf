/**
* Author: James
* add given unit to the list of editable objects for curators
*
* Arguments:
* 0: <OBJECT> unit to add to list
*
* Return Value:
* None
*
* Example:
* [player] call fnc_addToCurator.sqf;
*
* Server only:
* yes
*
* Global:
* no
* 
* Public:
* yes
*/
#include "script_component.hpp"

/* PARAMS */
params [
   ["_unit", objNull, [objNull], 1]
];

/* VALIDATION */
if (_unit isEqualTo objNull) exitWith{};

/* CODE BODY */
{
    _x addCuratorEditableObjects [[_unit] - [zeus_ziv1, zeus_ziv2, zeus_ziv3], false];
} forEach [zeus_ziv1, zeus_ziv2, zeus_ziv3];