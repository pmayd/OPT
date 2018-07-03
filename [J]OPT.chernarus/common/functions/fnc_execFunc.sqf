/**
* Author: James
* helper function to call or spawn any function of a component. Checks if component is activateAddons
*
* Arguments:
* 0: <STRING> component name
* 1: <STRING> function name
* 2: <ARRAY> arguments passed to function
* 3: <BOOLEAN> true - function will be spawned, false - otherwise called
*
* Return Value:
* <BOOLEAN> true - component is active and can function can be called, false - otherwise
*
* Example:
* ["cargo", "deactivateDragging", [crate], <optional: false>] call fnc_execFunc.sqf;
*
* Public:
* yes
*/
#include "script_component.hpp"

params [
    ["_component", "", ["s"], 1],
    ["_func", "", ["s"], 1],
    ["_args", [], [[]]],
    ["_spawnFlag", false, [true], 1]
];

private _retVal = false;

if (_component isEqualTo "" or _func isEqualTo "") exitWith{_retVal};

// check if component is active
private _check = call compile format["opt_%1_on", _component]; // identical to GVAR(on) in given component

if (!(isNil "_check") and !_check) exitWith{_retVal);

// call func
if (_spawnFlag) then {
    call compile format["%1 spawn opt_%2_fnc_%3", _args, _component, _func];
} else {
    call compile format["%1 call opt_%2_fnc_%3", _args, _component, _func];
};

_retVal
