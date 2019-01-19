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
 * ["helpMe", ""] call EFUNC(database,getVar);
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
    ["_default", nil, [], 1]
];

/* VALIDATION */
if (_varName isEqualTo "") exitWith {
    WARNING("Variable name had wrong type or was empty.");
    _default;
};

private _qualifiedName = format["%1_%2", QUOTE(ADDON), _varName];
if (isNil {profileNamespace getVariable _qualifiedName}) exitWith {
    WARNING("Variable name not in server profileNamespace");
    _default;
};

/* CODE BODY */
profileNamespace getVariable _qualifiedName
