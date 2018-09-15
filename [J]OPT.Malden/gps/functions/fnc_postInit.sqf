/**
* Author: James
* initialize gps system and all variables
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_postInit.sqf;
*
*/
#include "script_component.hpp"

//Modus
GVAR(mode) = 1;
if (typeOf player in GVARMAIN(officer) and GVAR(showAllUnits)) then {
    GVAR(mode) = 2;
};


// update marker as long as map is open (works for uav stations as well)
[] spawn FUNC(updateMarker);

