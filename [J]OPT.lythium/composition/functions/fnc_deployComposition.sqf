/**
* Description:
* deploy a composition around a given center object
*
* Author:
* James
*
* Arguments:
* 0: <OBJECT> vehicle or object to deploy composition around
* 1: <ARRAY> a composition with elements inthe form of [classname, relativPos (offset), dir, initCode]
*
* Return Value:
* <BOOL> true - composition was successfully deployed, false - otherwise
*
* Server only:
* no
*
* Public:
* yes
*
* Global:
* yes - composition is visible on every client
*
* Sideeffects:
* inform player if there is already a deployment process ongoing
* inform player if surroundings are not suited for deploying
* blackout screen for nearby players and some instructional text
* move nearby player out of vehicles
* delete cargo object
* spawn composition (while player are protected)
* replace player so that they are not within some objects of composition
* set variable GVAR(deploymentInProgress) to true and false of center object
* set variable GVAR(deployed) to true
* set variable GVAR(composition) to the composition
*
* Example:
* [player, ["class1", [0,1,0], 100, "_this setDamage 1"]] spawn EFUNC(common,deployComposition);
*
* example of composition
* _composition = [["Land_PowerGenerator_F",[-2.99756,2.07959,0.0971174],180.556],["CamoNet_BLUFOR_big_F",[0.013916,-0.0551758,0.0971174],337.248],["Land_ToiletBox_F",[3.71655,3.98242,0.097096],181.571],["MapBoard_altis_F",[4.04272,1.50049,0.0449162],359.984],["Land_CampingTable_F",[-3.40649,-1.95361,0.0971169],252.548],["Land_CampingChair_V1_F",[-4.34302,-1.66504,0.100242],253.27],["Land_Cargo20_grey_F",[4.11963,-0.677246,0.0971179],271.612,{_this animate ["Door_1_rot",1]; _this animate ["Door_2_rot",1]}]];
*/
#include "script_component.hpp"

/* PARAMS */
params
[
    ["_centerObj", objNull, [objNull], 1],
    ["_composition", [], [[]]]
];

/* VALIDATION */
private _retVal = false;
if (_centerObj isEqualTo objNull) exitWith {_retVal};
if (_composition isEqualTo []) exitWith {_retVal};
// if already deployed or in progress
if
(
    _centerObj getVariable [QGVAR(deployed), false] or
    _centerObj getVariable [QGVAR(deploymentInProgress), false]
) exitWith
{
    ["Aufbau", "Komposition bereits aufgebaut oder im Aufbau!", "red"] call EFUNC(gui,message);
};

/* CODE BODY */
private _side = [_centerObj] call EFUNC(common,vehicleSide);
private _cargo = _centerObj getVariable [QGVAR(cargo), objNull];

// calculate radius of whole composition
// either this is the biggest offset + radius of an object
// or the biggest size of an object
private _radius = [_composition] call FUNC(calcCompositionRadius);

private _flatPos = selectBestPlaces
[
    position _centerObj,
    _radius max 5,
    "meadow - houses - trees - (0.5 * forest) - (0.5*hills) - sea", 	// von 5 auf 0.5 kallek
    5,
    3
];

if ({_x select 1 > 0} count _flatPos isEqualTo 0) exitWith
{
    private _message = COMPOSITION_DEPLOY_ERROR_MESSAGE(_radius);
    ["Aufbau", _message, "red"] call EFUNC(gui,message);

    _retVal
};

_centerObj setVariable [QGVAR(deploymentInProgress), true, true];

if !(_cargo isEqualTo objNull) then
{
    deleteVehicle _cargo;
};

private _nearbyPlayers = [_centerObj, COMPOSITION_RADIUS_NEARBY_PLAYER] call EFUNC(common,nearbyPlayers);

[QGVAR(deployBlackout)] remoteExec ["BIS_fnc_blackOut", _nearbyPlayers, false];
[COMPOSITION_DEPLOY_BLACKOUT_TEXT] remoteExec ["BIS_fnc_dynamicText", _nearbyPlayers, false];

sleep 3;
// move all player out of vehicle
(crew _centerObj) apply
{
    moveOut _x;
};

// protect player and vehicle during deploy process
_nearbyPlayers apply
{
    _x allowDamage false;
    _x enableSimulationGlobal false;
};

_centerObj enableSimulationGlobal false;
_centerObj allowDamage false;

// spawn composition
private _objArray = [_composition] call FUNC(spawnComposition);

//  3 - Locked for player;
[_centerObj, 2] remoteExec ["lock", _centerObj, true];

_centerObj enableSimulationGlobal true;
_centerObj allowDamage true;

_objArray apply
{
    _x allowDamage true;
};

// replace player and allow damage
_nearbyPlayers apply
{
    _x setPos ((getPosASL _x) findEmptyPosition [0, 25, "CAManBase"]);
    _x allowDamage true;
    _x enableSimulationGlobal true;
};

sleep 3;
// black in and add addAction entries
[QGVAR(deployBlackout)] remoteExec ["BIS_fnc_blackIn", _nearbyPlayers, false];

_centerObj setVariable [QGVAR(deploymentInProgress), false, true];
_centerObj setVariable [QGVAR(deployed), true, true];
_centerObj setVariable [QGVAR(composition), _objArray, true];

// spawn on server
// wait until vehicle or object is null and delete objects
[_centerObj] remoteExec [QFUNC(deleteComposition), 2, false];
