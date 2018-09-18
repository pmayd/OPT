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
    LOG_2("%1 (%2) disconnected! Run GPS Cleanup",_name,_uid);

    // search for all markers with unit name in it and delete them on all clients
    [_unit] remoteExecCall [QFUNC(clearMarker), -2, false];
    deleteVehicle _unit; 

}];


