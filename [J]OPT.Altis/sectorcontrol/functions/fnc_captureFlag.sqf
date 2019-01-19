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

if (!hasInterface) exitWith {};
params ["_flag", "_caller"];

_side = UNIT_SIDE(_caller);

[_side, _flag] remoteExecCall [QFUNC(setFlagOwner), 2, false];

// log player
[_flag, _caller] remoteExecCall [QEFUNC(log,writeFlagCaptured), 2, false];