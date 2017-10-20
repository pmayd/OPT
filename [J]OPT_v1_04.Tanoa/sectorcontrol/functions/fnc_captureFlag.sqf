/**
* Author: James
* script triggered when player captures flag. Write to server log and call setFlagOwner
*
* Arguments:
* 0: <OBJECT> flag
* 1: <OBJECT> unit who captured the flag
*
* Return Value:
* None
*
* Example:
* [flag, caller, ID, arguments] call fnc_captureFlag.sqf;
*
*/
#include "script_component.hpp"

if (!local player) exitWith {};
params ["_flag", "_caller"];

_side = _caller getVariable QGVARMAIN(playerSide);

_owner = _flag getVariable ["owner", nil];

[_side, _flag] call FUNC(setFlagOwner);

// log player
_message = "";
switch (_side) do {
    case west: {
        if (_owner isEqualTo west) then {
            _message = format ["NATO Flagge gesichert von %1", name _caller];
        } else {
            _message = format ["CSAT Flagge erobert von %1", name _caller];
        };
    };

    case east: {
        if (_owner isEqualTo east) then {
            _message = format ["NATO Flagge erobert von %1", name _caller];
        } else {
            _message = format ["CSAT Flagge gesichert von %1", name _caller];
        };
    };

    default {};
};

[QEGVAR(log,write), ["Fahne", _message]] call CBA_fnc_serverEvent;