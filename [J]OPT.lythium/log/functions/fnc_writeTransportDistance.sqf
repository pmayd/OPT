/**
* Author: James
* log transport distance from a unit that has left a transport helicopter
*
* Arguments:
* 0: <OBJECT> transport vehicle
* 1: <STRING> the vehicle position the unit had occupied
* 2: <OBJECT> unit that left vehicle  
*
* Return Value:
* None
*
* Example:
* [heli, "cargo", player] call fnc_writeTransportDistance.sqf;
*
* Server only:
* yes
*
* Global:
* no
*
* Public:
* no
*/
#include "script_component.hpp"

/* PARAMS */
params [
   ["_vec", objNull, [objNull], 1],
   ["_pos", "s", ["s"], 1],
   ["_unit", objNull, [objNull], 1]
];

/* VALIDATION */
if (_vec isEqualTo objNull or _unit isEqualTo objNull) exitWith{};

/* CODE BODY */
private _pilot = _vec getVariable [QGVAR(transport_pilot), objNull];

// end script if either player or pilot is unconscious
private _condition = (_unit getVariable ["FAR_isUnconscious", 0] == 1) or (_pilot getVariable ["FAR_isUnconscious", 0] == 1);
if (_condition) exitWith {};

private _dis = (getPos _vec) distance2D (_unit getVariable QGVAR(transport_start_loc));

if (_pos in ["cargo", "gunner"] and (_dis > GVAR(distanceFromBase)) ) then {

    private _message = format[
        "%1 (%2) wurde von %3 (%4) eingeflogen (%5 m)", 
        UNIT_NAME(_unit), 
        UNIT_SIDE(_unit),  
        UNIT_NAME(_pilot), 
        UNIT_SIDE(_pilot),
        _dis
    ];

    ["Transport", _message] call FUNC(write);
};
