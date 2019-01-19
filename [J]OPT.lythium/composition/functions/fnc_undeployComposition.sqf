/**
* Description:
* undeploy a composition around a vehicle
*
* Author:
* James
*
* Arguments:
* 0: <OBJECT> vehicle or object (center object)
* 1: <ARRAY> cargo info in format [classname, offset, dir, code]
*
* Return Value:
* <BOOL> true - composition was successfully undeployed, false - otherwise
*
* Server only:
* no
*
* Public:
* yes
*
* Global:
* yes - composition deletion is global
*
* Sideeffects:
* blackout for players with protection
* move players to an empty position
* deletion of composition
* set variable GVAR(undeploymentInProgress) to true and false
* set variable GVAR(cargo) to the created cargo object
* set variable GVAR(deployed) to false
* create and attach a cargo object to vehicle, if there is any
* unlock vehicle
* lock all cargo positions except co-driver
*
* Example:
* [vehicle] spawn EFUNC(composition,undeployComposition);
*/
#include "script_component.hpp"

/* PARAMS */
params
[
    ["_centerObj", objNull, [objNull], 1],
    ["_cargoInfo", [], [[]]]
];

/* VALIDATION */
private _retVal = false;
private _side = [_centerObj] call EFUNC(common,vehicleSide);

if (_centerObj isEqualTo objNull) exitWith{};
if
(
    !(_centerObj getVariable [QGVAR(deployed), false]) or
    _centerObj getVariable [QGVAR(undeploymentInProgress), false]
) exitWith {};

/* CODE BODY */
private _nearbyPlayers = [_centerObj, COMPOSITION_RADIUS_NEARBY_PLAYER] call EFUNC(common,nearbyPlayers);

// lock vehicle for other clients
_centerObj setVariable [QGVAR(undeploymentInProgress), true, true];

// black out and protect all near player
[QGVAR(deployBlackout)] remoteExec ["BIS_fnc_blackOut", _nearbyPlayers, false];
[COMPOSITION_UNDEPLOY_BLACKOUT_TEXT] remoteExec ["BIS_fnc_dynamicText", _nearbyPlayers, false];

sleep 3;

_nearbyPlayers apply
{
    _x allowDamage false;
    _x enableSimulationGlobal false
};

// delete composition
(_centerObj getVariable [QGVAR(composition), []]) apply
{
    deleteVehicle _x
};

// add cargo container, if given
if !(_cargoInfo isEqualTo []) then
{

    _cargoInfo params ["_cargoType", "_cargoOffset", "_cargoDir", ["_cargoCode", "", ["", {}], 1]];

    _cargo = createVehicle [_cargoType, [0,0,0], [], 0, "CAN_COLLIDE"];
    _cargo attachTo [_centerObj, _cargoOffset];

    _centerObj setPos (getPos _centerObj);
    _centerObj setDir (getDir _centerObj);
    _cargo setDir _cargoDir;
    _centerObj setVariable [QGVAR(cargo), _cargo, true];

    if !(_cargoCode isEqualTo "") then
    {
        _cargoCode = [_cargoCode] call FUNC(compileCode);
        [[_cargo, _centerObj], _cargoCode] remoteExec ["BIS_fnc_spawn", 0, true];
    };

};

[_centerObj, false] remoteExec ["lock", _centerObj, true];
[_centerObj, true] remoteExec ["lockCargo", _centerObj, true]; // lock all cargo positions
[_centerObj, [0, false]] remoteExec ["lockCargo", _centerObj, true]; // unlock co-driver

// black in
sleep 3;

_centerObj enableSimulationGlobal true;
_centerObj allowDamage true;

_nearbyPlayers apply
{
    _x setPos ((getPosASL _x) findEmptyPosition [0, 25, "CAManBase"]);
    _x allowDamage true;
    _x enableSimulationGlobal true
};

[QGVAR(deployBlackout)] remoteExec ["BIS_fnc_blackIn", _nearbyPlayers, false];

_centerObj setVariable [QGVAR(deployed), false, true];
// unlock vehicle for other clients
_centerObj setVariable [QGVAR(undeploymentInProgress), false, true];

// call on server
// wait until vehicle or object is null and delete objects
[_centerObj, "cargo"] remoteExec [QGVAR(deleteComposition), 2, false];