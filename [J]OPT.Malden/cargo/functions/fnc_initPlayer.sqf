/**
* Author: James
* set max weights for drag and carry cargo as well as 
* deactivate dragging and carrying for players
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_initPlayer.sqf;
*
*/
#include "script_component.hpp"

/* set maximal weight values */
missionNamespace setVariable ["ACE_maxWeightCarry", OPT_CARGO_ACE_maxWeightCarry];
missionNamespace setVariable ["ACE_maxWeightDrag", OPT_CARGO_ACE_maxWeightDrag];

