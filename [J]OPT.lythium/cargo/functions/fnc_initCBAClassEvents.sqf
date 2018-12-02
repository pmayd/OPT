/**
* Description:
* initialize CBA Class Events for land vehicle, air vehiclem units and things
* every object is initialized according to the init functions in this component
*
* Author:
* James
*
* Arguments:
* None
*
* Return Value:
* None
*
* Server only:
* no
*
* Public:
* no - should be called only once by XEH_PostInit.sqf at mission start
*
* Global:
* no
*
* Sideeffects:
* add cba class event handler to new and existing vehicles (+air), units and things
* deactivate ACE dragging and carrying for units
*
* Example:
* [] call EFUNC(cargo,initCBAClassEvents);
*/
#include "script_component.hpp"

/* PARAMS */

/* VALIDATION */

/* CODE BODY */


// setzt ACE cargo settings für jedes Fahrzeug
["LandVehicle", "init", {
    params ["_vec"];
    
    [_vec] call FUNC(initCargo); // global effect
    [_vec] call FUNC(initDragging);

}, nil, nil, true] call CBA_fnc_addClassEventHandler;

["Air", "init", {
    params ["_vec"];

    [_vec] call FUNC(initCargo);
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

    [_item] call FUNC(initCargo);
    [_item] call FUNC(initDragging);

}, nil, nil, true] call CBA_fnc_addClassEventHandler;