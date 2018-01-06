/**
* Author: Lord
* initialize beam dialog and wait for user input
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_beamDialog.sqf;
*
*/
#include "script_component.hpp"

//Zeitabgelaufen check
if (GVARMAIN(missionStarted)) exitWith { 
	closeDialog 0;

	[QEGVAR(gui,message), ["Beamsystem", "Das System steht nur während der Waffenruhe zur Verfügung!", "red"]] call CBA_fnc_localEvent;
};

private _orte = []
if (PLAYER_SIDE == east) then { 
	_orte = GVAR(locations_east); 

else { 
	_orte = GVAR(locations_west);

};
	
GVAR(ready_to_go) = 0;	
private _box = _orte select {(_x select 2) > 0}; // only locations with level greater 0 (0,1,2,3 possible)
private _beamfrei = true;
												
//Boxen mit Orte füllen
{
	private _loc = _x
	private _lvl = _loc select 2;

	private _index = lbAdd [10002, format ["%1", _loc select 1]]; // readable name
	lbSetColor [10002, _index, [0, 1, 0, 1]];

	if (_lvl == 1) then { 
		lbSetColor [10002, _index, [1, 0.5, 0.5, 1]];
	};

	if (_lvl == 2) then { 
		lbSetColor [10002, _index, [1, 1,0, 1]];
	};

} forEach _box;

//Dialog Auswertung

waitUntil {GVAR(ready_to_go) == 1 or GVARMAIN(missionStarted) or !dialog};

// player closed dialog -> nothing happens
if (!dialog) exitWith {};

// mission has started -> dialog is closed
if (GVARMAIN(missionStarted)) exitWith { 
	closeDialog 0;

	[QEGVAR(gui,message), ["Beamsystem", "Das System steht nur während der Waffenruhe zur Verfügung!", "red"]] call CBA_fnc_localEvent;	
};	
		
private _ix = lbCurSel 10002;

sleep 1;

private _arry = _box select _ix;
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
_beam_pos set [2, 0];
vehicle player setpos _beam_pos;

closeDialog 0;
		 

		 
