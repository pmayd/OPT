/**
* Description:
* trigger respawn for player and close bleedout UI
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
* no - should be called only via action of button in Bleedout UI Rsc
*
* Global:
* no
*
* Sideeffects:
* set bleedout time on player as varialbe
* kill player
*
* Example:
* [] call EFUNC(revive,closeDialog);
*
*/
#include "script_component.hpp"

/* PARAMS */

/* VALIDATION */

/* CODE BODY */
player setVariable [QGVAR(bleedOut), GVAR(bleedOut), true];
player setVariable ["FAR_isUnconscious", 0, false]; // only locally to close dialog
player setDamage 1;