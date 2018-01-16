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

GVAR(mode) = 0;
if (OPT_PARAM_SHOW_ALL_UNITS) then {
    GVAR(showAll) = true;
} else {
    GVAR(showAll) = false;
};


//Modus
//_all=Schalter;
if (leader player == player) then {
    GVAR(mode)=1;
};
if (((player isKindOf "OPT_NATO_Offizier_T") or (player isKindOf "OPT_CSAT_Offizier_T")) and GVAR(showAll)) then {
    GVAR(mode)=2;
};

