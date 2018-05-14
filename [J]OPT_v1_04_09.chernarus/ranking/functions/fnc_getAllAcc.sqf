/**
 * Author: James
 * get all player's accounts from server profileNamespace
 *
 * Arguments:
 * 0: <UNIT> player
 *
 * Return Value:
 * <HASH> content of server profileNamespace or empty hash
 *
 * Example:
 * [player] call DMC_ranking_fnc_getAllAcc;
 */

#include "script_component.hpp"

params [
    ["_player", objNull, [objNull], 1]
];

private _hash = HASHCREATE;

if (_player isEqualTo objNull) exitWith {
    WARNING(format ["player object had wrong type or was empty."]);
    _hash;
};

private _uid = getPlayerUID _player;

[QEGVAR(database,getVar), [[_uid, nil], _player]] call CBA_fnc_serverEvent;
if (!(isNil QEGVAR(database,getVar))) then {
    _hash = EGVAR(database,getVar);
};

_hash;
