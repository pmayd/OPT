/**
* Author: James
* toggle ability to use TFAR radios
*
* Arguments:
* 0: <BOOL> true - can use radios, false - otherwise
*
* Return Value:
* None
*
* Example:
* [true] call fnc_postInit.sqf;
*
*/
#include "script_component.hpp"

params [
	["_canUse", true, [true]]
];

if (_canUse) then {
	player setVariable ["tf_unable_to_use_radio", false];
} else {
	player setVariable ["tf_unable_to_use_radio", true];
};

true