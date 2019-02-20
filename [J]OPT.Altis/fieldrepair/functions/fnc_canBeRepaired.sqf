/**
* Description:
* check if given unit is allowed to repair this vehicle
*
* Author:
* James
*
* Arguments:
* 0: <OBJECT> vehicle to be repaired
* 1: <OBJECT> unit that is going to repair
*
* Return Value:
* <BOOL> true - unit can repair vehicle, false - otherwise
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
* [vehicle player, player] call EFUNC(fieldrepair,canBeRepaired);
*/
#include "script_component.hpp"

/* PARAMS */
params
[
   ["_vec", objNull, [objNull], 1],
   ["_unit", objNull, [objNull], 1]
];

/* VALIDATION */
private _ret = false;
if (_vec isEqualTo objNull or _unit isEqualTo objNull) exitWith{_ret};

/* CODE BODY */
{
   private _hitPoint = _x;
   private _dmg = (getAllHitPointsDamage _vec select 2 select _forEachIndex);

   if
   (
      _dmg > GVAR(minDamageOnAnyPart) and
      (
         !([_hitPoint] call FUNC(isHardPart)) or
         (
            GVAR(engineerCanRepairGun) and
            (typeOf _unit in GVARMAIN(engineers)) and
            (tolower _x) in ["hitgun", "hitturret"] and
            (count (["hitgun", "hitturret"] select {_x find (tolower _x) > -1}) > 0) and
            _dmg > 0.5
         )
      )

   ) exitWith{_ret = true};

} forEach (getAllHitPointsDamage _vec select 0);

_ret