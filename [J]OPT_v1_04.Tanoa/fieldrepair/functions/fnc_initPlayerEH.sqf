/**
* Author: James
* initialize mission EH and action menu entries
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_initMissionEH.sqf;
*
*/
#include "script_component.hpp"

player addEventHandler ["Respawn", {
	[player] call FUNC(addActions);

}];