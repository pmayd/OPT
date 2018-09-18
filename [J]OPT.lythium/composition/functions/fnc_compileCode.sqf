/**
* Author: James
* compile code given as string or code block
*
* Arguments:
* 0: <STRING or CODE> code to compile
*
* Return Value:
* 0: <BOOL> true - if code was successfully compiled, false - otherwise
*
* Example:
* ["hint name player"] call fnc_compileCode.sqf;
*
*/
#include "script_component.hpp"

params [
    ["_code", "", ["", {}], 1]
];

// if code block, convert to string and delete first and last character {}
if (toLower typeName _code == "code") then {
    private _array = toArray str _code;
    _array deleteAt 0;
    _array deleteAt count _array - 1;
    _code = toString _array;
};

if !(_code isEqualTo "") then {
    private _prefix = "_target = _this select 1; _this = _this select 0; ";
    _code = _prefix + _code;
};

compile _code
