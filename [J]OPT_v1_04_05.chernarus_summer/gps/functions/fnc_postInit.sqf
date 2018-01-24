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

#ifdef __SHOW_ALL_UNITS__
    if (OPT_PARAM_SHOW_ALL_UNITS == 1) then {
        GVAR(showAll) = true;
    } else {
        GVAR(showAll) = false;
    };
#endif

//Modus
//_all=Schalter;
if (leader player == player) then {
    GVAR(mode)=1;
};
if (((player isKindOf "OPT_NATO_Offizier_T") or (player isKindOf "OPT_CSAT_Offizier_T")) and GVAR(showAll)) then {
    GVAR(mode)=2;
};

