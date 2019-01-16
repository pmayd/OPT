/**
* Description:
* delete all objects of a deployed composition or the cargo container of a vehicle
*
* Author:
* James
*
* Arguments:
* 0: <OBJECT> vehicle or object the composition belongs to
* 1: <STRING> if "cargo", function deletes cargo, else composition
*
* Return Value:
* None
*
* Server only:
* yes - only run by the server
*
* Public:
* no - should be called only when composition is undeployed
*
* Global:
* no
*
* Sideeffects:
* delete cargo container if there is one
* delete all objects of the composition
*
* Example:
* [vehicle] spawn EFUNC(composition,deleteComposition);
*/
#include "script_component.hpp"

/* PARAMS */
params
[
    ["_vec", objNull, [objNull], 1],
    ["_type", "", ["s"], 1]
];

/* VALIDATION */
if (_vec isEqualTo objNull) exitWith {};

/* CODE BODY */
private _objArray = _vec getVariable [QGVAR(composition), []];
private _cargo = _vec getVariable [QGVAR(cargo), objNull];

waitUntil {isNull _vec};
if (_type isEqualTo "cargo") then
{
    deleteVehicle _cargo;
}
else
{
    _objArray apply {deleteVehicle _x};
};