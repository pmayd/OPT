/**
* Author: James
* add teleport action for each mhq
*
* Arguments:
* 0: <OBJECT> object that will get the teleport actions
*
* Return Value:
* None
*
* Example:
* [flag] call fnc_updateTeleportActions.sqf;
*
*/
#include "script_component.hpp"

params
[
    ["_obj", objNull, [objNull], 1]
];

if (_obj isEqualTo objNull) exitWith {};

// delete all teleport actions
(_obj getVariable [QGVAR(actionIDarray), []]) apply
{
    _obj removeAction _x;
};

private _actionIDarray = [];
{
    private _vehString = format ["%1 select %2", QGVAR(HQarray), _forEachIndex];
    private _actionText = if (count GVAR(HQarray) > 1) then
    {
        private _idx = _x getVariable [QGVAR(HQIndex), -1];
        MHQ_ACTION_TELEPORT_MANY(_idx)
    } else
    {
        MHQ_ACTION_TELEPORT_ONE
    };

    _id = _obj addAction
    [
        _actionText,
        {_this spawn FUNC(teleportToHQ)},
        [_x],
        6,
        true,
        true,
        "",
        format ["[_target, _this, %1] call %2", _vehString, QFUNC(teleportActionConditions)]
    ];
    _actionIDarray pushBack _id;

} forEach GVAR(HQarray);

_obj setVariable [QGVAR(actionIDarray), _actionIDarray];