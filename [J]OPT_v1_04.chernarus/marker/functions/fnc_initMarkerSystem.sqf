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

if (GVAR(isOn)) then {

    GVAR(eh_EachFrame) = addMissionEventHandler ["EachFrame", {

        if (GVAR(nrMarker) != count allMapMarkers) then {
            {   
                // check if marker is user defined and was not edited before
                if ((_x find "_USER_DEFINED" != -1) and !(_x in GVAR(changedMarker))) then {
        
                    GVAR(changedMarker) pushBack _x;
                    [_x] call FUNC(updateMarker);

                };
            } forEach allMapMarkers;

            GVAR(nrMarker) = count allMapMarkers;
        };
        
        
    }];
} else {
    removeMissionEventHandler ["EachFrame", GVAR(eh_EachFrame)];
};



