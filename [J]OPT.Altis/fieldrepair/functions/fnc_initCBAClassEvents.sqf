/**
* Author: James
* initialize CBA class EH
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_initCBAClassEvents.sqf;
*
*/
#include "script_component.hpp"

["AllVehicles", "init", {
    params ["_vec"];

    if (_vec isKindOf "StaticWeapon" or _vec isKindOf "Man") exitWith{};

    /*
    * Argument:
    * 0: Action name <STRING>
    * 1: Name of the action shown in the menu <STRING>
    * 2: Icon <STRING>
    * 3: Statement <CODE>
    * 4: Condition <CODE>
    * 5: Insert children code <CODE> (Optional)
    * 6: Action parameters <ANY> (Optional)
    * 7: Position (Position array, Position code or Selection Name) <ARRAY>, <CODE> or <STRING> (Optional)
    * 8: Distance <NUMBER> (Optional)
    * 9: Other parameters [showDisabled,enableInside,canCollapse,runOnHover,doNotCheckLOS] <ARRAY> (Optional)
    * 10: Modifier function <CODE> (Optional)
    */
    private _action_field_repair =
    [
        QGVAR(action_field_repair),
        "<t color='#ff0000'>" + STR_FIELD_REPAIR + "</t>",
        "",
        {
            params ["_target", "_player", "_params"];

            [_target] spawn FUNC(repairVehicle);
        },
        {
            params ["_target", "_player", "_params"];

            [_target] call FUNC(needRepair);
        }
    ] call ace_interact_menu_fnc_createAction;

    private _action_heavy_repair =
    [
        QGVAR(action_full_repair),
        "<t color='#ff0000'>" + STR_SERIOUS_REPAIR + "</t>",
        "",
        {
            params ["_target", "_player", "_params"];

            _truck = nearestObjects [_player, ["Car"], GVAR(maxDistanceRepairTruck)];
            _truck = (_truck select {finite (getRepairCargo _x)}) select 0;

            [_target, _truck] spawn FUNC(heavyRepair);
        },
        {
            params ["_target", "_player", "_params"];

            _truck = nearestObjects [_player, ["Car"], GVAR(maxDistanceRepairTruck)];
            _truck = _truck select {finite (getRepairCargo _x)};
            if (count _truck > 0) then {
                _truck = _truck select 0;

                _truck getVariable [QGVAR(repair_cargo), -1] != -1 and
                {alive _target} and
                {speed _truck < 3} and
                [_target] call FUNC(needRepair);
            } else
            {
                false;
            }

        }
    ] call ace_interact_menu_fnc_createAction;

    [_action_field_repair, _action_heavy_repair] apply {
        [
            _vec,
            0,
            ["ACE_MainActions"],
            _x
        ] call ace_interact_menu_fnc_addActionToObject;
    };

    LOG_1("RepairCargo: %1",getRepairCargo _vec);
    if (finite (getRepairCargo _vec)) then {
        [_vec] spawn {
            params ["_vec"];
            sleep 1;
            [_this select 0, 0] remoteExecCall ["setRepairCargo", _vec, true];
        };
        _vec setVariable [QGVAR(repair_cargo), 1, true];
    };

}, nil, nil, true] call CBA_fnc_addClassEventHandler;