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
	private _objekte = nearestTerrainObjects [getpos GVAR(containerEast), ["Tree","BUILDING"], 100];
	private _SignalDaempfung = RADAR_DAMPING(_objekte) * 100;

	private _message = format["%1: %2", STR_RADAR_HINT_TEXT, _SignalDaempfung]; 
    [QEGVAR(gui,message),[STR_RADAR_HINT_HEADER, _message, "blue"]] call CBA_fnc_localEvent;

};