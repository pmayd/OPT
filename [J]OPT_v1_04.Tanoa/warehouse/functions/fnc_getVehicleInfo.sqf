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

private _crewCount = [_class, true] call BIS_fnc_crewCount;
private _model = getText(configFile >> "cfgVehicles" >> _class >> "model");
private _maxSpeed = getNumber(configFile >> "cfgVehicles" >> _class >> "maxSpeed");
private _invSpace = getNumber(configFile >> "cfgVehicles" >> _class >> "maximumLoad");
private _armor = getNumber(configFile >> "cfgVehicles" >> _class >> "armor");
private _price = 0;
private _priceTxt = "";
switch (GVAR(vehicleType)) do {
    case "sell": {
        _price = (GVAR(all) select {_x select 0 isEqualTo _class}) select 0 select 2;
        _priceTxt = "Gutschrift";
    };
    default {
        _price = (GVAR(all) select {_x select 0 isEqualTo _class}) select 0 select 1;
        _priceTxt = "Kaufpreis";
    };
};

private _return = format ["   <t size='0.9'><t align='left'>%1:</t> <t align='right' color='#00ff00'>%2</t><br/>
    <t align='left'>Waffen:</t><br/>
    <t align='left' color='#00ff00'>%3</t><br/>
    <t align='left'>Sitzplätze:</t> <t align='right' color='#00ff00'>%4</t><br/>
    <t align='left'>Max. Geschwindigkeit:</t> <t align='right' color='#00ff00'>%5</t><br/>
    <t align='left'>Ladekapazität:</t> <t align='right' color='#00ff00'>%6</t><br/>
    <t align='left'>Panzerung:</t> <t align='right' color='#00ff00'>%7</t><br/></t>",
    _priceTxt, _price, _weapons, _crewCount, _maxSpeed, _invSpace, _armor
];

_return	