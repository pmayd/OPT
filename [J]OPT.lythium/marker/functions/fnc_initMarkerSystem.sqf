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

while {true} do {
    if (GVAR(nrMarker) != count allMapMarkers) then {
        allMapMarkers apply
        {
            // check if marker is user defined and was not edited before
            if ((_x find "_USER_DEFINED" != -1) and !(_x in GVAR(changedMarker))) then
            {
                GVAR(changedMarker) pushBack _x;
                if ((GVAR(customMarkerTxt) isEqualTo "" or (markerText _x) find GVAR(customMarkerTxt) != -1)) then
                {
                    [_x] call FUNC(updateMarker);
                };

            };
        };

        GVAR(nrMarker) = count allMapMarkers;
    };

    sleep GVAR(updateInterval);
};



