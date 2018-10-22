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

/* PARAMS */
params [
    ["_container", objNull, [objNull], 1]
];

/* VALIDATION */
if (_container isEqualTo objNull) exitWith {};

// Container destroyed?
if (damage _container > GVAR(maxDammage)) exitWith {
    removeAllActions _container;
};

/* CODE BODY */

// deploy radar, calc signal loss and save status
if !(_container getVariable [QEGVAR(composition,deployed), false]) then {

    // create objects for better immersion
    private _handle = [_container, RADAR_COMPOSITION] spawn EFUNC(composition,deployComposition);
    waitUntil { scriptDone _handle; };

    if !(_container getVariable [QEGVAR(composition,deployed), false]) exitWith{};

    // remove ACE dragging entries
    ["cargo", "deactivateDragging", [_container], false] remoteExecCall [QEFUNC(common,execFunc), 0, true]; // has to be called on each client and also JIP
    ["cargo", "deactivateCargo", [_container], false] remoteExecCall [QEFUNC(common,execFunc), 2, false]; // global effect

    // calculate signal loss
    [true] call FUNC(calcSignalLoss);

};