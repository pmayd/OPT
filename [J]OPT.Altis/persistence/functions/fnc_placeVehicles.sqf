/**
* Author: James
* spawn vehicles that are stored in server profileNamespace
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call opt_persistence_fnc_placeVehicles.sqf;
*
* Server only:
* yes
*
* Public:
* no - should be only called from placeObjects.sqf
*/
#include "script_component.hpp"

/* PARAMS */

/* VALIDATION */
if (!GVAR(optionVehicles)) exitWith{};

/* CODE BODY */
private _vehicleStorage = [];
if (HASH_HASKEY(GVAR(hash), HASH_KEY_VEHICLES)) then {
    _vehicleStorage = HASH_GET(GVAR(hash), HASH_KEY_VEHICLES);
};

if (_vehicleStorage isEqualTo []) exitWith{};

{
    // Current result is saved in variable _x
    private _entry = _x;

    private _vec = createVehicle [_entry select 0, _entry select 1, [], 0, "CAN_COLLIDE"];
    _vec setVectorDirAndUp (_entry select 2);
    
    {
        // Current result is saved in variable _x
        // _x is hitpoint name
        _vec setHitPointDamage [_x, (_entry select 3 select 2) select _forEachIndex];
    } forEach (_entry select 3 select 0);

    _vec setFuel (_entry select 4);


    {
        // Current result is saved in variable _x
        // _x is weapon name
        _vec addWeaponCargoGlobal [_x, (_entry select 5 select 0 select 1) select _forEachIndex];
    } forEach (_entry select 5 select 0 select 0);

    {
        // Current result is saved in variable _x
        // _x is magazine name
        _vec addMagazineCargoGlobal [_x, (_entry select 5 select 1 select 1) select _forEachIndex];
    } forEach (_entry select 5 select 1 select 0);

    {
        // Current result is saved in variable _x
        // _x is item name
        _vec addItemCargoGlobal [_x, (_entry select 5 select 2 select 1) select _forEachIndex];
    } forEach (_entry select 5 select 2 select 0);

    {
        // Current result is saved in variable _x
        // _x is backpack name
        _vec addBackpackCargoGlobal [_x, (_entry select 5 select 3 select 1) select _forEachIndex];
    } forEach (_entry select 5 select 3 select 0);

    {
        // Current result is saved in variable _x
        // _x has format [className, turretPath, ammoCount, id, creator]
        _vec addMagazineTurret [_x select 0, _x select 1, _x select 2];
    } forEach (_entry select 6);

    {
        // Current result is saved in variable _x
        [_x, _vec, true] call ace_cargo_fnc_loadItem;
    } forEach (_entry select 7);

    if (finite (_entry select 8 select 0)) then {
        _vec setFuelCargo (_entry select 8 select 0);
    };

    if (finite (_entry select 8 select 1)) then {
        _vec setAmmoCargo (_entry select 8 select 1);
    };

    if (finite (_entry select 8 select 2)) then {
        _vec setRepairCargo (_entry select 8 select 2);
    };

} forEach _vehicleStorage;