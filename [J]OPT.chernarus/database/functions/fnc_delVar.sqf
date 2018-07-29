/**
 * Author: James
 * delete variable from server profileNamespace
 *
 * Arguments:
 * 0: <STRING> variable name (key)
 *
 *
 * Return Value:
 * <BOOL> true: var deleted, false: else
 *
 * Example:
 * ["helpMe"] call DMC_database_func_delVar;
 *
 */

#include "script_component.hpp"

params [
    ["_varName", "", ["s"], 1]
];

private _qualifiedName = format["%1_%2", QUOTE(ADDON), _varName];

if (_varName isEqualTo "") exitWith {
    WARNING(QUOTE(Variable name had wrong type or was empty.));
    false;
};

if (isNil {profileNamespace getVariable _qualifiedName}) exitWith {
    WARNING(QUOTE(Variable name not in server profileNamespace));
    false;
};

profileNamespace setVariable [_qualifiedName, nil];

true
