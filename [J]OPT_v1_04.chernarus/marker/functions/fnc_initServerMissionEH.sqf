/**
* Author: James
* add a missionEH "EachFrame" to the server and update marker with time stemp
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_initServerMissionEH.sqf;
*
*/
#include "script_component.hpp"

GVAR(changedMarker) = [];
GVAR(nrMarker) = count allMapMarkers;

GVAR(eh_EachFrame) = addMissionEventHandler ["EachFrame", {

    if (GVAR(nrMarker) != count allMapMarkers) then {
        {   
            // check if marker is user defined and was not edited before
            if ((_x find "_USER_DEFINED" != -1) and !(_x in GVAR(changedMarker))) then {
    
                GVAR(changedMarker) pushBack _x;
                [QGVAR(updateMarkerWithTimestemp), [_x]] call CBA_fnc_globalEvent;

            };
        } forEach allMapMarkers;

        GVAR(nrMarker) = count allMapMarkers;
    };
    
    
}];