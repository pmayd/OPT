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

if (GVAR(containerWest) getVariable ["RADARWESTaufgebaut", false]) then
{
	GVAR(containerWest) setVariable ["RADARWESTaufgebaut", false, true];
	deleteVehicle Radarturmwest;
	deleteVehicle Radarnetzwest;
};
		








