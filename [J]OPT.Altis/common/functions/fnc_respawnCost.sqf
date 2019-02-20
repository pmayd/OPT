/**
* Description:
* calculate dynamic respawn cost in dependence of remaining bleedout time
*
* Author:
* James
*
* Arguments:
* 0: <OBJECT> unit
*
* Return Value:
* <NUMBER> respawn cost for current unit
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
* [] call EFUNC(common,respawnCost);
*
*/
#include "script_component.hpp"

/* PARAMS */
params
[
    ["_unit", objNull, [objNull], 1]
];

/* VALIDATION */
private _ret = 0;
if (_unit isEqualTo objNull) exitWith{_ret};

/* CODE BODY */

// max cost until half of bleedout time
private _bleedOut = _unit getVariable [QEGVAR(revive,bleedOut), time + FAR_REVIVE_BLEEDOUT];
if !(isNil QEGVAR(revive,bleedOut)) then {
    _bleedOut = EGVAR(revive,bleedOut)
};

_ret = linearConversion
[
    0,
    FAR_REVIVE_BLEEDOUT,
    _bleedOut + 10 - time,
    GVARMAIN(respawnCostMin),
    GVARMAIN(respawnCostMax),
    true
];

_ret
