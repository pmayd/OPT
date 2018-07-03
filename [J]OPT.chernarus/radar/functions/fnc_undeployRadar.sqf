
/**
* Author: James
* undeploy radar container, delete attached objects
*
* Arguments:
* 0: <OBJECT> radar container
*
* Return Value:
* None
*
* Example:
* [] call fnc_undeployRadarEast.sqf;
*
*/
#include "script_component.hpp"

params [
    ["_container", objNull, [objNull], 1]
];

if (_container isEqualTo objNull) exitWith {};

if (_container getVariable [QGVAR(isDeployed), false]) then {
    _container setVariable [QGVAR(isDeployed), false, true];

    {
        deleteVehicle _x;
    } forEach (_container getVariable [QGVAR(attachedObjects), []]);	
    _container setVariable [QGVAR(attachedObjects), [], true];

    // add ACE dragging entries
    // call on server only
    ["cargo", "initCargo", [_container], false] remoteExec [QEFUNC(common,execFunc), 2, false];
    // call on each client and JIP
    ["cargo", "initDragging", [_container], false] remoteExec [QEFUNC(common,execFunc), 0, QGVAR(jipID_initDragging)];
};




