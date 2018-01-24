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

    // set cargo space
    private _index = (GVAR(canTransportCargo) apply {toLower (_x select 0)}) find toLower _type;
	if (_index != -1) then {
        (GVAR(canTransportCargo) select _index) params ["_class", "_space"];
        [_vec, _space] call ace_cargo_fnc_setSpace;

    } else {
        [_vec, -1] call ace_cargo_fnc_setSpace;

    };

}] call CBA_fnc_addClassEventHandler;

["CAManBase", "init", {
    params ["_unit"];
    
    /* Deactivate ACE Carry functionality for players 
    * because it interferes with FAR Revive */
    [_unit, false] call ace_dragging_fnc_setCarryable;
    [_unit, false] call ace_dragging_fnc_setDraggable;

}] call CBA_fnc_addClassEventHandler;

// setzt ACE cargo settings für jede Kiste
["Thing", "init", {
	params ["_item"];

    private _type = typeOf _item;

    // set cargo space
    private _index = (GVAR(canTransportCargo) apply {toLower (_x select 0)}) find toLower _type;
	if (_index != -1) then {
        (GVAR(canTransportCargo) select _index) params ["_class", "_space"];
        [_item, _space] call ace_cargo_fnc_setSpace;

    } else {
        [_item, -1] call ace_cargo_fnc_setSpace;

    };

    // set cargo size
    private _index = (GVAR(canBeTransported) apply {toLower (_x select 0)}) find toLower _type;
	if (_index != -1) then {
        (GVAR(canBeTransported) select _index) params ["_class", "_size"];
        [_item, _size] call ace_cargo_fnc_setSize;

    } else {
        [_item, -1] call ace_cargo_fnc_setSize;

    };

    // set drag and carry flags
    private _index = (GVAR(canBeDragged) apply {toLower (_x select 0)}) find toLower _type;
	if (_index != -1) then {
        (GVAR(canBeDragged) select _index) params ["_class", ["_offset", [0, 1, 0.1]], ["_dir", 0]];

        [_item, true, _offset, _dir] call ace_dragging_fnc_setDraggable;

    } else {
        [_item, false] call ace_dragging_fnc_setDraggable;

    };

    private _index = (GVAR(canBeCarried) apply {toLower (_x select 0)}) find toLower _type;
	if (_index != -1) then {
        (GVAR(canBeCarried) select _index) params ["_class", ["_offset", [0, 1, 0.1]], ["_dir", 0]];
        
        [_item, true, _offset, _dir] call ace_dragging_fnc_setCarryable;

    } else {
        [_item, false] call ace_dragging_fnc_setCarryable;

    };

}] call CBA_fnc_addClassEventHandler;