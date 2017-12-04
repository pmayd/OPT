/**
* Author: James
* initialize component and run important settings/scripts at mission startLoadingScreen
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_postInit.sqf;
*
*/
#include "script_component.hpp"

/* Deactivate ACE Carry functionality for players 
* because it interferes with FAR Revive */
[player, false] call ace_dragging_fnc_setCarryable;
[player, false] call ace_dragging_fnc_setDraggable;
