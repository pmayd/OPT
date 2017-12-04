/**
* Author: James
* initialize CBA CLass echo
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_initCBAClassEvents.sqf;
*
*/
#include "script_component.hpp" 

// setzt ACE cargo settings für jedes Fahrzeug
["AllVehicles", "init", {
	params ["_vec"];

    private _type = typeOf _vec;

    // find class
    private _index = (GVAR(canTransportCargo) apply {toLower (_x select 0)}) find toLower _type;
	if (_index != -1) then {
        (GVAR(canTransportCargo) select _index) params ["_class", "_space"];
        [_vec, _space] call ace_cargo_fnc_setSpace;

    } else {
        [_vec, -1] call ace_cargo_fnc_setSpace;

    };

}] call CBA_fnc_addClassEventHandler;

// setzt ACE cargo settings für jede Kiste
["Thing", "init", {
	params ["_item"];

    private _type = typeOf _item;

    // find class
    private _index = (GVAR(canBeTransported) apply {toLower (_x select 0)}) find toLower _type;
	if (_index != -1) then {
        (GVAR(canBeTransported) select _index) params ["_class", "_size"];
        [_vec, _size] call ace_cargo_fnc_setSize;

    } else {
        [_vec, -1] call ace_cargo_fnc_setSize;

    };

    private _index = (GVAR(canBeDragged) apply {toLower _x}) find toLower _type;
	if (_index != -1) then {
        [_item, true] call ace_dragging_fnc_setDraggable;

    } else {
        [_item, false] call ace_dragging_fnc_setDraggable;

    };

    private _index = (GVAR(canBeCarried) apply {toLower _x}) find toLower _type;
	if (_index != -1) then {
        [_item, true] call ace_dragging_fnc_setCarryable;

    } else {
        [_item, false] call ace_dragging_fnc_setCarryable;

    };

}] call CBA_fnc_addClassEventHandler;

{
    params ["_class", "_space"];

} forEach GVAR(canTransportCargo);
