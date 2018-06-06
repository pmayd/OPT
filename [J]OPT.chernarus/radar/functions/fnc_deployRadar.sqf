/**
* Author: James
* deploy radar container for player side
*
* Arguments:
* 0: <OBJECT> radar container
*
* Return Value:
* None
*
* Example:
* [] call fnc_deployRadar.sqf;
*
*/
#include "script_component.hpp"

params [
    ["_container", objNull, [objNull], 1]
];

if (_container isEqualTo objNull) exitWith {};

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
    [_container] call FUNC(createObjects);

    // calculate signal loss
	[true] call FUNC(calcSignalLoss);

    // side effect: set flag for deploy status
    _container setVariable [QGVAR(isDeployed), true, true];

};