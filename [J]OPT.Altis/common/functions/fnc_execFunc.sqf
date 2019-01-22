/**
* Description:
* Helper function to call or spawn any function of a component. 
* Check if component is activated (GVAR(on) = true).
* If component is deactivated or something goes wrong, return default.
*
* Author:
* James
*
* Arguments:
* 0: <STRING> component name
* 1: <STRING> function name
* 2: <ARRAY> arguments passed to function as Array
* 3: <BOOLEAN> true - function will be spawned, false - otherwise called
* 4: <ANY> default return value if component is off
*
* Return Value:
* <ANY> return value of function or objNull
*
* Server only:
* no
*
* Public:
* yes
*
* Global:
* no
*
* Sideeffects:
* call function (param 1) if component (param 0) is active
*
* Example:
* ["cargo", "deactivateDragging", [crate], <optional: false>] call EFUNC(common,execFunc);
*/
#include "script_component.hpp"

/* PARAMS */
params [
    ["_component", "", ["s"], 1],
    ["_func", "", ["s"], 1],
    ["_args", [], [[]]],
    ["_spawnFlag", false, [true], 1],
    ["_default", objNull]
];

/* VALIDATION */
if (_component isEqualTo "" or _func isEqualTo "") exitWith{_default};

/* CODE BODY */
// check if component is active. If variable is not defined, always execute function
private _code = {call compile format["opt_%1_on", _component]}; // identical to GVAR(on) in given component
private _check = true;

if (!(isNil _code)) then 
{
    _check = call _code;
};

if (!_check) exitWith{_default};

// check wether function exists
private _fncCode = call compile format["opt_%1_fnc_%2", _component, _func];
if (isNil {_fncCode}) exitWith{_default};

// call func
private _retVal = nil;
if (_spawnFlag) then 
{
    _retVal = _args spawn _fncCode;
} 
else 
{
    _retVal = _args call _fncCode;
};

// do not get compiler error if retVal is itself nil
if (!isNil "_retVal") exitWith{_retVal};

_default
