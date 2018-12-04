/**
* Author: James
* undeploy a composition around a vehicle
*
* Arguments:
* 0: <OBJECT> vehicle or object (center object)
* 1: <ARRAY> cargo info in format [classname, offset, dir, code]
*
* Return Value:
* 0: <BOOL> true - composition was successfully undeployed, false - otherwise
*
* Example:
* [vehicle] call fnc_undeployComposition.sqf;
*
*/
#include "script_component.hpp"

params [
    ["_centerObj", objNull, [objNull], 1],
    ["_cargoInfo", [], [[]]]
];
private _retVal = false;
private _side = [_centerObj] call EFUNC(common,vehicleSide);

if (_centerObj isEqualTo objNull) exitWith{};
if (
    !(_centerObj getVariable [QGVAR(deployed), false]) or 
    _centerObj getVariable [QGVAR(undeploymentInProgress), false]
    ) exitWith{};

private _nearbyPlayers = [_centerObj, COMPOSITION_RADIUS_NEARBY_PLAYER] call EFUNC(common,nearbyPlayers);

// lock vehicle for other clients
_centerObj setVariable [QGVAR(undeploymentInProgress), true, true];

// black out and protect all near player
[QGVAR(deployBlackout)] remoteExec ["BIS_fnc_blackOut", _nearbyPlayers, false];
[COMPOSITION_UNDEPLOY_BLACKOUT_TEXT] remoteExec ["BIS_fnc_dynamicText", _nearbyPlayers, false];

sleep 3;

{
    _x allowDamage false; 
    _x enableSimulationGlobal false
} forEach _nearbyPlayers;

// delete composition
{
    deleteVehicle _x
} forEach (_centerObj getVariable [QGVAR(composition), []]);

// add cargo container, if given
if !(_cargoInfo isEqualTo []) then {

    _cargoInfo params ["_cargoType", "_cargoOffset", "_cargoDir", ["_cargoCode", "", ["", {}], 1]];

    _cargo = createVehicle [_cargoType, [0,0,0], [], 0, "CAN_COLLIDE"];		
	_cargo attachTo [_centerObj, _cargoOffset]; 

	_centerObj setPos (getPos _centerObj);
	_centerObj setDir (getDir _centerObj);
	_cargo setDir _cargoDir;	
	_centerObj setVariable [QGVAR(cargo), _cargo, true];
			
	if !(_cargoCode isEqualTo "") then {
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

{
    _x setPos ((getPosASL _x) findEmptyPosition [0, 25, "CAManBase"]);
    _x allowDamage true; 
    _x enableSimulationGlobal true
} forEach _nearbyPlayers;

[QGVAR(deployBlackout)] remoteExec ["BIS_fnc_blackIn", _nearbyPlayers, false];

_centerObj setVariable [QGVAR(deployed), false, true];
// unlock vehicle for other clients
_centerObj setVariable [QGVAR(undeploymentInProgress), false, true];

// call on server
// wait until vehicle or object is null and delete objects
[_centerObj, "cargo"] remoteExec [QGVAR(deleteComposition), 2, false];