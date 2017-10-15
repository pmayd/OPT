/**
* Author: James
* load opt_warehouse_dlg_order and prefill controls
*
* Arguments:
* 0: <STRING> category to load
*
* Return Value:
* None
*
* Example:
* ['vehicles'] call fnc_vehicleOrder.sqf;
*
*/
#include "script_component.hpp"

#define IDD_DLG_ORDER 20000
#define IDC_CTRL_VEHICLE_LIST 20100
#define IDC_CTRL_PRICE_LIST 20101

private _side = playerSide;

params [
    ["_type", "", ["s"], 1]
];
GVAR(vehicleType) = _type;

private _pool = switch (GVAR(vehicleType)) do {
    case "vehicles" : {
        if (_side == west) then {
            GVAR(nato_vehicles) + GVAR(nato_vehicles_supply)
        } else {
            GVAR(csat_vehicles) + GVAR(csat_vehicles_supply)
        };

    };
	case "choppers" : {
        if (_side == west) then {
            GVAR(nato_choppers)
        } else {
            GVAR(csat_choppers)
        };
        
    };
	case "armored" : {
        if (_side == west) then {
            GVAR(nato_armored)
        } else {
            GVAR(csat_armored)
        };
        
    };
	case "supplies" : {
        if (_side == west) then {
            GVAR(nato_supplies) + GVAR(nato_static)
        } else {
            GVAR(csat_supplies) + GVAR(csat_static)
        };
        
    };
	case "sea" : {
        if (_side == west) then {
            GVAR(nato_sea)
        } else {
            GVAR(csat_sea)
        };
        
    };
	case "sell" : {[]};
    default {[]};
};

// show onlly objects with a price greater than 0 €
GVAR(orderDialogObjects) = _pool select {_x select 1 > 0};

// player sideChat format ["%1", GVAR(orderDialogObjects)];
createDialog "opt_warehouse_dlg_order";
disableSerialization;

private _display = findDisplay IDD_DLG_ORDER;
private _listbox_vehicle = _display displayCtrl IDC_CTRL_VEHICLE_LIST;
private _listbox_price = _display displayCtrl IDC_CTRL_PRICE_LIST;
private _budget = _display displayCtrl 20102;
private _order = _display displayCtrl 20002;
private _close = _display displayCtrl 20003;
private _sell = _display displayCtrl 20004;

[_budget] call EFUNC(common,renderBudget);

{
	_displayName = getText (configFile >> "CfgVehicles" >> (_x select 0) >> "displayName");
	_listbox_vehicle lbAdd format ["%1", _displayName];
	_listbox_price lbAdd format ["%1 €", (_x select 1)];
} forEach GVAR(orderDialogObjects);

// deaktiviere Verkaufenbutton für alle Dialoge außer "sell"
if (count GVAR(orderDialogObjects) != 0) then {
	_sell ctrlShow false;

} else {
	_order ctrlEnable false;

	// im Falle des Verkaufsbuttons -> Liste aller gefundenen Fahrzeuge
	// alle Objekte im Radius von __ORDER_SELL_RADIUS__ Metern um das Pad -> im Idealfall nur das zu verkaufende Fahrzeug
	_spawnpos = nearestObject [player, "Land_HelipadCircle_F"];
	_objs = nearestObjects [_spawnpos, ["AllVehicles", "Thing"], __ORDER_SELL_RADIUS__];
	GVAR(vehiclesToSell) = [];

	// gehe alle gefundenen Objekte durch und lösche sie, falls nicht in pool, oder ergänze um Verkaufspreis
	{
		
        _index = (GVAR(all) find _x);

		if (_index == -1) then {
			_objs = _objs - [_x]; 
		} else {
			GVAR(vehiclesToSell) pushBack [_x, (GVAR(all) select _index) select 2]; // füge Fahrzeug und Verkaufspreis hinzu
		};

	} foreach _objs;

	{
		_displayName = getText (configFile >> "CfgVehicles" >> (typeOf (_x select 0)) >> "displayName");
		_listbox_vehicle lbAdd format ["%1", _displayName]; // Name
		// Verkaufspreis berechnen -> __ORDER_SELL_RETURN_VALUE__ % vom Vollpreis
		_listbox_price lbAdd format ["%1 €", (_x select 1) * __ORDER_SELL_RETURN_VALUE__]; // Preis
	} foreach GVAR(vehiclesToSell);

};
