/**
* Author: James
* delete all objects of a deployed composition or the cargo container of a vehicle
*
* Arguments:
* 0: <OBJECT> vehicle or object the composition belongs to
* 1: <TYPE> if "cargo", function deletes cargo, else composition
*
* Return Value:
* None
*
* Example:
* [[vehicle]] call fnc_deleteComposition.sqf;
*
*/
#include "script_component.hpp"

params [
    ["_vec", objNull, [objNull], 1],
    ["_type", "", ["s"], 1]
];

if (_vec isEqualTo objNull) exitWith {};

private _objArray = _vec getVariable [QGVAR(composition), []];
private _cargo = _vec getVariable [QGVAR(cargo), objNull];

waitUntil {isNull _vec};
if (_type isEqualTo "cargo") then {
    deleteVehicle _cargo;
} else {
    {deleteVehicle _x} forEach _objArray;
};