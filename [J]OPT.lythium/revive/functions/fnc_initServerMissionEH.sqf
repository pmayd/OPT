/**
* Author: James
* initialize server EH
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call EFUNC(revive,initServerMissionEH);
*
* Server only:
* yes
*
* Public:
* no - called from XEH_PostInit.sqf
*/
#include "script_component.hpp"

/* PARAMS */

/* VALIDATION */

/* CODE BODY */
// delete old marker if unit disconnects
GVAR(EH_PlayerDisconnected) = addMissionEventHandler ["HandleDisconnect", {
    /*
        unit: Object - unit formerly occupied by player
        id: Number - same as _id in onPlayerDisconnected
        uid: String - same as _uid in onPlayerDisconnected
        name: String - same as _name in onPlayerDisconnected
    */
    params ["_unit", "_id", "_uid", "_name"];

    // search for all markers with unit name in it and delete them on all clients
    [objNull, "FAR_unitMarker", format ["FAR_marker_%1", _name]] remoteExecCall [QEFUNC(common,clearMarker), -2, false];


}];