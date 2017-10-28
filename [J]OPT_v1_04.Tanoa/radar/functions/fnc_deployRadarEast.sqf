/**
* Author: James
* deploy CSAT radar container
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_deployRadarEast.sqf;
*
*/
#include "script_component.hpp"

// Container destroyed?
if (!alive GVAR(containerEast)) exitWith {
    removeAllActions GVAR(containerEast);
};

if (!(GVAR(containerEast) getVariable ["RADAREASTaufgebaut", false])) then
{
	Radarturmeast = createVehicle ["Land_TTowerSmall_1_F", getpos GVAR(containerEast), [], 0, "NONE"];
	Radarturmeast attachTo [GVAR(containerEast), [-0.5, 0.5, 0.0]];
	Radarnetzeast = createVehicle ["CamoNet_ghex_big_F", getpos GVAR(containerEast), [], 0, "NONE"];
	Radarnetzeast attachTo [GVAR(containerEast), [0.0, 0.0, 0.0]];
	GVAR(containerEast) setVariable ["RADAREASTaufgebaut", true, true];
};