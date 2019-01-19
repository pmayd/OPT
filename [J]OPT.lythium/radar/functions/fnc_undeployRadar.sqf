
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

if (_container getVariable [QEGVAR(composition,deployed), false]) then {

	[_container] spawn EFUNC(composition,undeployComposition);

    // add ACE dragging entries
    // call on server only
    ["cargo", "initCargo", [_container], false] remoteExecCall [QEFUNC(common,execFunc), 2, false];
    // call on each client and JIP
    ["cargo", "initDragging", [_container], false] remoteExecCall [QEFUNC(common,execFunc), 0, true];
};




