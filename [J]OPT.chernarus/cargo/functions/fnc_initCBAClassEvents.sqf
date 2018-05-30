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
["LandVehicle", "init", {
	params ["_vec"];
    
    if (local _vec) then {
        [QGVAR(initCargo), [_vec]] call CBA_fnc_localEvent; // global effect
    } else {
        [QGVAR(initCargo), [_vec]] call CBA_fnc_serverEvent; // global effect
    };
    
    [_vec] call FUNC(initDragging);

}, nil, nil, true] call CBA_fnc_addClassEventHandler;

["Air", "init", {
    params ["_vec"];

    if (local _vec) then {
        [QGVAR(initCargo), [_vec]] call CBA_fnc_localEvent; // global effect
    } else {
        [QGVAR(initCargo), [_vec]] call CBA_fnc_serverEvent; // global effect
    };
    [_vec] call FUNC(initDragging);

}, nil, nil, true] call CBA_fnc_addClassEventHandler;

["CAManBase", "init", {
    params ["_unit"];
    
    /* Deactivate ACE Carry functionality for players 
    * because it interferes with FAR Revive */
    [_unit, false] call ace_dragging_fnc_setCarryable;
    [_unit, false] call ace_dragging_fnc_setDraggable;

}, nil, nil, true] call CBA_fnc_addClassEventHandler;

// setzt ACE cargo settings für jede Kiste
["Thing", "init", {
	params ["_item"];

    if (local _item) then {
        [QGVAR(initCargo), [_item]] call CBA_fnc_localEvent; // global effect
    } else {
        [QGVAR(initCargo), [_item]] call CBA_fnc_serverEvent; // global effect
    };
    [_item] call FUNC(initDragging);

}, nil, nil, true] call CBA_fnc_addClassEventHandler;