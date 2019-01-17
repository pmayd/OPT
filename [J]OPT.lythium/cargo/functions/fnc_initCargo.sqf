/**
* Description:
* initialize all ACE cargo settings for a given object
* settings are taken from setupCargoSpaceAndSize.sqf
* if an object is not recognized by its classname, 
* then it has no space and cannot be transported or transport
*
* Author:
* James
*
* Arguments:
* 0: <OBJECT> object to be initialized
*
* Return Value:
* <BOOLEAN> true - initialization successful, false - otherwise
*
* Server only:
* no
*
* Public:
* yes
*
* Global:
* yes - ace_cargo_fnc_setSpace and ace_cargo_fnc_setSize have global effect
*
* Sideeffects:
* change ACE behavior via ace_cargo_fnc_setSpace and ace_cargo_fnc_setSize
*
* Example:
* [vehicle player] call EFUNC(cargo,initCargo);
*/
#include "script_component.hpp"

/* PARAMS */
params [
   ["_item", objNull, [objNull], [1]]
];

/* VALIDATION */
if (_item isEqualTo objNull) exitWith {false};

/* CODE BODY */
private _type = typeOf _item;

// set cargo space
private _index = (GVAR(canTransportCargo) apply {toLower (_x select 0)}) find toLower _type;
if (_index != -1) then 
{
    (GVAR(canTransportCargo) select _index) params 
    [
        "_class",
        "_space"
    ];
    
    [_item, _space] call ace_cargo_fnc_setSpace; // has global effect

} 
else 
{
    [_item, -1] call ace_cargo_fnc_setSpace; // deactivate space

};

// set cargo size
private _index = (GVAR(canBeTransported) apply {toLower (_x select 0)}) find toLower _type;
if (_index != -1) then 
{
    (GVAR(canBeTransported) select _index) params 
    [
        "_class",
        "_size"
    ];

    [_item, _size] call ace_cargo_fnc_setSize; // has global effect

} 
else 
{
    [_item, -1] call ace_cargo_fnc_setSize; // deactivate inventory

};

true