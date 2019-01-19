/**
* Author: James
* handle taken weapon according to player class
*
* Arguments:
*   unit: Object - Unit to which the event handler is assigned
*   container: Object - The container from which the item was taken (vehicle, box, etc.)
*   item: String - The class name of the taken item
*
* Return Value:
* None
*
* Example:
* [unit, container, item] call fnc_weaponCheck.sqf;
*
*/
/**
* Description:
* remove weapons and items that are not allowed according to player class
*
* Author:
* James
*
* Arguments:
* 0: <OBJECT> unit to which the event handler is assigned
* 1: <OBJECT> the container from which the item was taken (vehicle, box, etc.)
* 2: <STRING> the class name of the item that was picked-up
*
* Return Value:
* None
*
* Server only:
* no
*
* Public:
* no - only called via Take EH in fnc_initPlayerEH in component mission
*
* Global:
* yes - argument has to be local but effect is global
*
* Sideeffects:
* no
*
* Example:
* [player, crate, "weapon"] call EFUNC(common,weaponCheck);
*/
#include "script_component.hpp"

/* PARAMS */
params [
    ["_unit", objNull, [objNull], 1],
    ["_container", objNull, [objNull], 1],
    ["_item", "", [""], 1]
];

/* VALIDATION */
if (_unit isEqualTo objNull or "_item" == "") exitWith{};
if !(_item in (GVARMAIN(restrictedWeapons) + GVARMAIN(restrictedItems))) exitWith {};

/* CODE BODY */
private _typeOfPlayer = typeOf _unit;
private _restrictedWeapons = GVARMAIN(restrictedWeapons);
private _restrictedItems = GVARMAIN(restrictedItems);

// allow weapons for player class and delete all other restricted weapons from inventory
// look up player calss and remove weapons of this class from restricted weapons
switch (true) do
{
    case (_typeOfPlayer in (GVARMAIN(officer) + GVARMAIN(pilots) + GVARMAIN(crew))):
    {
        _restrictedWeapons = _restrictedWeapons - GVARMAIN(SMG);
    };

    case (_typeOfPlayer in GVARMAIN(operator)):
    {
        _restrictedItems = _restrictedItems - GVARMAIN(operatorItems);
    };

    case (_typeOfPlayer in GVARMAIN(rocketmen)):
    {
        _restrictedWeapons = _restrictedWeapons - GVARMAIN(launchers);
    };

    case (_typeOfPlayer in GVARMAIN(reconSnipers)):
    {
        _restrictedWeapons = _restrictedWeapons - GVARMAIN(reconSniperRifles);
    };

    case (_typeOfPlayer in GVARMAIN(snipers)):
    {
        _restrictedWeapons = _restrictedWeapons - GVARMAIN(sniperRifles);
    };

    case (_typeOfPlayer in GVARMAIN(soldatMG)):
    {
        _restrictedWeapons = _restrictedWeapons - GVARMAIN(LMG);
    };

    case (_typeOfPlayer in  GVARMAIN(soldatSMG)):
    {
        _restrictedWeapons = _restrictedWeapons - GVARMAIN(MMG);
    };

    case (_typeOfPlayer in GVARMAIN(recon)):
    {
        _restrictedWeapons = _restrictedWeapons - GVARMAIN(reconRifles);
    };

    case (_typeOfPlayer in GVARMAIN(grenadiers)):
    {
        _restrictedWeapons = _restrictedWeapons - GVARMAIN(grenadelaunchers);
    };

    case (_typeOfPlayer in GVARMAIN(medic)):
    {
        _restrictedItems = _restrictedItems - GVARMAIN(medicItems);
    };

};

private _weaponsToDelete = (weapons _unit) arrayIntersect _restrictedWeapons;
if ( count _weaponsToDelete > 0) then
{
    _weaponsToDelete apply {_unit removeWeapon _x};

    [
        "Regelverstoß",
        "Waffe unzulässig für aktuelle Spielerklasse.<br/>Waffe wurde entfernt.",
        "red"
    ] call EFUNC(gui,message);
};

private _itemsToDelete = (items _unit + assignedItems _unit) arrayIntersect _restrictedItems;
if ( count _itemsToDelete > 0) then
{
    _itemsToDelete apply {_unit unassignItem _x; _unit removeItem _x;};

    [
        "Regelverstoß",
        "Item unzulässig für aktuelle Spielerklasse.<br/>Item wurde entfernt.",
        "red"
    ] call EFUNC(gui,message);
};