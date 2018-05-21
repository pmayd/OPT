/**
* Author: James
* initialize all ACE cargo settings for a given fnc_initCargoForObject
* global effect
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

LOG_1("Script called for %1", _item);
if (_item isEqualTo objNull) exitWith {false};

private _type = typeOf _item;

// set cargo space
private _index = (GVAR(canTransportCargo) apply {toLower (_x select 0)}) find toLower _type;
if (_index != -1) then {
    (GVAR(canTransportCargo) select _index) params ["_class", "_space"];
    [_item, -1] call ace_cargo_fnc_setSpace; // deactivate space
    [_item, _space] call ace_cargo_fnc_setSpace; // has global effect

} else {
    [_item, 0] call ace_cargo_fnc_setSpace; // deactivate space
    [_item, -1] call ace_cargo_fnc_setSpace; // deactivate space

};

// set cargo size
private _index = (GVAR(canBeTransported) apply {toLower (_x select 0)}) find toLower _type;
if (_index != -1) then {
    (GVAR(canBeTransported) select _index) params ["_class", "_size"];
    [_item, -1] call ace_cargo_fnc_setSize; // has global effect
    [_item, _size] call ace_cargo_fnc_setSize; // has global effect

} else {
    [_item, 0] call ace_cargo_fnc_setSize; // deactivate inventory
    [_item, -1] call ace_cargo_fnc_setSize; // deactivate inventory

};