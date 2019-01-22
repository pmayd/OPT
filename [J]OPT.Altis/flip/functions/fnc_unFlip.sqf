/**
* Description:
* unflip a flipped vehicle
*
* Author:
* James
*
* Arguments:
* 0: <OBJECT> vehicle to unflip
*
* Return Value:
* None
*
* Server only:
* no
*
* Public:
* yes
*
* Global:
* yes - vehicle is flipped on all clients
*
* Sideeffects:
* no
*
* Example:
* [cursorObject] call EFUNC(flip,unFlip);
*/
#include "script_component.hpp"

/* PARAMS */
params
[
   ["_veh", objNull, [objNull], 1]
];

/* VALIDATION */
if (_veh isEqualTo objNull) exitWith{};

/* CODE BODY */
_veh setVectorUp [0,0,1];
_veh setPosATL
[
    (getPosATL _veh) select 0,
    (getPosATL _veh) select 1,
    0.3
];