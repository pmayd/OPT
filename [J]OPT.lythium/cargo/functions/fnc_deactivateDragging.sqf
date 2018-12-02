/**
* Description:
* deactivate all dragging functions for given object
*
* Author:
* James
*
* Arguments:
* 0: <OBJECT> object for which dragging  should be deactivated
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
* [ammobox] call EFUNC(cargo,deactivateCargo);
*/
#include "script_component.hpp"

/* PARAMS */
params [
    ["_item", objNull, [objNull], [1]]
];

/* VALIDATION */
if (_item isEqualTo objNull) exitWith{false};

/* CODE BODY */
[_item, false] call ace_dragging_fnc_setDraggable;
[_item, false] call ace_dragging_fnc_setCarryable;

true