/**
* Author: James
* deploy NATO radar container
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [parameter] call fnc_deployRadarWest.sqf;
*
*/
#include "script_component.hpp"

// Container destroyed?
if (!alive GVAR(containerWest)) exitWith {
    removeAllActions GVAR(containerWest);
};
		
if (!(RADARContainerWEST getVariable ["RADARWESTaufgebaut", false])) then
{
	Radarturmwest = createVehicle ["Land_TTowerSmall_1_F", getpos GVAR(containerWest), [], 0, "NONE"];
	Radarturmwest attachTo [GVAR(containerWest), [-0.5, 0.5, 0.0]];
	Radarnetzwest = createVehicle ["CamoNet_ghex_big_F", getpos GVAR(containerWest), [], 0, "NONE"];
	Radarnetzwest attachTo [GVAR(containerWest), [0.0, 0.0, 0.0]];
	GVAR(containerWest) setVariable ["RADARWESTaufgebaut", true, true];
};