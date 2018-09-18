/**
* Author: James
* reinitialize zeus for client
*
* Arguments:
* 0: <OBJECT> unit 
*
* Return Value:
* None
*
* Example:
* [player] call fnc_renewCurator.sqf;
*
* Public:
* yes
*/
#include "script_component.hpp"

/* PARAMS */
params [
   ["_operator", objNull, [objNull], 1]
];

/* VALIDATION */
if (_operator isEqualTo objNull) exitWith{};

/* CODE BODY */
if (_operator in (allCurators apply {getAssignedCuratorUnit _x})) then {
    _id = (allCurators apply {getAssignedCuratorUnit _x}) find _operator;
    _module = allCurators select _id;
    unassignCurator _module;
    _operator assignCurator _module;
};