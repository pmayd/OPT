/**
* Author: James
* deploy a composition around a given center object
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
* example of composition
* _composition = [["Land_PowerGenerator_F",[-2.99756,2.07959,0.0971174],180.556],["CamoNet_BLUFOR_big_F",[0.013916,-0.0551758,0.0971174],337.248],["Land_ToiletBox_F",[3.71655,3.98242,0.097096],181.571],["MapBoard_altis_F",[4.04272,1.50049,0.0449162],359.984],["Land_CampingTable_F",[-3.40649,-1.95361,0.0971169],252.548],["Land_CampingChair_V1_F",[-4.34302,-1.66504,0.100242],253.27],["Land_Cargo20_grey_F",[4.11963,-0.677246,0.0971179],271.612,{_this animate ["Door_1_rot",1]; _this animate ["Door_2_rot",1]}]];
*
*/
#include "script_component.hpp"

/* PARAMS */
params [
    ["_centerObj", objNull, [objNull], 1],
    ["_composition", [], [[]]]
];

/* VALIDATION */
private _retVal = false;
if (_centerObj isEqualTo objNull) exitWith {_retVal};
if (_composition isEqualTo []) exitWith {_retVal};
// if already deployed or in progress
if (
    _centerObj getVariable [QGVAR(deployed), false] or 
    _centerObj getVariable [QGVAR(deploymentInProgress), false]
    ) exitWith {["Aufbau", "Komposition bereits aufgebaut oder im Aufbau!", "red"] call EFUNC(gui,message);};

/* CODE BODY */
private _side = [_centerObj] call EFUNC(common,vehicleSide);
private _cargo = _centerObj getVariable [QGVAR(cargo), objNull];

// calculate radius of whole composition
// either this is the biggest offset + radius of an object
// or the biggest size of an object
private _radius = -1;
if (_centerObj getVariable [QGVAR(compositionRadius), -1] == -1) then {
    _radius = [_composition] call FUNC(calcCompositionRadius);
};

private _flatPos = selectBestPlaces [
    position _centerObj, 
    _radius max 5, 
    "meadow - houses - trees - (0.5 * forest) - (0.5*hills) - sea", 	// von 5 auf 0.5 kallek
    5, 
    3
];

if ({_x select 1 > 0} count _flatPos isEqualTo 0) exitWith {
    private _message = COMPOSITION_DEPLOY_ERROR_MESSAGE(_radius);
    
    ["Aufbau", _message, "red"] call EFUNC(gui,message);
    
    _retVal
};

_centerObj setVariable [QGVAR(deploymentInProgress), true, true];

if !(_cargo isEqualTo objNull) then {
    deleteVehicle _cargo;
};

private _nearbyPlayers = [_centerObj, COMPOSITION_RADIUS_NEARBY_PLAYER] call EFUNC(common,nearbyPlayers);

[QGVAR(deployBlackout)] remoteExec ["BIS_fnc_blackOut", _nearbyPlayers, false];
[COMPOSITION_DEPLOY_BLACKOUT_TEXT] remoteExec ["BIS_fnc_dynamicText", _nearbyPlayers, false];

sleep 3;
// move all player out of vehicle
{
    moveOut _x;
} forEach (crew _centerObj);

// protect player and vehicle during deploy process
{
    _x allowDamage false; 
    _x enableSimulationGlobal false;
} forEach _nearbyPlayers;

_centerObj enableSimulationGlobal false;
_centerObj allowDamage false;

// spawn composition
private _objArray = [_composition] call FUNC(spawnComposition);

//  3 - Locked for player;
[_centerObj, 2] remoteExec ["lock", _centerObj, true];

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
} forEach _nearbyPlayers;

sleep 3;
// black in and add addAction entries
[QGVAR(deployBlackout)] remoteExec ["BIS_fnc_blackIn", _nearbyPlayers, false];

_centerObj setVariable [QGVAR(deploymentInProgress), false, true];
_centerObj setVariable [QGVAR(deployed), true, true];
_centerObj setVariable [QGVAR(composition), _objArray, true];

// call on server
// wait until vehicle or object is null and delete objects
[_centerObj] remoteExec [QGVAR(deleteComposition), 2, false];
