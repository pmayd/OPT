/**
* Author: James
* initialize server side CBA Event Handler
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_initCBAEvents.sqf;
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
["AllVehicles", "init", {
    params ["_vec"];
    [QEGVAR(common,addAction), 
        [
            _vec, 
            ["Fahrzeug aufrichten" call XTuerkiesText, {[] call EFUNC(common,unFlip);}, [], 0, false, true, "", format["[_target, player] call %1", QEFUNC(common,flipCheck)]]
        ]
    ] call CBA_fnc_globalEventJIP;

}] call CBA_fnc_addClassEventHandler;

/* CUSTOM EH */
[QGVAR(spawnVehicle), {
    params ["_unitType", "_spawnPos"];

    [_unitType, _spawnPos] call FUNC(spawnVehicle);

}] call CBA_fnc_addEventHandler;

[QGVAR(handleDeadVehicle), {
     (_this select [0,2]) call FUNC(handleDeadVehicle);
}] call CBA_fnc_addEventHandler;