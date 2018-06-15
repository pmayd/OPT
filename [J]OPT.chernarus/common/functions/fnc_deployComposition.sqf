/**
* Author: James
* deploy a list of objects around a given center object
*
* Arguments:
* 0: <OBJECT> vehicle or object to deploy composition around
* 1: <ARRAY> list of compositions in format [classname, relativPos (offset), dir, initCode]
*
* Return Value:
* 0: <BOOL> true - composition was successfully deployed, false - otherwise
*
* Example:
* [player, ["class1", [0,1,0], 100, "_this setDamage 1"]] call fnc_deployComposition.sqf;
*
*/
#include "script_component.hpp"

params [
    ["_centerObj", objNull, [objNull], 1],
    ["_composition", [], [[]]]
];
private _retVal = false;

private _side = [_centerObj] call FUNC(getVehicleSide);

if (_centerObj isEqualTo objNull) exitWith {_retVal};
if (_composition isEqualTo []) exitWith {_retVal};

// calculate radius of whole composition
// either this is the biggest offset + radius of an object
// or the biggest size of an object
private _radius = -1;
if (_centerObj getVariable [QGVAR(compositionRadius), -1] == -1) then {
    _radius = [_composition] call FUNC(calcCompositionRadius);
};

_flatPos = (getPosASL _centerObj) isFlatEmpty [
    _radius,	//--- Minimal distance from another object
    0,				//--- If 0, just check position. If >0, select new one
    0.4,			//--- Max gradient
    _radius max 5,	//--- Gradient area
    0,				//--- 0 for restricted water, 2 for required water,
    false,			//--- Has to have shore nearby!
    objNull			//--- Ignored object
];

if (count _flatPos isEqualTo 0) exitWith {
    private _message = COMPOSITION_DEPLOY_ERROR_MESSAGE(_radius);
    
    [QEGVAR(gui,message), ["Aufbau", _message, "red"]] call CBA_fnc_localEvent;
    
    _retVal
};

// exit script if another deployment script is already running
if (_centerObj getVariable [QGVAR(deploymentInProgress), false]) exitWith {};

_centerObj setVariable [QGVAR(deploymentInProgress), true, true];

// TODO: param
// [[_centerObj], "CHHQ_fnc_removeAction", _side] call BIS_fnc_MP;

_nearestPlayers = [];
{
    if (isPlayer _x && _x distance _centerObj < RADIUS_NEARBY_PLAYER) then {
        _nearestPlayers pushBack _x
    };
} forEach (playableUnits + switchableUnits);

[[QGVAR(deployBlackout)], "BIS_fnc_blackOut", _nearestPlayers, false, true] call BIS_fnc_MP;
[[COMPOSITION_DEPLOY_BLACKOUT_TEXT], "BIS_fnc_dynamicText", _nearestPlayers] call BIS_fnc_MP;

sleep 3;
// move all player out of vehicle
{
    moveOut _x;
} forEach (crew _centerObj);

// protect player and vehicle during deploy process
{
    _x allowDamage false; 
    _x enableSimulationGlobal false;
} forEach _nearestPlayers;

_centerObj enableSimulationGlobal false;
_centerObj allowDamage false;

// TODO: marker
//[[_centerObj, _side, "HQ"],"CHHQ_fnc_drawMarker",_side] call BIS_fnc_MP;

// spawn composition
_objArray = [];
{
    _x params [
        ["_type", "", ["s"], 1],
        ["_offset", [0,0,0], [[]], 3],
        ["_newDir", 0, [0], 1],
        ["_code", "",  ["", {}], 1]
    ];
    
    _obj = createVehicle [_type, [0,0,0], [], 0, "CAN_COLLIDE"];
    _obj allowDamage false;
    [_centerObj, _obj, _offset, _newdir, true, true] call BIS_fnc_relPosObject;
    _objArray pushBack _obj;
    
    if !(_code isEqualTo "") then {
        _code = [_code] call CHHQ_fnc_compileCode;
        [[[_obj, _centerObj], _code],"BIS_fnc_spawn", true] call BIS_fnc_MP;
    };
} forEach _composition;

[[_centerObj, 2], "lock", true] call BIS_fnc_MP;

_centerObj enableSimulationGlobal true;
_centerObj allowDamage true;

{
    _x allowDamage true;
} forEach _objArray;

// replace player and allow damage
{
    _x setPos ((getPosASL _x) findEmptyPosition [0, 25, "CAManBase"]);
    _x allowDamage true; 
    _x enableSimulationGlobal true;
} forEach _nearestPlayers;

sleep 3;
// black in and add addAction entries
[[QGVAR(deployBlackout)], "BIS_fnc_blackIn", _nearestPlayers, false, true] call BIS_fnc_MP;
// TODO
//[[_centerObj, ["Undeploy HQ", "_this spawn CHHQ_fnc_undeploy", [_side, _cargoInfo, _composition], 0, false, true, "", "[_target, _this] call CHHQ_fnc_actionConditions"]], "CHHQ_fnc_addAction", _side] call BIS_fnc_MP;
/*
    [template,(arguments)] call BIS_fnc_showNotification; 
    template: String - notification template from CfgNotifications 
    arguments: Array - additional arguments passed to the template (default: [])
*/
[
    [
        COMPOSITION_DEPLOY_TEMPLATE_NAME,
        [
            COMPOSITION_DEPLOY_TEMPLATE_TITLE, 
            COMPOSITION_DEPLOY_TEMPLATE_DESC(_centerObj),
            COMPOSITION_DEPLOY_TEMPLATE_ICON
        ]
    ], 
    "BIS_fnc_showNotification", 
    _side
] call BIS_fnc_MP;

_centerObj setVariable [QGVAR(deploymentInProgress), false, true];
_centerObj setVariable [QGVAR(deployed), true, true];
_centerObj setVariable [QGVAR(composition), _objArray, true];
// TODO
//[[_centerObj], "CHHQ_fnc_deleteVehicleEH", false] call BIS_fnc_MP; // only delete objects on server

_retVal = true;

_retVal