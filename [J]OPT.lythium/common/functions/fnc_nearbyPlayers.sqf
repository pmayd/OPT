/**
* Description:
* get all playable units within a radius around an object/position
*
* Author:
* James
*
* Arguments:
* 0: <OBJECT> center 
* 1: <NUMBER> radius
*
* Return Value:
* <ARRAY> list of playable units
*
* Server only:
* no
*
* Public:
* yes
*
* Global:
* no
*
* Sideeffects:
* no
*
* Example:
* [player, 25] call EFUNC(common,nearbyPlayers);
*/
#include "script_component.hpp"

/* PARAMS */
params 
[
    ["_centerObj", objNull, [objNull], 1],
    ["_radius", 25, [1], 1]
];

/* VALIDATION */
private _ret = [];
if (_centerObj isEqualTo objNull) exitWith{_ret};

/* CODE BODY */
_ret = playableUnits select
{
    isPlayer _x and (_x distance2D _centerObj) < _radius;
};

_ret
