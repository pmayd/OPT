/**
 * Author: James
 * open new account for given player (uid) with initial values
 *
 * Arguments:
 * 0: <UNIT> player
 * 1: <STRING> account name
 * 2: <ARRAY> list of initial values
 *
 * Return Value:
 * <BOOL> true: successfuly opened new account, false: else
 *
 * Example:
 * [player, "Score", [0,0,0]] call DMC_ranking_fnc_openAcc;
 */

#include "script_component.hpp"

params [
    ["_player", objNull, [objNull], 1],
    ["_account", "", ["s"], 1],
    ["_storage", [], [[]]]
];

_account = toLower _account;
private _retVal = false;

if (_player isEqualTo objNull) exitWith {
    WARNING(format ["player object had wrong type or was empty."]);
    _retVal;
};

private _uid = getPlayerUID _player;

// check account for given player
// if none exist: open account, else append
private _hash = [_player] call FUNC(getAllAcc);

if (HASH_HASKEY(_hash,_account)) exitWith {
    ERROR_2("Account with name %1 already exists for player with uid %2",_account,_uid);
    _retVal;
};

HASH_SET(_hash,_account,_storage);

// store in server profileNamespace!
[QEGVAR(database,setVar), [[_uid, _hash, true], _player]] call CBA_fnc_serverEvent;

_retVal = EGVAR(database,setVar);

_retVal
