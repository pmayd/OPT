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
			_message = format["%1 (%2) von: Selbstverschulden.", name _victim, _victim getVariable QGVARMAIN(playerSide)];

		} else {
			_message = format["%1 (%2) von: %3 (%4).", name _victim, _victim getVariable QGVARMAIN(playerSide), name _killer, _killer getVariable QGVARMAIN(playerSide)];

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