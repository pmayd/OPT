/**
* Description:
* Teleport player and their vehicle to selected destination.
* Check for truce time and level of teleport location.
*
* Author:
* James
*
* Arguments:
* 0: <NUMBER> current selected index of listbox control
*
* Return Value:
* None
*
* Server only:
* no
*
* Public:
* no - should be called from beam dialog
*
* Global:
* no
*
* Sideeffects:
* black out and black in effect for player
* local gui messages for player
* log message "%1 (%2) wurde nach %3 gebeamt"
*
* Example:
* [0] spawn EFUNC(beam,beam);
*/
#include "script_component.hpp"

/* PARAMS */
params 
[
   ["_ix", -1, [0], 1]
];

/* VALIDATION */
if (_ix == -1) exitWith {};

/* CODE BODY */
private _beamfrei = true;
private _SF = false;
private _arry = GVAR(box) select _ix;
private _lvl = _arry select 2;
private _beam_pos = _arry select 0;

//Zeitabgelaufen check -> oder lvl gleich -1 (Marinebasis)
if (EGVAR(serverclock,missionStarted) and _lvl != -1) exitWith 
{ 
    ["Beamsystem", "Das System steht nur während der Waffenruhe zur Verfügung!", "red"] call EFUNC(gui,message);
    closeDialog 0;
};

if ((typeOf vehicle player) in GVAR(heavy_vehicles)) then 
{
    _SF = true;
};

// Schwere Fahrzeuge zum Beamziel klein Stufe 3 verneinen
if (_SF and _lvl < 3) then 
{ 
    _beamfrei = false;
    
    ["Beamsystem", "Der gewählte Ort ist nicht für schwere Fahrzeuge freigegeben!", "red"] call EFUNC(gui,message);

};

if ((vehicle player != player) and (_lvl < 2)) then 
{ 
    _beamfrei = false;

    ["Beamsystem", "Der gewählte Ort ist nicht für Fahrzeuge freigegeben!", "red"] call EFUNC(gui,message);

};

if (_beamfrei) then 
{ 
    (QGVAR(rsc_layer) call BIS_fnc_rscLayer) cutText ["Teleport...", "BLACK OUT", 3]; // fade out in black

    // beam vehicle and player
    // mission sqm format of x,z,y...
    private _xPos = _beam_pos select 0;
    private _yPos = _beam_pos select 2;
    private _tempLogic = "Land_HelipadEmpty_F" createVehicle 
    [
        (_xPos) - 10 * sin(random 360), 
        (_yPos) - 10 * cos(random 360)
    ]; 
    sleep 1;

    (vehicle player) setPos getPos _tempLogic;
    deleteVehicle _tempLogic;

    (QGVAR(rsc_layer) call BIS_fnc_rscLayer) cutText ["", "BLACK IN", 3]; // return to game

    private _message = format
    [
        "%1 (%2) wurde nach %3 gebeamt",
        PLAYER_NAME, 
        PLAYER_SIDE,
        _arry select 1
    ];
    ["Beam", _message] remoteExecCall [QEFUNC(log,write), 2, false];
};

closeDialog 0;







