/**
 * Author: James
 * remove content from existing variable in server profileNamespace
 *
 * Arguments:
 * 0: <STRING> variable name (key)
 * 1: <any> content to be removed from var in namespace
 * 2: <BOOL> (opt) flag for complete removal. true: all, false: last
 *
 * Return Value:
 * <NUMBER> deleted elements
 *
 * Example:
 * ["helpMe", 0, true] call DMC_database_func_remVar
 */

#include "script_component.hpp"

params [
    ["_varName", "", ["s"], 1],
    "_varContent",
    ["_completeRemoveFlag", false, [true], 1]
];

private _qualifiedName = format["%1_%2", QUOTE(ADDON), _varName];

private _countDel = 0;

if (_varName isEqualTo "") exitWith {
    WARNING(format ["Variable name had wrong type or was empty."]);
    _countDel;
};

if (isNil "_varContent") exitWith {
    WARNING(format ["Variable content was nil."]);
    _countDel;
};

private _oldVal = [_varName] call FUNC(getVar);
private _newVal = [];

if (!(_varContent in _oldVal)) exitWith {0};

private _countDel = 1;

if (_completeRemoveFlag) then {
    if (!IS_ARRAY(_varContent)) then {
        _newVal = _oldVal - [_varContent];
    } else {
        _newVal = _oldVal - _varContent;
    };

    _countDel = (count _oldVal) - (count _newVal);

} else {
    _oldVal deleteAt (_oldVal find _varContent);
    _newVal = _oldVal;
    
};

[_varName, _newVal, true] call FUNC(setVar);

_countDel;
