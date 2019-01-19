/**
 * Author: James
 * store variable in server profileNamespace, overwrite protection
 *
 * Arguments:
 * 0: <STRING> variable name (key)
 * 1: <any> content to store in namespace
 * 2: <BOOL> (opt) flag for overwrite protection, default = false
 *
 * Return Value:
 * <BOOL> true: value set/changed, false: else
 *
 * Example:
 * ["helpMe", "", true] call EFUNC(database,setVar)
 *
 * Server only:
 * yes
 *
 * Public:
 * yes
 *
 * Global:
 * no
 *
 */
#include "script_component.hpp"

/* PARAMS */
params [
    ["_varName", "", ["s"], 1],
    "_varContent",
    ["_overwriteFlag", false, [true], 1]
];

/* VALIDATION */
if (_varName isEqualTo "") exitWith {
    WARNING(format ["Variable name had wrong type or was empty."]);
    false;
};

if (isNil "_varContent") exitWith {
    WARNING(format ["Variable content was nil."]);
    false;
};

private _qualifiedName = format["%1_%2", QUOTE(ADDON), _varName];
if (!(isNil {profileNamespace getVariable _qualifiedName}) and !_overwriteFlag) exitWith {
    WARNING(format ["Variable %1 already exists in server profileNamespace", _varName]);
    false;
};

/* CODE BODY */
profileNamespace setVariable [_qualifiedName, _varContent];

true
