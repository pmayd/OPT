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

GVAR(mode) = 1;
if (OPT_PARAM_SHOW_ALL_UNITS) then {
    GVAR(showAll) = true;
} else {
    GVAR(showAll) = false;
};

//Modus
if (typeOf player in GVARMAIN(officer) and GVAR(showAll)) then {
    GVAR(mode)=2;
};

