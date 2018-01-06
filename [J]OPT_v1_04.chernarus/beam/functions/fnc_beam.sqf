/**
* Author: Lord
* teleport player with vehicle to chosen location, if valid
*
* Arguments:
* 0: <NUMBER> current selected index of listbox control
*
* Return Value:
* None
*
* Example:
* [0] call fnc_beam.sqf;
*
*/
#include "script_component.hpp"
//Dialog Auswertung
params ["_ix"];

//Zeitabgelaufen check
if (GVARMAIN(missionStarted)) exitWith { 
	closeDialog 0;

	[QEGVAR(gui,message), ["Beamsystem", "Das System steht nur während der Waffenruhe zur Verfügung!", "red"]] call CBA_fnc_localEvent;
};

(QGVAR(rsc_layer) call BIS_fnc_rscLayer) cutText ["Teleport...", "BLACK OUT", 3]; // fade out in black

private _arry = GVAR(box) select _ix;
private _lvl = _arry select 2;
private _beam_pos = _arry select 0;

private _is_heavyVehicle = vehicle player in GVAR(heavy_vehicles);

// player is in heavy vehicle and location has lower level than 3 -> exit
if (_is_heavyVehicle and (_lvl < 3)) exitWith { 

	[QEGVAR(gui,message), ["Beamsystem", "Der gewählte Ort ist nicht für schwere Fahrzeuge freigegeben!", "red"]] call CBA_fnc_localEvent;	
};		

// player is in vehicle and location has lower level than 2 -> exit
if ((vehicle player != player) and (_lvl < 2)) exitWith { 
	
	[QEGVAR(gui,message), ["Beamsystem", "Der gewählte Ort ist nicht für Fahrzeuge freigegeben!", "red"]] call CBA_fnc_localEvent;	
};	

// beam vehicle and player
vehicle player setpos [_beam_pos select 0, _beam_pos select 2, 0]; // mission sqm format of x,z,y...

(QGVAR(rsc_layer) call BIS_fnc_rscLayer) cutText ["", "BLACK IN", 3]; // return to game

closeDialog 0;