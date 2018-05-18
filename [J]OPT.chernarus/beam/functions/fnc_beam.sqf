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

private _beamfrei=true;

private _arry = GVAR(box) select _ix;
private _lvl = _arry select 2;
private _beam_pos = _arry select 0;

//Zeitabgelaufen check -> oder lvl gleich -1 (Marinebasis)
if (GVARMAIN(missionStarted) and _lvl != -1) exitWith { 
	closeDialog 0;

	[QEGVAR(gui,message), ["Beamsystem", "Das System steht nur während der Waffenruhe zur Verfügung!", "red"]] call CBA_fnc_localEvent;
	_beamfrei=false;
};

private _SF=false;
if (typeOf vehicle player in GVAR(heavy_vehicles)) then {
    _SF=true;
};
	
// Schwere Fahrzeuge zum Beamziel klein Stufe 3 verneinen
if (_SF and (_lvl < 3)) then { 
    _beamfrei=false;
    
    [QEGVAR(gui,message), ["Beamsystem", "Der gewählte Ort ist nicht für schwere Fahrzeuge freigegeben!", "red"]] call CBA_fnc_localEvent;	
};		
if ((vehicle player != player) and (_lvl < 2)) then { 
    _beamfrei=false;

    [QEGVAR(gui,message), ["Beamsystem", "Der gewählte Ort ist nicht für Fahrzeuge freigegeben!", "red"]] call CBA_fnc_localEvent;	
};	
if (_beamfrei) then { 
    (QGVAR(rsc_layer) call BIS_fnc_rscLayer) cutText ["Teleport...", "BLACK OUT", 3]; // fade out in black

    // beam vehicle and player
    // mission sqm format of x,z,y...
    private _X=_beam_pos Select 0; 
    private _y=_beam_pos Select 2;	
    private	_TempLogic = "Land_HelipadEmpty_F" createvehicle [(_x)-10*sin(random 360),(_y)-10*cos(random 360)]; 
    
    sleep 1;

    vehicle player SetPos getPos _TempLogic;
    deleteVehicle _TempLogic;

    (QGVAR(rsc_layer) call BIS_fnc_rscLayer) cutText ["", "BLACK IN", 3]; // return to game
};

private _message = format[
    "%1 (%2) wurde nach %3 gebeamt",
    PLAYER_NAME, 
    PLAYER_SIDE,
    _arry select 1
];
[QEGVAR(log,write), ["Beam", _message]] call CBA_fnc_serverEvent;

closeDialog 0;







