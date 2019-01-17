/**
* Author: James
* initialize server side CBA Class Handler
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_initCBAClassEvents.sqf;
*
*/
#include "script_component.hpp"

/* CLASS EH */
/* EXAMPLE FROM https://github.com/CBATeam/CBA_A3/wiki/Adding-Event-Handlers-to-Classes-of-Objects 
["CAManBase", "fired", {systemChat str _this}] call CBA_fnc_addClassEventHandler;
This will show a chat message every time a soldier fires a weapon. It is advised to use CAManBase instead of Man when dealing with soldiers, because Man is the parent class of all animals, including the randomly spawning rabbits, snakes and fish. Using CAManBase slightly reduces the overhead that would happen when any of these spawn (which actually happens pretty frequently).

["AllVehicles", "getIn", {hint str _this}] call CBA_fnc_addClassEventHandler;
This event happens every time a soldier enters a vehicle.
*/ 


// fügt auf allen clients einen Add Action Eintrag für umgekippte Fahrzeuge hinzu
// ersetzt player add action in onPlayerRespawn (viel performanter, da kein pulling)
["LandVehicle", "init", {
    params ["_vec"];
     
    _vec addAction [
        "Fahrzeug aufrichten" call XTuerkiesText, 
        {[_target] call EFUNC(common,unFlip);},
        [], 
        0, 
        false, 
        true, 
        "", 
        format["[_target, player] call %1", QEFUNC(common,flipCheck)]
    ];

}, nil, nil, true] call CBA_fnc_addClassEventHandler;

["Air", "init", {
    params ["_vec"]; 
        
    _vec addAction [
        "Fahrzeug aufrichten" call XTuerkiesText,
        {[_target] call EFUNC(common,unFlip);}, 
        [], 
        0, 
        false, 
        true, 
        "", 
        format["[_target, player] call %1", QEFUNC(common,flipCheck)]
    ];

}, nil, nil, true] call CBA_fnc_addClassEventHandler;


// add killed EH to all kind of vehicles, either on map or later spawned via crteateVehicle arrayIntersect
// -> log kill and delete if near base
["LandVehicle", "killed", {
    _this remoteExecCall [QFUNC(handleDeadVehicle), 2, false];

}] call CBA_fnc_addClassEventHandler;

["Air", "killed", {
    _this remoteExecCall [QFUNC(handleDeadVehicle), 2, false];

}] call CBA_fnc_addClassEventHandler;

