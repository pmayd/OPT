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
 * ["helpMe", "", true] call DMC_database_fnc_setVar
 */

#include "script_component.hpp"

params [
    ["_varName", "", ["s"], 1],
    "_varContent",
    ["_overwriteFlag", false, [true], 1]
];

private _qualifiedName = format["%1_%2", QUOTE(ADDON), _varName];

if (_varName isEqualTo "") exitWith {
    WARNING(format ["Variable name had wrong type or was empty."]);
    false;
};

if (isNil "_varContent") exitWith {
    WARNING(format ["Variable content was nil."]);
    false;
};

if (!(isNil {profileNamespace getVariable _qualifiedName}) && !_overwriteFlag) exitWith {
    WARNING(format ["Variable %1 already exists in server profileNamespace", _varName]);
    false;
};

profileNamespace setVariable [_qualifiedName, _varContent];

true
