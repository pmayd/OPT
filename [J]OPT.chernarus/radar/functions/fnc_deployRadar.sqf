/**
* Author: James
* deploy radar container for player side
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_deployRadar.sqf;
*
*/
#include "script_component.hpp"

private _container = [] call FUNC(getRadar);

// Container destroyed?
if (damage _container > GVAR(maxDammage)) exitWith {
    removeAllActions _container;
};

// remove ACE dragging entries
[QEGVAR(cargo,deactivateDragging), [_container]] call CBA_fnc_globalEvent; // has to be called on each client
[QEGVAR(cargo,deactivateCargo), [_container]] call CBA_fnc_serverEvent; // global effect

// deploy radar, calc signal loss and save status
if (!(_container getVariable [QGVAR(isDeployed), false])) then {
	
    // create objects for better immersion
    [] call FUNC(createObjects);

    // calculate signal loss
	[true] call FUNC(calcSignalLoss);

    // side effect: set flag for deploy status
    _container setVariable [QGVAR(isDeployed), true, true];

};