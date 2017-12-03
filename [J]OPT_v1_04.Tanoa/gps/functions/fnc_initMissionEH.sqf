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
GVAR(eh_onEachFrame) = addMissionEventHandler ["EachFrame", {
    [] call FUNC(updateMarker);

}];

// delete old marker if unit disconnects
if (isServer) then {
    GVAR(eh_PlayerDisconnected) = addMissionEventHandler ["PlayerDisconnected", {
        /*
            id: Number - unique DirectPlay ID (very large number). It is also the same id used for user placed markers (same as _id param)
            uid: String - getPlayerUID of the leaving client. The same as Steam ID (same as _uid param)
            name: String - profileName of the leaving client (same as _name param)
            jip: Boolean - didJIP of the leaving client (same as _jip param)
            owner: Number - owner id of the leaving client (same as _owner param)
        */
        params ["_id", "_uid", "_name", "_jip", "_owner"];

        private _marker =  format["%1_%2", QGVAR(unitMarker), _name];
        private _id = allMapMarkers find _marker;
        if (_id != -1) then {
            deleteMarker _marker;

        };
    }];
};