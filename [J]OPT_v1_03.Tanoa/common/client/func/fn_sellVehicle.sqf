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
#define vhOrder_dialog 20000
#define vhOrder_vehiclelist 20100
#define vhOrder_pricelist 20101

// begin of script
disableSerialization;

_display = findDisplay vhOrder_dialog;
_listbox_vehicle = _display displayCtrl vhOrder_vehiclelist;
_listbox_price = _display displayCtrl vhOrder_pricelist;
_index = lbCurSel _listbox_vehicle;

if (_index < 0) exitWith {
	txt = "Bitte ein Fahrzeug auswählen";
	[format ["<t size='0.8' shadow='1' color='#ff0000'>%1</t>",txt], (safeZoneX - 0.0), (safeZoneY + 0.25), 3, 1, 0, 3] spawn BIS_fnc_dynamicText;
};

_pool = (opt_vehiclesNato + opt_choppersNato + opt_armoredNato + opt_suppliesNato + opt_seaNato + opt_vehiclesCsat + opt_choppersCsat + opt_armoredCsat + opt_suppliesCsat + opt_seaCsat);
_selectedVehicle = (opt_vehicles_to_sell select _index) select 0;
_selectionText = _listbox_vehicle lbText _index;
_unitCost = parseNumber (_listbox_price lbText _index);

["opt_eh_server_update_budget", [playerSide, _unitCost, "+"]] call CBA_fnc_serverEvent;
call compile deleteVehicle _selectedVehicle;

[format ["<t size='0.8' shadow='1' color='#ffffff'>%1 für %2 verkauft</t>", _selectionText, _unitCost], (safeZoneX - 0.0), (safeZoneY + 0.25), 3, 1, 0, 3] spawn BIS_fnc_dynamicText;

// neu öffnen
[] call opt_fnc_updateBudget;

