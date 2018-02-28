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

/* E */
// log end state
[QGVAR(endState), {
    [QGVAR(write), ["Mission", "Missionzeit abgelaufen"]] call CBA_fnc_localEvent;

    [QGVAR(printPlayerList), []] call CBA_fnc_localEvent;

    _message = format ["Endbudget: (NATO %1 | CSAT %2)",  GVARMAIN(nato_budget), GVARMAIN(csat_budget)];
    [QGVAR(write), ["Budget", _message]] call CBA_fnc_localEvent;

    _message = format ["Endpunktestand: (NATO %1 | CSAT %2)",  GVARMAIN(nato_points), GVARMAIN(csat_points)];
    [QGVAR(write), ["Punkte", _message]] call CBA_fnc_localEvent;
}] call CBA_fnc_addEventHandler;

/* F */
// log capture the flag
[QGVAR(flagCaptured), {

    params ["_flag", "_unit"];

    private _side = UNIT_SIDE(_unit);

    // log player
    private _message = "";

    private _name = UNIT_NAME(_unit);

    switch (_side) do {
        case west: {
            if (_flag in GVARMAIN(nato_flags)) then {
                _message = format ["NATO Flagge gesichert von %1", _name];
            } else {
                _message = format ["CSAT Flagge erobert von %1", _name];
            };
        };

        case east: {
            if (_flag in GVARMAIN(csat_flags)) then {
                _message = format ["CSAT Flagge gesichert von %1", _name];
            } else {
                _message = format ["NATO Flagge erobert von %1", _name];
            };
        };

        default {};
    };

    [QGVAR(write), ["Fahne", _message]] call CBA_fnc_localEvent;
}] call CBA_fnc_addEventHandler;

/* K */
// loggt Abschüsse
[QGVAR(kill), {
	params [
        "_victim", 
        ["_killer", objNull, [objNull], 1],
        ["_instigator", objNull, [objNull], 1] // instigator: Object - Person who pulled the trigger
    ];
    systemChat "Aufruf: log " + str(_this);
	private _cat = "Abschuss";
	private _message = "";

    systemChat str(_this);

	// Abschuss war Spieler oder Fahrzeug?
	if (_victim isKindOf "Man") then {

        if !(_killer isEqualTo objNull) then {
            
		    if (_victim == _instigator) then {
			    _message = format[
                    "%1 (%2) von: Selbstverschulden.",
                    UNIT_NAME(_victim), UNIT_SIDE(_victim)
                ];

            } else {
                _message = format[
                    "%1 (%2) von: %3 (%4).",
                    UNIT_NAME(_victim), UNIT_SIDE(_victim), UNIT_NAME(_instigator), UNIT_SIDE(_instigator)
                ];

            };

		} else {
            _message = format["%1 von: unbekannt", _message];
            
        };

	} else {

        private _vec = _victim;
        
		private _faction = (getText(configFile >> 'CfgVehicles' >> typeOf _vec >> 'faction'));
		private _name = (getText(configFile >> 'CfgVehicles' >> typeOf _vec >> 'displayName'));
		_message = format["Fahrzeug: %1 (%2)", _name, _faction];

		// Täter nicht bekannt?
		if !(_killer isEqualTo objNull) then {

            // Selbstverschulden?
			if (_vec == _killer) then {
				_message = format["%1 von: Selbstverschulden", _message];

			} else {
                _message = format["%1 von: %2 (%3).", _message, UNIT_NAME(_instigator), UNIT_SIDE(_instigator)];

			};

		} else {
			_message = format["%1 von: unbekannt", _message];

		};

	};

	// übergib Kategorie und Nachricht an log-FUnktion
	[QGVAR(write), [_cat, _message]] call CBA_fnc_localEvent;

}] call CBA_fnc_addEventHandler;

/* P */
// print player list
[QGVAR(printPlayerList), {

    private _cat = "Fraktionsuebersicht";
    {
        _message = format["%1 (%2), PUID %3", _x select 1, _x select 2, _x select 0];
        [QGVAR(write), [_cat, _message]] call CBA_fnc_localEvent;

    } forEach GVAR(playerList);

}] call CBA_fnc_addEventHandler;

/* S */
// log start state
[QGVAR(startState), {

    _log_msg = format["Startbudget: NATO %1 - CSAT %2", GVARMAIN(nato_budget), GVARMAIN(csat_budget)];
    [QGVAR(write), ["Budget", _log_msg]] call CBA_fnc_localEvent;

    _log_msg = format["Beginn Waffenruhe: %1 min", (OPT_PARAM_TRUCETIME + OPT_PARAM_FREEZE_TIME) / 60];
    [QGVAR(write), ["Mission", _log_msg]] call CBA_fnc_localEvent;

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

        [QGVAR(write), ["Transport", _message]] call CBA_fnc_localEvent;
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

/* W */
// schreibt eine log Nachricht in die SERVER-RPT
[QGVAR(write), {
	params ["_category", "_message"];

	private _timestemp = [serverTime - EGVAR(mission,startTime)] call CBA_fnc_formatElapsedTime;

	diag_log LOG_MESSAGE(_category,_timestemp,_message);
	
}] call CBA_fnc_addEventHandler;