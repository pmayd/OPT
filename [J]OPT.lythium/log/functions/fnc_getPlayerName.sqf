/**
* Author: James
* retrieve player name from global var GVAR(playerList)
*
* Arguments:
* 0: <OBJECT> unit 
*
* Return Value:
* 0: <STRING> player name (as defined via profileName)
*
* Example:
* [player] call fnc_getPlayerName.sqf;
*
*/
#include "script_component.hpp"

/* PARAMS */
params [
    ["_unit", objNull, [objNull], 1]
];

/* VALIDATION */
if (_unit isEqualTo objNull) exitWith{""};
if !(_unit in playableUnits) exitWith{name _unit};

/* CODE */
private _uid = getPlayerUID _unit;
private _id = (GVAR(playerList) apply {_x select 0}) find _uid;

if (_id == -1) exitWith {name _unit};

private _nameUnit = (GVAR(playerList) select _id) select 1;

_nameUnit