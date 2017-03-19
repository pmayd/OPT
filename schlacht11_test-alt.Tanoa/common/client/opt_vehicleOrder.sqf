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
};

// player sideChat format ["%1", opt_orderDialogObjects];

createDialog "opt_vehicleorder_dialog";
disableSerialization;

_display = findDisplay vhOrder_dialog;
_listbox_vehicle = _display displayCtrl vhOrder_vehiclelist;
_listbox_price = _display displayCtrl vhOrder_pricelist;
_budget = _display displayCtrl 20102;

_side_Budget = if (_side == west) then {opt_west_budget} else {opt_east_budget};
_txt = if (_side_Budget > 999999) then {
	_side_Budget = _side_Budget / 1000000;
	format ["Budget: %1 Mio. €", str(_side_Budget)];	// psycho: budget muss numerisch reduziert werden um Darstellung aufrecht zu erhalten
} else {
	format ["Budget: %1 €", str(_side_Budget)];
};
_budget ctrlSetText _txt;

_pool = [];
{if ((_x select 1) > 0) then {_pool pushBack _x}} forEach opt_orderDialogObjects;
opt_orderDialogObjects = _pool;

{
	_displayName = getText (configFile >> "CfgVehicles" >> (_x select 0) >> "displayName");
	_listbox_vehicle lbAdd format ["%1", _displayName];
	_listbox_price lbAdd format ["%1 €", (_x select 1)];
} forEach opt_orderDialogObjects;