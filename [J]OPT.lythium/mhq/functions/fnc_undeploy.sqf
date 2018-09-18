/**
* Author: James
* undeploy mhq
*
* Arguments:
* 0: <OBJECT> vehicle or object that will be undeployed
* 1: <SIDE> vehicle's side
* 2: <ARRAY> list of compositions in format [classname, relativPos (offset), dir, initCode]
* 3: <ARRAY> cargo info in format [classname, offset, dir, code]
*
* Return Value:
* None
*
* Example:
* [parameter] call fnc_undeploy.sqf;
*
*/
#include "script_component.hpp"

params [
    ["_vec", objNull, [objNull], 1],
    ["_side", sideUnknown, [sideUnknown], 1],
    ["_composition", [], [[]]],
    ["_cargoInfo", [], [[]]]
];

// remove undeploy action for all players of given side
[_vec, _vec getVariable [QGVAR(undeployAction), -1]] remoteExecCall ["removeAction", _side, true];

// undeploy composition
[_vec, _cargoInfo] call EFUNC(composition,undeployComposition);

// create mhq marker for given side only
if (GVAR(showMarkers)) then {
    [_vec, _side, "MHQ"] remoteExecCall [QFUNC(drawMarker), _side, true];
};

// add deploy action for all players of given side
[
    _vec,
    [
        MHQ_ACTION_DEPLOY,
        {(_this select 3) spawn FUNC(deploy);},
        [_vec, _side, _composition, _cargoInfo],
        0,
        false,
        true,
        "",
        format ["[_target, _this] call %1", QFUNC(actionConditions)]
    ],
    QGVAR(deployAction)
] remoteExecCall [QEFUNC(common,addAction), _side, true];
