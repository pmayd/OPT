/**
 * Author: James
 * get variable from server profileNamespace
 *
 * Arguments:
 * 0: <STRING> variable name (key)
 * 1: <any> default return value
 *
 * Return Value:
 * <any|nil> content of variable in profileNamespace, nil if varName does not exist
 *
 * Example:
 * ["helpMe", ""] call DMC_database_fnc_getVar;
 *
 */

#include "script_component.hpp"

params [
    ["_varName", "", ["s"], 1],
    ["_default", nil, [], 1]
];

private _qualifiedName = format["%1_%2", QUOTE(ADDON), _varName];

if (_varName isEqualTo "") exitWith {
    WARNING(format ["Variable name had wrong type or was empty."]);
    _default;
};

if (isNil {profileNamespace getVariable _qualifiedName}) exitWith {
    WARNING(format ["Variable name not in server profileNamespace"]);
    _default;
};

profileNamespace getVariable _qualifiedName
