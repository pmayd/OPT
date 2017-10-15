/**
* Author: James
* register all CBA EH  for the logging systemChat
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

/**
registriert alle Events via CBA Event Handling 
wird in der initServer.sqf aufgerufen
*/

// loggt Abschüsse
[QGVAR(kill), {
	params ["_victim", "_killer"];

	private _cat = "Abschuss";
	private _message = "";

	// Abschuss war Spieler oder Fahrzeug?
	if (_victim isKindOf "Man") then {

		if (_victim == _killer || isNull _killer) then {
			_message = format["%1 (%2) von: Selbstverschulden.", name _victim, _victim getVariable "opt_var_playerSide"];

		} else {
			_message = format["%1 (%2) von: %3 (%4).", name _victim, _victim getVariable "opt_var_playerSide", name _killer, _killer getVariable "opt_var_playerSide"];

		};

	} else {

		private _faction = (getText(configFile >> 'CfgVehicles' >> typeOf _vec >> 'faction'));
		private _name = (getText(configFile >> 'CfgVehicles' >> typeOf _vec >> 'displayName'));
		_message = format["Fahrzeug: %1 (%2) - ", _name, _faction];

		// Täter nicht bekannt?
		if (isNull _killer) then {
			_message = format["%1 von: unbekannt", _message];

		} else {

			// Selbstverschulden?
			if (_vec == _killer) then {
				_message = format["%1 von: Selbstverschulden", _message];

			} else {

				_message = format["%1 von: %2 (%3).", _message, name _killer, _faction];

			};

		};

	};

	// übergib Kategorie und Nachricht an log-FUnktion
	[QGVAR(write), [_cat, _message]] call CBA_fnc_localEvent;

}] call CBA_fnc_addEventHandler;


// schreibt eine log Nachricht in die SERVER-RPT
[QGVAR(write), {
	params ["_category","_message"];

	private _timestemp = [serverTime - EGVAR(mission,startTime)] call CBA_fnc_formatElapsedTime;

	diag_log format["OPT LOG BEGIN: %1 - %2 || %3 :OPT LOG END", _timestemp, _category, _message];
	
}] call CBA_fnc_addEventHandler;

// update budget
// TODO: gehört nicht hierher
[QGVAR(updateBudget), {
	params ["_side", "_unitCost", "_sign"];

	private _cat = "Budget";
	private _message = "";
	private _budget_neu = 0;

	switch (_sign) do {
		case "-": {
				if (_side == WEST) then {
					_budget_neu = GVARMAIN(nato_budget) - _unitCost;
				} else {
					_budget_neu = GVARMAIN(csat_budget) - _unitCost;
				};

		};
		case "+":  {
				if (_side == WEST) then {
					_budget_neu = GVARMAIN(nato_budget) + _unitCost;
				} else {					
					_budget_neu = GVARMAIN(csat_budget) + _unitCost;
				};
                
		};
	};

	// server log sowie Aktualisierung via publicVarialbe
	if (_side == west) then {
		_message = format["NATO alt: %1 - neu: %2 - Differenz: %3%4", GVARMAIN(nato_budget), _budget_neu, _sign, _unitCost];
		GVARMAIN(nato_budget) = _budget_neu;
		publicVariable QGVARMAIN(nato_budget);

	} else {
		_message = format["CSAT alt: %1 - neu: %2 - Differenz: %3%4", GVARMAIN(csat_budget), _budget_neu, _sign, _unitCost];
		GVARMAIN(csat_budget) = _budget_neu;
		publicVariable QGVARMAIN(csat_budget);

	};
	
	[QGVAR(write), [_cat, _message]] call CBA_fnc_localEvent;

}] call CBA_fnc_addEventHandler;

// Zeus neu vergeben
// TODO: gehört nicht ins Log modul
[QGVAR(renewCurator), {

	params ["_operator"];

	if (_operator in (allCurators apply {getAssignedCuratorUnit _x})) then {
        _id = (allCurators apply {getAssignedCuratorUnit _x}) find _operator;
        _module = allCurators select _id;
        unassignCurator _module;
        _operator assignCurator _module;	
    };
    
}] call CBA_fnc_addEventHandler;