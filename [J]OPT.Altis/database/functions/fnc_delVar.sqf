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
 * ["helpMe"] call EFUNC(database,delVar);
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
    ["_varName", "", ["s"], 1]
];

/* VALIDATION */
if (_varName isEqualTo "") exitWith {
    WARNING(QUOTE(Variable name had wrong type or was empty.));
    false;
};

private _qualifiedName = format["%1_%2", QUOTE(ADDON), _varName];

if (isNil {profileNamespace getVariable _qualifiedName}) exitWith {
    WARNING(QUOTE(Variable name not in server profileNamespace));
    false;
};

/* CODE BODY */
profileNamespace setVariable [_qualifiedName, nil];

true
