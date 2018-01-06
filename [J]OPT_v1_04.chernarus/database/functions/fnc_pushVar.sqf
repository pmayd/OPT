/**
 * Author: James
 * pushBack content to existing variable in server profileNamespace
 *
 * Arguments:
 * 0: <STRING> variable name (key)
 * 1: <any> content to push back in namespace
 * 2: <BOOL> (opt) flag for append. true: append, false: extend
 *
 * Return Value:
 * <NUMBER> index of inserted element
 *
 * Example:
 * ["helpMe", name player] call DMC_database_func_pushVar;
 *
 */

#include "script_component.hpp"

params [
    ["_varName", "", ["s"], 1],
    "_varContent",
    ["_appendFlag", false, [true], 1]
];

private _qualifiedName = format["%1_%2", QUOTE(ADDON), _varName];
private _index = -1;

if (_varName isEqualTo "") exitWith {
    WARNING(format ["Variable name had wrong type or was empty."]);
    _index;
};

if (isNil "_varContent") exitWith {
    WARNING(format ["Variable content was nil."]);
    _index;
};

if (_appendFlag and !IS_ARRAY(_varContent)) exitWith {
    WARNING(format ["Variable content must have type array when append is used."]);
    _index;
};

if (toLower _qualifiedName in allVariables profileNamespace && !_overwriteFlag) exitWith {
    WARNING(format ["Variable %1 already exists in server profileNamespace", _varName]);
    _index;
};

private _oldVal = [_varName] call FUNC(getVar);

if (!IS_ARRAY(_oldVal)) then {
    _oldVal = [_oldVal];
};

switch (_appendFlag) do {
    case true: {
        _oldVal append _varContent;
        _index = (count _oldVal) - 1;
    };
    case false: {
        _index = _oldVal pushBack _varContent;
    };
};

[_varName, _oldVal, true] call FUNC(setVar);

_index
