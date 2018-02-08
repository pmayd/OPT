/**
* Author: James
* check whether player can commit suicide 
*
* Arguments:
* 0: <OBJECT> unit that called the action
*
* Return Value:
* 0: <BOOL> true - caller can commit suicide, false - otherwise
*
* Example:
* [player] call fnc_checkSuizide.sqf;
*
*/
#include "script_component.hpp"

params ["_caller"];

private _return = false;
private _isPlayerUnconscious = _caller getVariable ["FAR_isUnconscious",0];
if (alive _caller && {_isPlayerUnconscious == 1}) then {
	_return = true;
};

_return