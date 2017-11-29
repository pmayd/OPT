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

    private _owner = _flag getVariable ["owner", nil];

    // log player
    private _message = "";

    private _name = UNIT_NAME(_unit);

    switch (_side) do {
        case west: {
            if (_owner isEqualTo west) then {
                _message = format ["NATO Flagge gesichert von %1", _name];
            } else {
                _message = format ["CSAT Flagge erobert von %1", _name];
            };
        };

        case east: {
            if (_owner isEqualTo east) then {
                _message = format ["NATO Flagge erobert von %1", _name];
            } else {
                _message = format ["CSAT Flagge gesichert von %1", _name];
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
        ["_killer", objNull, [objNull], 1]
    ];
	private _cat = "Abschuss";
	private _message = "";

    systemChat str(_this);

	// Abschuss war Spieler oder Fahrzeug?
	if (_victim isKindOf "Man") then {

        private _nameVictim = UNIT_NAME(_victim);

        if !(_killer isEqualTo objNull) then {
            
		    if (_victim == _killer) then {
			    _message = format[
                    "%1 (%2) von: Selbstverschulden.",
                    _nameVictim, UNIT_SIDE(_victim)
                ];

            } else {
                _nameKiller = UNIT_NAME(_killer);

                _message = format[
                    "%1 (%2) von: %3 (%4).",
                    _nameVictim, UNIT_SIDE(_victim), _nameKiller, UNIT_SIDE(_killer)
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

                _nameKiller = UNIT_NAME(_killer);

				_message = format["%1 von: %2 (%3).", _message, _nameKiller, _faction];

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

    private _dis = (getPosASL _vec) distance2D (_unit getVariable QGVAR(transport_start_loc));
    if ( _pos in ["cargo", "gunner"] && (_dis > DISTANCE_FROM_BASE) ) then {

        _nameUnit = UNIT_NAME(_unit);

        _namePilot = UNIT_NAME(_vec getVariable ["opt_var_vec_pilot", objNull]);

        private _message = format[
            "%1 (%2) wurde von %3 (%4) eingeflogen (%5 m)", 
            _nameUnit, 
            UNIT_SIDE(_unit),  
            _namePilot, 
            UNIT_SIDE(_vec getVariable "opt_var_vec_pilot"),
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