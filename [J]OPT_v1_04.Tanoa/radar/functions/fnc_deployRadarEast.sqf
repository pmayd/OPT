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
	private _SignalDaempfung = round(((count _objekte)/350)*100);
	hint composeText [parseText format ["<t align='left' size='%3'></t>" +"<t align='center' size='1.25' shadow='true'>%1</t><t align='right' size='%4'></t>" +"<br/>" +"<t align='center' size='1.0' shadow='true'>%2</t>","Radar-Dämpfung",_SignalDaempfung,3.0]];

};