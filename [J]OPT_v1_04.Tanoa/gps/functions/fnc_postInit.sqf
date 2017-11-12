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
    if (OPT_SHOW_ALL_UNITS == 1) then {
        GVAR(showAll) = true;
    } else {
        GVAR(showAll) = false;
    };
#endif

//Modus
//_all=Schalter;
if ((player isKindOf "OPT_NATO_Gruppenfuehrer_T") or (player isKindOf "OPT_CSAT_Gruppenfuehrer_T")) then {
    GVAR(mode)=1;
};
if (((player isKindOf "OPT_NATO_Offizier_T") or (player isKindOf "OPT_CSAT_Offizier_T")) and _all) then {
    GVAR(mode)=2;
};
	

GVAR(eh_map) = addMissionEventHandler ["Map", {
    [] call FUNC(updateMarker);
}];

