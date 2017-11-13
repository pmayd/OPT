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

/* Class EH */
// Engine EH für Piloten -> Log transportierte Soldaten
_success = ["Helicopter", "GetIn", {
    /*
    vehicle: Object - Vehicle the event handler is assigned to
    position: String - Can be either "driver", "gunner" or "cargo"
    unit: Object - Unit that entered the vehicle
    (Since Arma 3 v1.36)
    turret: Array - turret path
    */
    params ["_vec", "_pos", "_unit"];

    // speichere Pilot als Variable des Objekts Heli
    if (_pos isEqualTo "driver") then {
        _vec setVariable [QGVAR(transport_pilot), _unit, true];
    };

    // speichere aktuellen Ort an der Einheit
    _unit setVariable [QGVAR(transport_start_loc), getPosASL _vec, false];
            
}] call CBA_fnc_addClassEventHandler;
if !(_success) then {ERROR("Failed adding ClassEventHandler 'GetIn' for Helicopters")};

_success = ["Helicopter", "GetOut", {
    /*
    vehicle: Object - Vehicle the event handler is assigned to
    position: String - Can be either "driver", "gunner" or "cargo"
    unit: Object - Unit that left the vehicle
    turret: Array - turret path (since Arma 3 v1.36)
    */

    // logge transport von Spielern, falls Spieler nicht Pilot und Strecke > 500m
    [QGVAR(transportDistance), _this] call CBA_fnc_serverEvent;

}] call CBA_fnc_addClassEventHandler;
if !(_success) then {ERROR("Failed adding ClassEventHandler 'GetIn' for Helicopters")};

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

    private _side = _unit getVariable QGVARMAIN(playerSide);

    private _owner = _flag getVariable ["owner", nil];

    // log player
    private _message = "";

    private _name = [_unit] call FUNC(getPlayerName);

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

        private _nameVictim = [_victim] call FUNC(getPlayerName);

        if !(_killer isEqualTo objNull) then {
            
		    if (_victim == _killer) then {
			    _message = format[
                    "%1 (%2) von: Selbstverschulden.",
                    _nameVictim, _victim getVariable QGVARMAIN(playerSide)
                ];

            } else {
                _nameKiller = [_killer] call FUNC(getPlayerName);

                _message = format[
                    "%1 (%2) von: %3 (%4).",
                    _nameVictim, _victim getVariable QGVARMAIN(playerSide), _nameKiller, _killer getVariable QGVARMAIN(playerSide)
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

                _nameKiller = [_killer] call FUNC(getPlayerName);

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

        _nameUnit = [_unit] call FUNC(getPlayerName);

        _namePilot = [(_vec getVariable ["opt_var_vec_pilot", objNull])] call FUNC(getPlayerName);

        private _message = format[
            "%1 (%2) wurde von %3 (%4) eingeflogen (%5 m)", 
            _nameUnit, 
            _unit getVariable "opt_var_playerSide",  
            _namePilot, 
            (_vec getVariable "opt_var_vec_pilot") getVariable "opt_var_playerSide",
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