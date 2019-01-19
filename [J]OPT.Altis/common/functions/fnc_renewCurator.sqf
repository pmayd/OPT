/**
* Description:
* reinitialize zeus for client
*
* Author:
* James
*
* Arguments:
* 0: <OBJECT> unit 
*
* Return Value:
* None
*
* Server only:
* yes - unassignCurator and assignCurator only work on server
*
* Public:
* no
*
* Global:
* no
*
* Sideeffects:
* reassign curator unit to curator on server
*
* Example:
* [player] call EFUNC(common,renewCurator);
*/
#include "script_component.hpp"

/* PARAMS */
params 
[
   ["_operator", objNull, [objNull], 1]
];

/* VALIDATION */
if (_operator isEqualTo objNull) exitWith{};

/* CODE BODY */
if (_operator in (allCurators apply {getAssignedCuratorUnit _x})) then 
{
    // find curator object of given unit and reasign unit to this curator object
    _id = (allCurators apply {getAssignedCuratorUnit _x}) find _operator;
    _module = allCurators select _id;
    unassignCurator _module;
    _operator assignCurator _module;
};