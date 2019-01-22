/**
* Author: James
* add a new player to the player list that is managed by the server
*
* Arguments:
* 0: <STRING> unique UID of player
* 1: <STRING> name of player 
* 2: <SIDE> side of player 
*
* Return Value:
* None
*
* Example:
* [123456789, "James", east] call fnc_updatePlayerList.sqf;
*
* Server only:
* yes
*
* Public:
* yes
*/
#include "script_component.hpp"

/* PARAMS */
params [
   ["_uid", "s", ["s"], 1],
   ["_name", "s", ["s"], 1],
   ["_side", sideUnknown, [sideUnknown], 1]
];

/* VALIDATION */
if (_uid isEqualTo "" or "_name" isEqualTo "") exitWith{};
if (_uid in (GVAR(playerList) apply {_x select 0})) exitWith{};

/* CODE BODY */
GVAR(playerList) pushBack [_uid, _name, _side];
publicVariable QGVAR(playerList);