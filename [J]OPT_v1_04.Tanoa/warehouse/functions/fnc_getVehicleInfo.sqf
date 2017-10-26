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

params ["_class"];

private _weapons = [];
private _weaponsClass = getArray(configFile >> "cfgVehicles" >> _class >> "weapons");
{
    private _name = getText (configFile >> "cfgWeapons" >> _x >> "displayName");
    _weapons = _weapons + [ _name];

}   forEach _weaponsClass; 

private _weapArray = [];
if (isClass (configFile >> "cfgVehicles" >> _class >> "Turrets" >> "M2_Turret")) then {
    _weapArray = getArray(configFile >> "cfgVehicles" >> _class >> "Turrets" >> "M2_Turret" >> "weapons");

} else {
    _weapArray = getArray(configFile >> "cfgVehicles" >> _class >> "Turrets" >> "MainTurret" >> "weapons");
    _weapArray pushBack (getArray(configFile >> "cfgVehicles" >> _class >> "Turrets" >> "FrontTurret" >> "weapons"));
    _weapArray pushBack (getArray(configFile >> "cfgVehicles" >> _class >> "Turrets" >> "RearTurret" >> "weapons"));
   
};

{
    private _name = getText (configFile >> "cfgWeapons" >> _x >> "displayName");
    _weapons = _weapons + [ _name];
}forEach _weapArray;

private _crewCount = [_class, true] call BIS_fnc_crewCount;
private _model = getText(configFile >> "cfgVehicles" >> _class >> "model");
private _maxSpeed = getNumber(configFile >> "cfgVehicles" >> _class >> "maxSpeed");
private _invSpace = getNumber(configFile >> "cfgVehicles" >> _class >> "maximumLoad");
private _armor = getNumber(configFile >> "cfgVehicles" >> _class >> "armor");
private _price = (GVAR(all) select (GVAR(all) find _class)) select 1;

private _separator = parseText "-------------------------------------------------------------------------------------";

private _return = parseText format ["
    <t align='left'>Preis:</t> <t align='right'>%2</t><br/>
    <t align='left'>Waffen:</t><br/>
    <t align='left'>%2</t>
    <t align='left'>%7</t><br/>
    <t align='left'>Sitzplätze:</t> <t align='right'>%3</t>
    <t align='left'>%7</t><br/>
    <t align='left'>Höchstgeschwindigkeit:</t> <t align='right'>%4</t>
    <t align='left'>%7</t><br/>
    <t align='left'>Ladekapazität:</t> <t align='right'>%5</t>
    <t align='left'>%7</t><br/>
    <t align='left'>Panzerung:</t> <t align='right'>%6</t>
    <t align='left'>%7</t><br/>", _price, _weapons, _crewCount, _maxSpeed, _invSpace, _armor, _separator
];

_return	