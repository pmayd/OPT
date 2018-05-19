/**
* Author: James
* create some objects around the radar for better immersion
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [container] call fnc_createObject.sqf;
*
*/
#include "script_component.hpp"

private _container = [] call FUNC(getRadar);
private _containerObj = []; // list of objects attached to container

private _tower = createVehicle ["Land_TTowerSmall_1_F", getpos _container, [], 0, "NONE"];
_tower attachTo [_container, [-0.5, 0.5, 0.0]];
_containerObj pushBack _tower;

private _net = createVehicle ["CamoNet_ghex_big_F", getpos _container, [], 0, "NONE"];
_net attachTo [_container, [0.0, 0.0, 0.0]];
_containerObj pushBack _net;

// side effect: store attached objects for all players
_container setVariable [QGVAR(attachedObjects), _containerObj, true];

true

