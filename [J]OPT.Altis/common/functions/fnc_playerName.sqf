/**
* Description:
* retrieve cached player name
*
* Author:
* James
*
* Arguments:
* 0: <OBJECT> unit 
*
* Return Value:
* <STRING> player name (as defined via profileName)
*
* Server only:
* yes - player names are cached on server
*
* Public:
* yes
*
* Global:
* no
*
* Sideeffects:
* no
*
* Example:
* [parameter] call EFUNC(common,playerName);
*/
#include "script_component.hpp"

/* PARAMS */
params 
[
    ["_unit", objNull, [objNull], 1]
];

/* VALIDATION */
if (_unit isEqualTo objNull) exitWith{""};
if !(_unit in playableUnits) exitWith{name _unit};

/* CODE */
private _uid = getPlayerUID _unit;
private _id = (EGVAR(log,playerList) apply {_x select 0}) find _uid;

if (_id == -1) exitWith {name _unit};

(EGVAR(log,playerList) select _id) select 1