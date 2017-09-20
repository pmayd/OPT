/*
	Order Vehicles

	Author: schmingo (OPT MOD Team)

	v2015-01-15 | this script is part of OperationPandoraTrigger ArmA3 script collection
*/
#include "..\..\setup\setup.sqf"

#define vhOrder_dialog 20000
#define vhOrder_vehiclelist 20100
#define vhOrder_pricelist 20101

private ["_side", "_display", "_listbox", "_displayName", "_pool"];
_side = playerSide;
opt_orderDialogObjects 	= [];
opt_vehicleType = _this select 3;

opt_orderDialogObjects = switch (opt_vehicleType) do {
  case "vehicles" : {if (_side == west) then {opt_vehiclesNato + opt_vehiclesSupplyNato} else {opt_vehiclesCsat + opt_vehiclesSupplyCsat}};
	case "choppers" : {if (_side == west) then {opt_choppersNato} else {opt_choppersCsat}};
	case "armored" : {if (_side == west) then {opt_armoredNato} else {opt_armoredCsat}};
	case "supplies" : {if (_side == west) then {opt_suppliesNato} else {opt_suppliesCsat}};
	case "sea" : {if (_side == west) then {opt_seaNato} else {opt_seaCsat}};
	case "sell" : {[]};
};

// player sideChat format ["%1", opt_orderDialogObjects];
createDialog "opt_vehicleorder_dialog";
disableSerialization;

_display = findDisplay vhOrder_dialog;
_listbox_vehicle = _display displayCtrl vhOrder_vehiclelist;
_listbox_price = _display displayCtrl vhOrder_pricelist;
_budget = _display displayCtrl 20102;
_order = _display displayCtrl 20002;
_close = _display displayCtrl 20003;
_sell = _display displayCtrl 20004;

[_budget] call opt_fnc_renderBudget;

_pool = [];
{
	if ((_x select 1) > 0) then {_pool pushBack _x}

} forEach opt_orderDialogObjects;
opt_orderDialogObjects = _pool;

{
	_displayName = getText (configFile >> "CfgVehicles" >> (_x select 0) >> "displayName");
	_listbox_vehicle lbAdd format ["%1", _displayName];
	_listbox_price lbAdd format ["%1 €", (_x select 1)];
} forEach opt_orderDialogObjects;

// deaktiviere Verkaufenbutton für alle Dialoge außer "sell"
if (count opt_orderDialogObjects != 0) then {
	_sell ctrlShow false;

} else {
	_order ctrlEnable false;

	// im Falle des Verkaufsbuttons -> Liste aller gefundenen Fahrzeuge
	// alle Objekte im Radius von __ORDER_SELL_RADIUS__ Metern um das Pad -> im Idealfall nur das zu verkaufende Fahrzeug
	_spawnpos = nearestObject [player, "Land_HelipadCircle_F"];
	_objs = nearestObjects [_spawnpos, ["AllVehicles","Thing"], __ORDER_SELL_RADIUS__];
	opt_vehicles_to_sell = [];

	_pool = (opt_vehiclesNato + opt_choppersNato + opt_armoredNato + opt_vehiclesCsat + opt_choppersCsat + opt_armoredCsat);
	// gehe alle gefundenen Objekte durch und lösche sie, falls nicht in pool, oder ergänze um Preis

	{
		_index = (_pool apply {toLower (_x select 0)}) find (toLower (typeOf _x));

		if (_index == -1) then {
			_objs = _objs - [_x];
		} else {
			opt_vehicles_to_sell pushBack [_x, (_pool select _index) select 1];
		};

	} foreach _objs;

	{
		_displayName = getText (configFile >> "CfgVehicles" >> (typeOf (_x select 0)) >> "displayName");
		_listbox_vehicle lbAdd format ["%1", _displayName]; // Name
		// Verkaufspreis berechnen -> __ORDER_SELL_RETURN_VALUE__ % vom Vollpreis
		_listbox_price lbAdd format ["%1 €", (_x select 1) * __ORDER_SELL_RETURN_VALUE__]; // Preis
	} foreach opt_vehicles_to_sell;

};
