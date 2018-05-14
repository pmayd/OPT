/**
 * Author: James
 * delete player's account from server profileNamespace
 *
 * Arguments:
 * 0: <unit> player
 * 1: <STRING> account name
 *
 * Return Value:
 * <BOOL> true: deletion successful, false: else
 *
 * Example:
 * [player, "Score"] call DMC_ranking_fnc_delAcc;
 */

#include "script_component.hpp"

params [
    ["_player", objNull, [objNull], 1],
    ["_account", "", ["s"], 1]
];

_account = toLower _account;
private _retVal = false;

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

HASH_REM(_hash,_account);

// store in server profileNamespace!
[QEGVAR(database,setVar), [[_uid, _hash, true], _player]] call CBA_fnc_serverEvent;

_retVal = EGVAR(database,setVar);

_retVal
