/**
* Author: James
* read out vehicle info from config
*
* Arguments:
* 0 <STRING>: classname
*
* Return Value:
* 0 <STRUCTURED_TEXT>: info as structured text
*
* Example:
* ["myclass"] call fnc_getVehicleInfo.sqf;
*
*/
#include "script_component.hpp"

params ["_class", "_kindOfOrder"];

private _return = "";

/* INFO FOR ALL TYPES OF OBJECTS */
private _price = 0;
private _priceTxt = "";
switch (GVAR(vehicleType)) do {
    case "sell": {
        _price = (GVAR(all) select {toLower (_x select 0) isEqualTo toLower _class}) select 0 select 2;
        _priceTxt = "Gutschrift";
    };
    default {
        _price = (GVAR(all) select {toLower (_x select 0) isEqualTo toLower _class}) select 0 select 1;
        _priceTxt = "Kaufpreis";
    };
};

//ACE Laderaum Berechnung 
private _cargo_space = getNumber (configFile >> "CfgVehicles" >> _class >> "ACE_cargo_space") max 0;
private _cargo_size = getNumber (configFile >> "CfgVehicles" >> _class >> "ACE_cargo_size") max 0;

/* ONLY FOR VEHICLES AND AIR */
if (_class isKindOf "AllVehicles" and !(_class isKindOf "StaticWeapon")) then {
    private _weapons = [];
    private _weaponsClass = getArray(configFile >> "cfgVehicles" >> _class >> "weapons");
    {
        private _name = getText (configFile >> "cfgWeapons" >> _x >> "displayName");
        _weapons pushBack _name;

    } forEach _weaponsClass; 

    private _weapArray = [];
    if (isClass (configFile >> "cfgVehicles" >> _class >> "Turrets" >> "M2_Turret")) then {
        _weapArray = getArray(configFile >> "cfgVehicles" >> _class >> "Turrets" >> "M2_Turret" >> "weapons");

    } else {
        _weapArray = getArray(configFile >> "cfgVehicles" >> _class >> "Turrets" >> "MainTurret" >> "weapons");
        _weapArray append (getArray(configFile >> "cfgVehicles" >> _class >> "Turrets" >> "FrontTurret" >> "weapons"));
        _weapArray append (getArray(configFile >> "cfgVehicles" >> _class >> "Turrets" >> "RearTurret" >> "weapons"));

    };

    {
        private _name = getText (configFile >> "cfgWeapons" >> _x >> "displayName");
        _weapons pushBack  _name;

    } forEach _weapArray;

    // Aufbereitung Waffenanzeige
    _weapons deleteAt (_weapons find "Horn");
    private _newweapons = "";
    {
        _newweapons =_newweapons + _x + ", ";

    } foreach _weapons;

    _newweapons = _newweapons select [0, count _newweapons - 2];

    private _crewCount = [_class, true] call BIS_fnc_crewCount;
    private _model = getText(configFile >> "cfgVehicles" >> _class >> "model");
    private _maxSpeed = getNumber(configFile >> "cfgVehicles" >> _class >> "maxSpeed");

    //Treibstoffberechnung 
    private _redRpm = 1;
    _redRpm = getNumber(configFile >> "cfgVehicles" >> _class >> "redRpm");
    private _fuelCapacity = 0;
    if (_class isKindOf "Helicopter") then {_fuelCapacity = 15;};
    if (_class isKindOf "Plane") then {_fuelCapacity = 30;};
    if (_class isKindOf "car") then {
        _fuelCapacity = round ((getNumber(configFile >> "cfgVehicles" >> _class >> "fuelCapacity")) /(_redRpm * 0.000056896));
    };
    if (_class isKindOf "APC") then {
        _fuelCapacity = round ((getNumber(configFile >> "cfgVehicles" >> _class >> "fuelCapacity"))/(_redRpm * 0.000056896));
    };
    if (_class isKindOf "Tank") then {
        _fuelCapacity = round ((getNumber(configFile >> "cfgVehicles" >> _class >> "fuelCapacity"))/(_redRpm * 0.000056896));
    };

    private _armor = getNumber(configFile >> "cfgVehicles" >> _class >> "armor");

    _return = format [
"<t size='0.9'><t align='left'>%1:</t> <t align='right' color='#00ff00'>%2</t><br/>
<t align='left'>Waffen:</t><br/>
<t align='left' color='#00ff00'>%3</t><br/>
<t align='left'>Sitzplätze:</t> <t align='right' color='#00ff00'>%4</t><br/>
<t align='left'>Max. Geschwindigkeit:</t> <t align='right' color='#00ff00'>%5</t><br/>
<t align='left'>Treibstoffmenge:</t> <t align='right' color='#00ff00'>%6 Min</t><br/>
<t align='left'>Panzerung:</t> <t align='right' color='#00ff00'>%7</t><br/></t>
<t align='left'>Laderaum:</t> <t align='right' color='#00ff00'>%8 l</t><br/></t>",
_priceTxt, _price, _newweapons, _crewCount, _maxSpeed, _fuelCapacity, _armor, _cargo_space
    ];

};

/* ONLY FOR STATIC WEAPONS */
if (_class isKindOf "StaticWeapon") then {

    private _weapons = [];
    private _weaponsClass = getArray(configFile >> "cfgVehicles" >> _class >> "weapons");
    {
        private _name = getText (configFile >> "cfgWeapons" >> _x >> "displayName");
        if !(_name isEqualTo "") then {
            _weapons pushBack _name;
        };

    } forEach _weaponsClass; 

    private _weapArray = [];
    if (isClass (configFile >> "cfgVehicles" >> _class >> "Turrets" >> "M2_Turret")) then {
        _weapArray = getArray(configFile >> "cfgVehicles" >> _class >> "Turrets" >> "M2_Turret" >> "weapons");

    } else {
        _weapArray = getArray(configFile >> "cfgVehicles" >> _class >> "Turrets" >> "MainTurret" >> "weapons");
        _weapArray append (getArray(configFile >> "cfgVehicles" >> _class >> "Turrets" >> "FrontTurret" >> "weapons"));
        _weapArray append (getArray(configFile >> "cfgVehicles" >> _class >> "Turrets" >> "RearTurret" >> "weapons"));

    };

    {
        private _name = getText (configFile >> "cfgWeapons" >> _x >> "displayName");
        _weapons pushBack  _name;

    } forEach _weapArray;

    // Aufbereitung Waffenanzeige
    private _newweapons = "";
    {
        _newweapons =_newweapons + _x + ", ";

    } foreach _weapons;

    _newweapons = _newweapons select [0, count _newweapons - 2];

    private _crewCount = [_class, true] call BIS_fnc_crewCount;
    private _model = getText(configFile >> "cfgVehicles" >> _class >> "model");

    _return = format [
"<t size='0.9'><t align='left'>%1:</t> <t align='right' color='#00ff00'>%2</t><br/>
<t align='left'>Waffen:</t><br/>
<t align='left' color='#00ff00'>%3</t><br/>
<t align='left'>Sitzplätze:</t> <t align='right' color='#00ff00'>%4</t><br/>
<t align='left'>Volumen:</t> <t align='right' color='#00ff00'>%5 l</t><br/></t>",
_priceTxt, _price, _newweapons, _crewCount, _cargo_size
    ];

};

/* ONLY FOR AMMO BOXES */

if (_class isKindOf "ThingX") then {
    private _transportItems = (configFile >> "CfgVehilces" >> _class >> "TransportItems");
    private _items = "";

    if (isClass _transportItems) then {
        {   
            private _class = getText (_x >> "name");
            private _displayName = getText (configFile >> "CfgWeapons" >> _class >> "displayName");

            private _count = getNumber (_x >> "count");

            _items = format["%1%2 (%3), ", _items, _displayName, _count];

        } forEach _transportItems;

        _items = _items select [0, count _items -2];

    };

    private _transportMagazines = (configFile >> "CfgVehilces" >> _class >> "TransportMagazines");
    private _magazines = "";

    if (isClass _transportMagazines) then {
        {   
            private _class = getText (_x >> "magazine");
            private _displayName = getText (configFile >> "CfgMagazines" >> _class >> "displayName");

            private _count = getNumber (_x >> "count");

            _items = format["%1%2 (%3), ", _magazines, _displayName, _count];

        } forEach _transportMagazines;

        _magazines = _magazines select [0, count _items -2];

    };

    private _transportWeapons = (configFile >> "CfgVehilces" >> _class >> "TransportWeapons");
    private _weapons = "";

    if (isClass _transportWeapons) then {
        {   
            private _class = getText (_x >> "weapon");
            private _displayName = getText (configFile >> "CfgWeapons" >> _class >> "displayName");

            private _count = getNumber (_x >> "count");

            _items = format["%1%2 (%3), ", _weapons, _displayName, _count];

        } forEach _transportWeapons;

        _weapons = _weapons select [0, count _items -2];

    };

    _return = format [
"<t size='0.9'><t align='left'>%1:</t> <t align='right' color='#00ff00'>%2</t><br/>
<t align='left'>Waffen:</t> <t align='right' color='#00ff00'>%3</t><br/>
<t align='left'>Magazine:</t> <t align='right' color='#00ff00'>%4</t><br/>
<t align='left'>Items:</t> <t align='right' color='#00ff00'>%5</t><br/>
<t align='left'>Volumen:</t> <t align='right' color='#00ff00'>%6 l</t><br/></t>",
_priceTxt, _price,  _weapons, _magazines, _items, _cargo_size
    ];

};

_return	