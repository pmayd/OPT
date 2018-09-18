/**
* Author: James
* check conditions for action menu entry
*
* Arguments:
* 0: <OBJECT> target
* 1: <OBJECT> caller
*
* Return Value:
* None
*
* Example:
* [vehicle, player] call fnc_actionConditions.sqf;
*
*/
#include "script_component.hpp"

params [
    "_target",
    "_caller"
];

// vehicle halts, is alive and player is closer than 8m and outside
(
    speed _target isEqualTo 0 && 
    {alive _target} && 
    {_caller distance _target < MHQ_TELEPORT_ACTION_DISTANCE} && 
    {vehicle _caller isEqualTo _caller}
)