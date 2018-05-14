/**
* Author: James
* initialize mission echo
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

// update marker as long as map is open (works for uav stations as well)
GVAR(EH_EachFrame) = addMissionEventHandler ["EachFrame", {
    [] call FUNC(updateMarker);

}];
