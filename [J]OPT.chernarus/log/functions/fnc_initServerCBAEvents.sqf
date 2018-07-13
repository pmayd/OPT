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

    [QGVAR(printFPS), []] call CBA_fnc_localEvent;

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
// log player kills
[QGVAR(kill), {
	params [
        ["_victim", objNull, [objNull], 1],
        ["_instigator", objNull, [objNull], 1], // instigator: Object - Person who pulled the trigger
        ["_source", objNull, [objNull], 1], // The source unit that caused the damage
        ["_projectile", "", ["s"], 1] //  Class name of the projectile that inflicted the damage ("" for unknown, such as falling damage)
    ];

	private _cat = "Abschuss";
	private _message = "";

	// Abschuss war Spieler oder Fahrzeug?
	if (_victim isKindOf "Man") then {

        // base information about victim
        _message = format[
            "Einheit: %1 (side: %2)",
            UNIT_NAME(_victim), UNIT_SIDE(_victim)
        ];

        // was victim in a vehicle?
        if !(vehicle _victim isEqualTo _victim) then {
            private _name = getText (configFile >> "CfgVehicles" >> typeOf (vehicle _victim) >> "displayName");
            _message = format["%1 (vehicle: %2)", _message, _name];
        };

        // instigator known?
        if !(_instigator isEqualTo objNull) then {
            
		    if (_victim isEqualTo _instigator) then {
			    _message = format["%1 von: Selbstverschulden.", _message];

            } else {
                
                // base information about instigator
                _message = format["%1 von: %2 (side: %3)", _message, UNIT_NAME(_instigator), UNIT_SIDE(_instigator)];

                // source in vehicle or not?
                if !(_source isEqualTo _instigator) then {
                    private _name = getText (configFile >> "CfgVehicles" >> typeOf _source >> "displayName");
                    _message = format["%1 (vehicle: %2)", _message, _name];
                };

            };

		} else {
            _message = format["%1 von: unbekannt", _message];
            
        };

        // projectile known?
        if !(_projectile isEqualTo "") then {
            
            // find display name of magazine
            private _name = "";
            {
                if (getText (_x >> "ammo") isEqualTo _projectile) exitWith {
                    // find upmost parent that is not too generic
                    private _parent = _x;
                    while {!(getText ((inheritsFrom _parent) >> "displayName") isEqualTo "")} do {
                        _parent = inheritsFrom _x;
                    };
                    _name = getText (_parent >> "displayName");

                    if !(_name isEqualTo "") then {
                        _message = format["%1 (magazine: %2)", _message, _name];
                    };
                    
                };  
            
            } forEach ([configFile >> "CfgMagazines", 0, true] call BIS_fnc_returnChildren);
            
        };

	} else {

        private _vec = _victim;
        
		private _faction = (getText(configFile >> 'CfgVehicles' >> typeOf _vec >> 'faction'));
		private _name = (getText(configFile >> 'CfgVehicles' >> typeOf _vec >> 'displayName'));
        private _light = (EGVAR(warehouse,nato_vehicles) + EGVAR(warehouse,csat_vehicles)) apply {toLower (_x select 0)};
        private _heavy = (EGVAR(warehouse,nato_armored) + EGVAR(warehouse,csat_armored)) apply {toLower (_x select 0)};
        private _air = (EGVAR(warehouse,nato_choppers) + EGVAR(warehouse,csat_choppers)) apply {toLower (_x select 0)};
        private _category = if (toLower (typeOf _vec) in _light) then {
            "Leicht"
        } else {
            if (toLower (typeOf _vec) in _heavy) then {
                "Schwer"
            } else {
                if (toLower (typeOf _vec) in _air) then {
                    "Flug"
                } else {
                    "Unbekannt"
                };
            };
        };
		_message = format["Fahrzeug: %1 (category: %2) (side: %3)", _name, _category, _faction];

		// Täter nicht bekannt?
		if !(_instigator isEqualTo objNull) then {

            // Selbstverschulden?
			if (_vec == _source) then {
				_message = format["%1 von: Selbstverschulden", _message];

			} else {
                 // source is vehicle or player?
                if (_source isEqualTo _instigator) then {
                    _message = format[
                        "%1 von: %2 (side: %3).",
                        _message, UNIT_NAME(_instigator), UNIT_SIDE(_instigator)
                    ];
                } else {
                    private _name = getText (configFile >> "CfgVehicles" >> typeOf _source >> "displayName");
                    private _killerTxt = [];
                    // in case of a vehicle, credit kill to all crew members
                    {
                        private _unit = _x select 0;
                        private _cargoIdx = _x select 2;

                        // crew member have cargo index of -1, else > 0
                        if (_cargoIdx == -1) then {
                             _killerTxt pushBack format[
                                "%1 (side: %2) (vehicle: %3)",
                                UNIT_NAME(_unit), UNIT_SIDE(_unit), _name
                            ];
                        };
                       
                    } forEach (fullCrew _source);

                    _killerTxt = _killerTxt joinString ", ";
                    _message = format[
                        "%1 von: %2", _message, _killerTxt
                    ];

                };
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
        private _message = format["%1 (%2), PUID %3", _x select 1, _x select 2, _x select 0];
        [QGVAR(write), [_cat, _message]] call CBA_fnc_localEvent;

    } forEach GVAR(playerList);

}] call CBA_fnc_addEventHandler;

[QGVAR(printFPS), {

    private _cat = "FPS";
    {   
        private _key = x;
        private _val = HASH_GET(GVAR(fpsHash), _key);

        _val params ["_unitFps", "_unitFpsMin"];

        private _message = format["Avg. FPS for %1: %2", _key, _unitFps];
        [QGVAR(write), [_cat, _message]] call CBA_fnc_localEvent;

        private _message = format["Min. FPS for %1: %2", _key, _unitFpsMin];
        [QGVAR(write), [_cat, _message]] call CBA_fnc_localEvent;

        private _sum = 0;
        {
            _sum = _sum + _x;
        } forEach _unitFps;
        private _mean = _sum / (count _unitFps);

        private _message = format["Single avg. FPS for %1: %2", _key, _mean];
        [QGVAR(write), [_cat, _message]] call CBA_fnc_localEvent;

        private _sum = 0;
        {
            _sum = _sum + _x;
        } forEach _unitFpsMin;
        private _mean = _sum / (count _unitFpsMin);

        private _message = format["Single min. FPS for %1: %2", _key, _mean];
        [QGVAR(write), [_cat, _message]] call CBA_fnc_localEvent;

    } forEach HASH_GETKEYS(GVAR(fpsHash));

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