/**
* Description:
* set max weights for drag and carry cargo      
*
* Author:
* James
*
* Arguments:
* None
*
* Return Value:
* None
*
* Server only:
* no
*
* Public:
* no - should be called only once by XEH_PostInit.sqf at mission start
*
* Global:
* no
*
* Sideeffects:
* change ACE behavior of player units regarding cargo component
*
* Example:
* [] call EFUNC(cargo,initPlayer);
*/
#include "script_component.hpp"

/* PARAMS */

/* VALIDATION */

/* CODE BODY */
/* set maximal weight values */
missionNamespace setVariable ["ACE_maxWeightCarry", OPT_CARGO_ACE_maxWeightCarry];
missionNamespace setVariable ["ACE_maxWeightDrag", OPT_CARGO_ACE_maxWeightDrag];

