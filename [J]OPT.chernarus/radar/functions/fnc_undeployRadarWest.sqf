/**
* Author: James
* undeploy NATO radar ContainerClosed
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_undeployRadarWest.sqf;
*
*/
#include "script_component.hpp"

[GVAR(containerWest), true, [0, 5, 0], 0] call ace_dragging_fnc_setDraggable;
[GVAR(containerWest), true, [0, 5, 0], 0] call ace_dragging_fnc_setCarryable;

if (GVAR(containerWest) getVariable ["RADARWESTaufgebaut", false]) then
{
	GVAR(containerWest) setVariable ["RADARWESTaufgebaut", false, true];
	deleteVehicle Radarturmwest;
	deleteVehicle Radarnetzwest;
};
		








