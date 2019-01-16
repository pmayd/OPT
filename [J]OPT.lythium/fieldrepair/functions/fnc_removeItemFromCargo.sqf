/**
* Author: James
* remove specific item from vehicle cargo
*
* Arguments:
* 0: <OBJECT> vehicle
* 1: <STRING> item class name
*
* Return Value:
* None
*
* Example:
* [vehicle, item] call fnc_removeItemFromCargo.sqf;
*
*/
#include "script_component.hpp"

params [["_veh", objNull], ["_item", ""]];

if (_veh isEqualTo objNull) exitWith {false};

_allItems = getItemCargo _veh; // [[classnames], [count]]
clearItemCargoGlobal _veh;

_id = (_allItems select 0) find _item;

if (_id == -1) exitWith{true};

(_allItems select 0) deleteAt _id;
(_allItems select 1) deleteAt _id;

_allItems apply
{
    _veh addItemCargoGlobal [_x select 0, _x select 1];
};

true