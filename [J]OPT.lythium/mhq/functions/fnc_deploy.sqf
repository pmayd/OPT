/**
* Author: James
* deploy mhq and composition
*
* Arguments:
* 0: <OBJECT> mhq vehicle
* 1: <SIDE> vehicle's side
* 2: <ARRAY> cargo info in format [classname, offset, dir, code]
* 3: <ARRAY> composition in format [classname, offset, dir, code]
*
* Return Value:
* None
*
* Example:
* [vehicle, [], []] call fnc_deploy.sqf;
*
*/
#include "script_component.hpp"

/* PARAMS */
params [
    ["_vec", objNull, [objNull], 1],
    ["_side", sideUnknown, [sideUnknown], 1],
    ["_composition", [], [[]]],
    ["_cargoInfo", [], [[]]]
];

/* CODE BODY */
private _cargo = _vec getVariable [QEGVAR(composition,cargo), objNull];

// abort script if deployment is not possible
private _handle = [_vec, _composition] spawn EFUNC(composition,deployComposition);
waitUntil { scriptDone _handle; };

if (!EGVAR(composition,deploymentSuccessful)) exitWith{};

// remove deploy actions for side only
[_vec, _vec getVariable [QGVAR(deployAction), -1]] remoteExecCall ["removeAction", _side, true];

// update/draw hq marker
if (GVAR(showMarkers)) then {
    [_vec, _side, "HQ"] remoteExecCall [QFUNC(drawMarker), _side, true];
};

// add undeploy action entry to vehicle for all units of given side
[
    _vec,               // obj
    [                   // args
        MHQ_ACTION_UNDEPLOY,
        {(_this select 3) spawn FUNC(undeploy);},
        [_vec, _side, _composition, _cargoInfo],
        0,
        false,
        true,
        "",
        format ["[_target, _this] call %1", QFUNC(actionConditions)]
    ], 
    QGVAR(undeployAction)    // action ID
] remoteExecCall [QEFUNC(common,addAction), _side, true];

// show notification for all players of given side
[
    MHQ_NOTIFICATION_TEMPLATE,
    [MHQ_NOTIFICATION_TITLE, MHQ_NOTIFICATION_DESC(_vec), MHQ_NOTIFICATION_ICON]
] remoteExec ["BIS_fnc_showNotification", _side];

