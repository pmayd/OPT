/**
* Author: James
* script triggered when player captures flag. Write to server log and call setFlagOwner
*
* Arguments:
* 0: <OBJECT> flag
* 1: <OBJECT> unit who captured the flag
*
* Return Value:
* None
*
* Example:
* [flag, caller, ID, arguments] call fnc_captureFlag.sqf;
*
*/
#include "script_component.hpp"

if (!local player) exitWith {};
params ["_flag", "_caller"];

_side = _caller getVariable QGVARMAIN(playerSide);

[_side, _flag] call FUNC(setFlagOwner);

// log pllayer
[QEGVAR(log,flagCaptured), [_flag, _caller]] call CBA_fnc_serverEvent;