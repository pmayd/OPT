/**
* Author: James
* register all CBA EH for the logging system
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_preInit.sqf;
*
*/
#include "script_component.hpp"

private _success = false;
/**
registriert alle Events via CBA Event Handling 
*/

/* S */
// log start state
[QGVAR(startState), {

    _log_msg = format["Startbudget: NATO %1 - CSAT %2", GVARMAIN(nato_budget), GVARMAIN(csat_budget)];
    ["Budget", _log_msg] call FUNC(write);

    _log_msg = format["Beginn Waffenruhe: %1 min", (OPT_PARAM_TRUCETIME + OPT_PARAM_FREEZE_TIME) / 60];
    ["Mission", _log_msg] call FUNC(write);

}] call CBA_fnc_addEventHandler;

/* T */
// logge transport von Spielern, falls Spieler nicht Pilot und Strecke geflogen
[QGVAR(transportDistance), {
    params ["_vec", "_pos", "_unit"];

    private _pilot = _vec getVariable [QGVAR(transport_pilot), objNull];

    // end script if either player or pilot is unconscious
    if (
        (_unit getVariable ["FAR_isUnconscious", 0] == 1) or 
        _pilot getVariable ["FAR_isUnconscious", 0] == 1 
    ) exitWith {};

    private _dis = (getPos _vec) distance2D (_unit getVariable QGVAR(transport_start_loc));

    if ( _pos in ["cargo", "gunner"] and (_dis > GVAR(distanceFromBase)) ) then {

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

}] call CBA_fnc_addEventHandler;

/* U */
// store player in player list on server
[QGVAR(updatePlayerList), {

    params ["_uid", "_name", "_side"];

    if (_uid in (GVAR(playerList) apply {_x select 0})) exitWith{};

    GVAR(playerList) pushBack [_uid, _name, _side];
    publicVariable QGVAR(playerList);

}] call CBA_fnc_addEventHandler;