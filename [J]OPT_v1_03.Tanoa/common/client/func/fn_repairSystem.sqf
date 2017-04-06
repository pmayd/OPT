/*
	author: 		James
	file: 			fn_xReload.sqf
	version: 		1.00
	date: 			2017-04-06	
	purpose: 		Gibt jedem Fahrzeug im Bereich des Triggers 2 Einträge zum Auftanken und Reparieren. Entfernt die Einträge beim Verlassen des Triggers. Führt ebenfalls die entsprechenden Arbeiten bei Aufruf durch	
	arguments: 	
		- state(bool): true - Bereich aktiv, false - Bereich inaktiv	
	return value:		none

	example call: 		[thistrigger, true] execVM "fn_xReload.sqf"
*/

// arguments
private _state = param [0, false, [true]]; // Bereich aktiv oder inaktiv
private _vec = player getVariable ["opt_repairSystem_vec", objNull]; //Variable wird vom Trigger gesetzt, damit ist das Fahrezug immer 100% bestimmt

hint str(_this);
sleep 3;
hint str(_vec);
sleep 3;

// begin of script
// Fehlerbehandlung
if (isNull _vec) exitWith {"Kein gültiges Fahrzeug übergeben"};

// Skriptteil für aktiven Bereich
// Aktioneinträge zuweisen
if (_state) then {

	// Aktionseinträge müssen dem Fahrzeug gegeben werden, da im Fahrzeug nicht mehr nutzbar
	// nur für den auslösenden Spieler sichtbar, da addAction immer LOCAL!
	private _action1 = _vec addAction ["<t size=""1.2"">Fahrzeug auftanken</t>", {

		params ["_vec"];

		// als erstes Fahrzeug anhalten
		_vec engineOn false;
		_vec setFuel 0;

		for "_i" from 0 to 100 step 1 do {
			hintSilent format["Fahrzeug wird aufgetankt\nTank bei %1|100", _i];
			sleep 0.1;
		};

		_vec setFuel 1;

	}, [_vec], 100];

	private _action2 = _vec addAction ["<t size=""1.2"">Fahrzeug reparieren</t>", {
		
		params ["_vec"];

		// als erstes Fahrzeug anhalten
		_vec engineOn false;
		_vec setFuel 0;

		for "_i" from 0 to 100 step 1 do {
			hintSilent format["Fahrzeug wird repariert\nZustand bei %1|100", _i];
			sleep 0.1;
		};

		_vec setFuel 1;
		_vec setDamage 0;

	}, [_vec], 100];

	_vec setVariable ["opt_repairSystem", [_action1, _action2]];

} // Skriptteil für deaktivierten Bereich
else {

	// entferne vorherige Aktioneinträge
	{
		_vec removeAction _x;
	} foreach (_vec getVariable ["opt_repairSystem", []])
	
};




