/**
* Description:
* compile code given as string or code block
*
* Author:
* James
*
* Arguments:
* 0: <STRING|CODE> code to compile
*
* Return Value:
* <BOOL> true - if code was successfully compiled, false - otherwise
*
* Server only:
* no
*
* Public:
* no - should be called only within spawnComposition.sqf or undeployComposition.sqf
*
* Global:
* yes and no - depends on the code
*
* Sideeffects:
* whatever the code does
*
* Example:
* ["hint 'Hello, world'"] call EFUNC(composition,compileCode);
*/
#include "script_component.hpp"

/* PARAMS */
params 
[
    ["_code", "", ["", {}], 1]
];

/* VALIDATION */
if (_code isEqualTo "" or _code isEqualTo {}) exitWith{};

/* CODE BODY */
// if code block, convert to string and delete first and last character {}
if (toLower typeName _code == "code") then 
{
    private _array = toArray str _code;
    _array deleteAt 0;
    _array deleteAt (count _array - 1);
    _code = toString _array;
};

if !(_code isEqualTo "") then 
{
    private _prefix = "_target = _this select 1; _this = _this select 0; ";
    _code = _prefix + _code;
};

compile _code
