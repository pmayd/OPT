/**
* Author: James
* initialize client CBA fnc_initCBAPlayerEvents
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_initPlayerCBAEvents.sqf;
*
*/
#include "script_component.hpp" 

[QGVAR(renderBudget), {
    [] call FUNC(updateBudget);
}] call CBA_fnc_addEventHandler;