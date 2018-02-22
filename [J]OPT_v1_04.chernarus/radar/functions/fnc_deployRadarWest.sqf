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
		
if (!(GVAR(containerWest) getVariable ["RADARWESTaufgebaut", false])) then
{
	Radarturmwest = createVehicle ["Land_TTowerSmall_1_F", getpos GVAR(containerWest), [], 0, "NONE"];
    publicVariable "Radarturmwest";
	Radarturmwest attachTo [GVAR(containerWest), [-0.5, 0.5, 0.0]];

	Radarnetzwest = createVehicle ["CamoNet_ghex_big_F", getpos GVAR(containerWest), [], 0, "NONE"];
    publicVariable "Radarnetzwest";
	Radarnetzwest attachTo [GVAR(containerWest), [0.0, 0.0, 0.0]];
	GVAR(containerWest) setVariable ["RADARWESTaufgebaut", true, true];
	private _objekte = nearestTerrainObjects [getpos GVAR(containerWest), ["Tree","BUILDING"], 100];
	private _SignalDaempfung = RADAR_DAMPING(_objekte) * 100;

    private _message = format["%1: %2", STR_RADAR_HINT_TEXT, _SignalDaempfung]; 
    [QEGVAR(gui,message),[STR_RADAR_HINT_HEADER, _message, "blue"]] call CBA_fnc_localEvent;
	
};
