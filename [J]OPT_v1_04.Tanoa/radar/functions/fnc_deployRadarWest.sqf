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
	Radarturmwest attachTo [GVAR(containerWest), [-0.5, 0.5, 0.0]];
	Radarnetzwest = createVehicle ["CamoNet_ghex_big_F", getpos GVAR(containerWest), [], 0, "NONE"];
	Radarnetzwest attachTo [GVAR(containerWest), [0.0, 0.0, 0.0]];
	GVAR(containerWest) setVariable ["RADARWESTaufgebaut", true, true];
	private _objekte = nearestTerrainObjects [getpos GVAR(containerWest), ["Tree","BUILDING"], 100];
	private _SignalDaempfung = RADAR_DAMPING(_objekte) * 100;

    private _message = format["%1: %2"] 
    [QEGVAR(gui,message),[STR_RADAR_HINT_HEADER, "Dämpfung durch Gelände: ]]
	hint composeText [
        parseText format [
            "<t align='left' size='%3'></t>" +"<t align='center' size='1.25' shadow='true'>%1</t><t align='right' size='%3'></t>" +"<br/>" +"<t align='center' size='1.0' shadow='true'>%2</t>",
            STR_RADAR_HINT_HEADER,
            _SignalDaempfung,
            3.0
        ]
    ];
	
};
