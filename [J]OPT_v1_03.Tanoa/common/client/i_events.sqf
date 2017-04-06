/**
registriert alle Events via CBA Event Handling 
wird in der init.sqf aufgerufen
*/

// fügt einen AddAction Eintrag hinzu
["opt_eh_client_add_action", {
	params ["_obj", "_parameter"];

	_obj addAction _parameter;

}] call CBA_fnc_addEventHandler;