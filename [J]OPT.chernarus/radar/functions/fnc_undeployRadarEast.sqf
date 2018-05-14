
/**
* Author: James
* undeploy CSAT radar ContainerClosed
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_undeployRadarEast.sqf;
*
*/
#include "script_component.hpp"

[(GVAR(containerEast), true, [0, 2, 0], 0] call ace_dragging_fnc_setDraggable;
[(GVAR(containerEast), true, [0, 2, 0], 0] call ace_dragging_fnc_setCarryable;

if (GVAR(containerEast) getVariable ["RADAREASTaufgebaut", false]) then {
	GVAR(containerEast) setVariable ["RADAREASTaufgebaut", false, true];
	deleteVehicle Radarturmeast;
	deleteVehicle Radarnetzeast;		
};




