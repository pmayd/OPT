/**
* Author: James
* determine name of killer
*
* Arguments:
* 0: <OBJECT> unit that was hit
* 1: <OBJECT> instigator/killer of unit
*
* Return Value:
* None
*
* Example:
* [player, killer] call fnc_showKiller.sqf;
*
*/
#include "script_component.hpp"

params ["_unit", "_killer"];
private _name = "";

if (_unit != _killer) then {
    if (isPlayer _killer) then {
        if (vehicle _killer != _killer) then {
            _vec = vehicle _killer;
            _obj = gunner _vec;

            if (isNull _obj) then {
                _obj = effectiveCommander _vec;
            };
            _name = UNIT_NAME(_obj);

        } else {
            _name = UNIT_NAME(_killer);

        };
    };
};

_name