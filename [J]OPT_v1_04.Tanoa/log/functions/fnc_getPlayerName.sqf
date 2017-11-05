/**
* Author: James
* retrieve player name from global var GVAR(playerList)
*
* Arguments:
* 0: <STRING> player UID (from getPlayerUID)
*
* Return Value:
* 0: <STRING> player name (as defined via profileName)
*
* Example:
* [getPlayerUID player] call fnc_getPlayerName.sqf;
*
*/
#include "script_component.hpp"

params [
    ["_uid", "", ["s"], 1]
];

if (_uid isEqualTo "") exitWith{""};

private _id = (GVAR(playerList) apply {_x select 0}) find _uid;
private _nameUnit = (GVAR(playerList) select _id) select 1;

_nameUnit