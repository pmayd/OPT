/**
 * Author: James
 * update player's account with passed values in server profileNamespace
 *
 * Arguments:
 * 0: <UNIT> player
 * 1: <STRING> account name
 * 2: <ARRAY> list of updated values
 *
 * Return Value:
 * <BOOL> true: values updated, false: else
 *
 * Example:
 * [player, "Score", [1,0,0]] call DMC_ranking_fnc_updateAcc; // update [0,0,0] to [1,0,0]
 */

#include "script_component.hpp"

params [
    ["_player", objNull, [objNull], 1],
    ["_account", "", ["s"], 1],
    ["_update", [], [[]]]
];

_account = toLower _account;
private _retVal = false;

if (_player isEqualTo objNull) exitWith {
    ERROR(format ["player object had wrong type or was empty."]);
    _retVal;
};

private _uid = getPlayerUID _player;

private _hash = [_player] call FUNC(getAllAcc);

// check account for given player
// if none exist: return false
if (!(HASH_HASKEY(_hash,_account))) exitWith {
    ERROR_2("Account with name %1 does not exist for player with uid %2",_account,_uid);
    _retVal;
};

// check number of values in both lists
private _content = HASH_GET(_hash,_account);
if (count _content != count _update) exitWith {
    ERROR_2("List of update values %1 has not the same number of values as list of account values %2.", _update, _content);
    _retVal;
};

HASH_SET(_hash,_account,_update);

// store in server profileNamespace!
[QEGVAR(database,setVar), [[_uid, _hash, true], _player]] call CBA_fnc_serverEvent;

_retVal = EGVAR(database,setVar);

_retVal
