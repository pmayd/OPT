
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

if (GVAR(containerEast) getVariable ["RADAREASTaufgebaut", false]) then {
	GVAR(containerEast) setVariable ["RADAREASTaufgebaut", false, true];
	deleteVehicle Radarturmeast;
	deleteVehicle Radarnetzeast;		
};




