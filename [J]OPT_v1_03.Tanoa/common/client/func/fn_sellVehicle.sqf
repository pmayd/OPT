/*
	author: 		James
	file: 			fn_sellVehicle.sqf
	version: 		1.00
	date: 			2017-04-03	
	purpose: 		Wird vom Dialog opt_vehicleorder_dialog aufgerufen
	arguments: 	keine
	return value:		keine

	example call: 	nur vom Dialog aus aufrufbar
*/
#include "..\..\..\setup\setup.sqf";
// begin of script
// Fahrzeug auf Pad erkennen
_spawnpos = nearestObject [player, "Land_HelipadCircle_F"];

// alle Objekte im Radius von 5 Metern um das Pad -> im Idealfall nur das zu verkaufende Fahrzeug
_objs = nearestObjects [_spawnpos, ["AllVehicles","Thing"], 5];

// Fehler wenn kein oder mehr als 1 Fahrzeug
if (count _objs == 0) exitWith {
	_txt = "Kein Fahrzeug oder keine Kiste im Bereich gefunden!";
	[format ["<t size='0.8' shadow='1' color='#ff0000'>%1</t>",_txt], (safeZoneX - 0.0), (safeZoneY + 0.25), 3, 1, 0, 3] spawn BIS_fnc_dynamicText;
};

if (count _objs > 1) exitWith {
	_txt = "Zuviele Fahrzeuge und/oder Kisten im Bereich gefunden!";
	[format ["<t size='0.8' shadow='1' color='#ff0000'>%1</t>",_txt], (safeZoneX - 0.0), (safeZoneY + 0.25), 3, 1, 0, 3] spawn BIS_fnc_dynamicText;
};

_vec_to_sell = (_objs select 0);

// Preis herausfinden
_pool = (opt_vehiclesNato + opt_choppersNato + opt_armoredNato + opt_suppliesNato + opt_seaNato + opt_vehiclesCsat + opt_choppersCsat + opt_armoredCsat + opt_suppliesCsat + opt_seaCsat);
_index = (_pool apply {_x select 0}) find typeOf (_vec_to_sell);

if (_index == -1) exitWith {
	_txt = "Zu diesem Objekt gibt es keinen Preis!";
	[format ["<t size='0.8' shadow='1' color='#ff0000'>%1</t>",_txt], (safeZoneX - 0.0), (safeZoneY + 0.25), 3, 1, 0, 3] spawn BIS_fnc_dynamicText;
};

// Objekt löschen und Preis gutschreiben.
_price = (_pool select _index) select 1;

_price = _price * __ORDER_SELL_RETURN_VALUE__;

#ifdef __ORDER_SELL_WITH_DAMAGE__
	_price = _price * (1 - damage _vec_to_sell);

#endif

["opt_eh_server_update_budget", [playerSide, _price, "+"]] call CBA_fnc_serverEvent;
deleteVehicle _vec_to_sell;


