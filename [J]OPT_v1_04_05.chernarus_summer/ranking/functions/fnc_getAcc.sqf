/**
 * Author: James
 * get player's account from server profileNamespace
 *
 * Arguments:
 * 0: <UNIT> player
 * 1: <STRING> account name
 *
 * Return Value:
 * <ARRAY> content of account ([] for any error)
 *
 * Example:
 * [player, "Score"] call DMC_ranking_fnc_getAcc;
 */

#include "script_component.hpp"

params [
    ["_player", objNull, [objNull], 1],
    ["_account", "", ["s"], 1]
];

_account = toLower _account;
private _retVal = [];

if (_player isEqualTo objNull) exitWith {
    WARNING(format ["player object had wrong type or was empty."]);
    _retVal;
};

private _uid = getPlayerUID _player;

// check account for given player
// if none exist: return false
private _hash = [_player] call FUNC(getAllAcc);

if (!(HASH_HASKEY(_hash,_account))) exitWith {
    ERROR_2("Account with name %1 does not exist for player with uid %2",_account,_uid);
    _retVal;
};

_retVal = HASH_GET(_hash,_account);

_retVal
