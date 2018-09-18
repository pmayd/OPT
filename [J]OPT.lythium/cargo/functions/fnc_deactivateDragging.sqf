/**
* Author: James
* deactivate all dragging functions for given object
*
* Arguments:
* 0: <OBJECT> object for which dragging should be deactivated
*
* Return Value:
* None
*
* Example:
* [ammobox] call fnc_deactivateDragging.sqf;
*
*/
#include "script_component.hpp"

params [
    ["_item", objNull, [objNull], [1]]
];

if (_item isEqualTo objNull) exitWith{false};

[_item, false] call ace_dragging_fnc_setDraggable;
[_item, false] call ace_dragging_fnc_setCarryable;

true