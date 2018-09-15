/**
* Author: James
* get all playable units within a radius around an object/position
*
* Arguments:
* 0: <OBJECT> center 
* 1: <NUMBER> radius
*
* Return Value:
* 0: <ARRAY> list of playable units
*
* Example:
* [[player, 25]] call fnc_getNearestPlayer.sqf;
*
*/
#include "script_component.hpp"

params [
    ["_centerObj", objNull, [objNull], 1],
    ["_radius", 25, [1], 1]
];

private _nearestPlayers = (playableUnits + switchableUnits) select
{
    isPlayer _x and (_x distance2D _centerObj) < _radius;
};

_nearestPlayers
