/**
* Author: James
* calculate respawn cost (min or max). See CBA settings
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_respawnCost.sqf;
*
*/
#include "script_component.hpp"

// max cost until half of bleedout time
private _cost = GVARMAIN(respawn_cost_max);
if ( (EGVAR(revive,bleedOut) + 10 - time) < (FAR_REVIVE_BLEEDOUT / 2) ) then {
    _cost = GVARMAIN(respawn_cost_min);
};

_cost