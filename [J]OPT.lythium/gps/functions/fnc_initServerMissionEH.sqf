/**
* Author: James
* initialize mission EH
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

// delete old marker if unit disconnects
GVAR(EH_PlayerDisconnected) = addMissionEventHandler ["HandleDisconnect", {
    /*
        unit: Object - unit formerly occupied by player
        id: Number - same as _id in onPlayerDisconnected
        uid: String - same as _uid in onPlayerDisconnected
        name: String - same as _name in onPlayerDisconnected
    */
    params ["_unit", "_id", "_uid", "_name"];
    LOG_3("%1 (%2) disconnected! Former unit: %3. Run GPS Cleanup",_name,_uid,_unit);

    // search for all markers with unit name in it and delete them on all clients
    [objNull, _name] remoteExecCall [QFUNC(clearMarker), -2, false];

}];


