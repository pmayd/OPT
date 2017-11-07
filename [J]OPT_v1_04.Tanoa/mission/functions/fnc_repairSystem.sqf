/**
* Author: James
* add addAction entries to vehicle that activated the triggerActivated
* repair and rearm vehicle. If vehicle is leaving the trigger zone
* actions are removed.
*
* Arguments:
* 0: <BOOL> true: add action menu entries, false: remove
*
* Return Value:
* None
*
* Example:
* [thistrigger, true] call fnc_repairSystem.sqf;
*
*/
#include "script_component.hpp"
// arguments
private _state = param [0, false, [true]]; // Bereich aktiv oder inaktiv

// Skriptteil für aktiven Bereich
// Aktioneinträge zuweisen
if (_state) then {

	// binde Fahrzeug an Spieler
	private _vec = objectParent player;
	player setVariable [QGVAR(repairSystem_vec), _vec];

	// Aktionseinträge müssen dem Fahrzeug gegeben werden, da im Fahrzeug nicht mehr nutzbar
	// nur für den auslösenden Spieler sichtbar, da addAction immer LOCAL!
	private _action1 = _vec addAction ["<t size=""1.2"">Fahrzeug auftanken</t>", {

		params ["_vec"];

		// als erstes Fahrzeug anhalten
		_vec engineOn false;
		_vec setFuel 0;

        for "_i" from 0 to 100 do {
            hintSilent format["Fahrzeug wird betankt...\n%1 von 100\%2.", _i, '%'];
            uiSleep 0.1;
        };

        _vec setFuel 1;

	}, [], 100];

	private _action2 = _vec addAction ["<t size=""1.2"">Fahrzeug reparieren</t>", {
		
		params ["_vec"];

		// als erstes Fahrzeug anhalten
		_vec engineOn false;
        private _fuel = fuel _vec;

        _vec setFuel 0;
        
        for "_i" from 0 to 100 do {
            hintSilent format["Fahrzeug wird repariert...\n%1 von 100\%2.", _i, '%'];
            uiSleep 0.1;
        };

        _vec setFuel _fuel;
        _vec setDamage 0;


	}, [], 100];

	_vec setVariable [QGVAR(repairSystem_actions), [_action1, _action2]];

} // Skriptteil für deaktivierten Bereich
else {

	_vec = player getVariable [QGVAR(repairSystem_vec), objNull];
	// entferne vorherige Aktioneinträge
	{
		_vec removeAction _x;
	} foreach (_vec getVariable [QGVAR(repairSystem_actions), []]);

	player setVariable [QGVAR(repairSystem_vec), objNull];
	
};




