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
[_vec, QGVAR(undeployAction)] remoteExec [QEFUNC(common,removeAction), _side];

// undeploy composition
[_vec, _cargoInfo] call EFUNC(composition,undeployComposition);

// create mhq marker for given side only
if (GVAR(showMarkers)) then {
    [_vec, _side, "MHQ"] remoteExec [QFUNC(drawMarker), _side];
};

// add deploy action for all players of given side
[
    _vec,
    [
        MHQ_ACTION_DEPLOY,
        {(_this select 3) spawn FUNC(deploy);},
        [_side, _cargoInfo, _composition],
        0,
        false,
        true,
        "",
        format ["[_target, _this] call %1", QFUNC(actionConditions)]
    ],
    QGVAR(deployAction)
] remoteExec [QEFUNC(common,addAction), _side];
