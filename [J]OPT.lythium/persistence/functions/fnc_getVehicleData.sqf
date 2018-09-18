/**
* Author: James
* read out all data from a vehicle and return it as array.
* Data is the data we want to store in server profileNamespace.
*
* Arguments:
* 0: <OBJECT> vehicle 
*
* Return Value:
* 0: <ARRAY> data in the format:
*[
*    classname,
*    position,
*    direction,
*    damage,
*    fuel,
*    [getWeaponCargo, getMagazineCargo, getItemCargo, getBackpackCargo, getVehicleCargo],
*    vehicle weapon magazines,                                                              // add with addMagazineTurret
*    inventory ACE,                                                                         // use https://github.com/acemod/ACE3/blob/master/addons/cargo/functions/fnc_loadItem.sqf
*    [getFuelCargo, getAmmoCargo, getRepairCargo],                                          // check with finite!
*]
*
* Example:
* [vehicle player] call opt_persistence_fnc_getVehicleData.sqf;
*
* Server only:
* yes
*
* Public:
* yes
*/
#include "script_component.hpp"

/* PARAMS */
params [
   ["_vec", objNull, [objNull], 1]
];

/* VALIDATION */
if (_vec isEqualTo objNull) exitWith{};

/* CODE BODY */
private _entry = [];
_entry pushBack (typeOf _vec);
_entry pushBack (getPosATL _vec);
_entry pushBack [vectorDir _vec, vectorUp _vec];
_entry pushBack (getAllHitPointsDamage _vec);
_entry pushBack (fuel _vec);
_entry pushBack [getWeaponCargo _vec, getMagazineCargo _vec, getItemCargo _vec, getBackpackCargo _vec];
_entry pushBack (magazinesAllTurrets _vec);
_entry pushBack (_vec getVariable ["ace_cargo_loaded", []]); // ACE
_entry pushBack [getFuelCargo _vec, getAmmoCargo _vec, getRepairCargo _vec];

_entry