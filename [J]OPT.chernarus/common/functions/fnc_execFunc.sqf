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
* <ANY> return value of function or nil
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
systemChat str(_this);

private _retVal = nil;

if (_component isEqualTo "" or _func isEqualTo "") exitWith{_retVal};

// check if component is active. If variable is not defined, always execute function
private _code = {call compile format["opt_%1_on", _component]}; // identical to GVAR(on) in given component
private _check = true;

if (!(isNil _code)) then {
    _check = call _code;
};

if (!_check) exitWith{_retVal};

// check wether function exists
private _code = {call compile format["opt_%1_fnc_%2", _component, _func]};
if (isNil _code) exitWith{_retVal};

// call func
if (_spawnFlag) then {
    _retVal = call compile format["%1 spawn opt_%2_fnc_%3", _args, _component, _func];
} else {
    systemChat "here we are";
    _retVal = call compile format["%1 call opt_%2_fnc_%3", _args, _component, _func];
};

// do not get compiler error if retVal is itself nil
if (!isNil "_retVal") exitWith{_retVal};
