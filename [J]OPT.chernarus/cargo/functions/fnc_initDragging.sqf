/**
* Author: James
* initialize all ACE dragging settings for a given fnc_initCargoForObject
* local effect
* 
* Arguments:
* 0: <OBJECT> object to be initialized
*
* Return Value:
* None
*
* Example:
* [vehicle] call fnc_initCargoAndDragging.sqf;
*
*/
#include "script_component.hpp"

params [
    ["_item", objNull, [objNull], [1]]
];

if (_item isEqualTo objNull) exitWith{false};

private _type = typeOf _item;

// set drag and carry flags
private _index = (GVAR(canBeDragged) apply {toLower (_x select 0)}) find toLower _type;
if (_index != -1) then {
    (GVAR(canBeDragged) select _index) params ["_class", ["_offset", [0, 4, 0.2]], ["_dir", 0]];

    [_item, true, _offset, _dir] call ace_dragging_fnc_setDraggable; // only local?

} else {
    [_item, false] call ace_dragging_fnc_setDraggable;

};

private _index = (GVAR(canBeCarried) apply {toLower (_x select 0)}) find toLower _type;
if (_index != -1) then {
    (GVAR(canBeCarried) select _index) params ["_class", ["_offset", [0, 3, 0.2]], ["_dir", 0]];
    
    [_item, true, _offset, _dir] call ace_dragging_fnc_setCarryable; // only local?

} else {
    [_item, false] call ace_dragging_fnc_setCarryable;

};

true