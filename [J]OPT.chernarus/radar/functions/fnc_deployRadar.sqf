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
["cargo", "deactivateDragging", [_container], false] remoteExecCall [QEFUNC(common,execFunc), 0, QGVAR(jipID_deactivateDragging)]; // has to be called on each client and also JIP
["cargo", "deactivateCargo", [_container], false] remoteExecCall [QEFUNC(common,execFunc), 2, false]; // global effect

// deploy radar, calc signal loss and save status
if (!(_container getVariable [QGVAR(isDeployed), false])) then {

    // create objects for better immersion
    [_container] call FUNC(createObjects);

    // calculate signal loss
    [true] call FUNC(calcSignalLoss);

    // side effect: set flag for deploy status
    _container setVariable [QGVAR(isDeployed), true, true];

};