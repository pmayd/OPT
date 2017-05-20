/*
	Order Vehicles

	Author: schmingo (OPT MOD Team)

	v2015-01-15 | this script is part of OperationPandoraTrigger ArmA3 script collection
*/

#define vhOrder_dialog 20000
#define vhOrder_vehiclelist 20100
#define vhOrder_pricelist 20101

private ["_side", "_display", "_listbox", "_displayName", "_pool"];
_side = playerSide;
opt_orderDialogObjects 	= [];
opt_vehicleType = _this select 3;

opt_orderDialogObjects = switch (opt_vehicleType) do {
  case "vehicles" : {if (_side == west) then {opt_vehiclesNato} else {opt_vehiclesCsat}};
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
_sell = _display displayCtrl 20003;

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
	_sell ctrlEnable false;
};