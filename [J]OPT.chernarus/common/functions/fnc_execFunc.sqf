/**
* Author: James
* helper function to call or spawn any function of a component. Checks if component is activateAddons
*
* Arguments:
* 0: <STRING> component name
* 1: <STRING> function name
* 2: <CODE> arguments passed to function as Array, has to be code to work properly for all special cases like vehicle object
* 3: <BOOLEAN> true - function will be spawned, false - otherwise called
* 4: <ANY> default return value if component is off
*
* Return Value:
* <ANY> return value of function or objNull
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
    ["_argsAsCode", {}, [{}]],
    ["_spawnFlag", false, [true], 1],
    ["_default", objNull]
];

private _retVal = _default;

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
    _retVal = call compile format["(call %1) spawn opt_%2_fnc_%3", _argsAsCode, _component, _func];
} else {
    _retVal = call compile format["(call %1) call opt_%2_fnc_%3", _argsAsCode, _component, _func];
};

// do not get compiler error if retVal is itself nil
if (!isNil "_retVal") exitWith{_retVal};
