/**
* Author: James
* teleport to hq
*
* Arguments:
* add action params

* Return Value:
* None
*
* Example:
* called from addAction!
*
*/
#include "script_component.hpp"

_obj = _this select 0;
_caller = _this select 1;
_veh = _this select 3 select 0;

[QGVAR(teleportToHQblackout)] call BIS_fnc_blackOut;

sleep 3;

_caller setPos ((getPosASL _veh) findEmptyPosition [0, 25, "CAManBase"]);

[QGVAR(teleportToHQblackout)] call BIS_fnc_blackIn;
