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

    // search for all markers with unit name in it and delete them on all clients
    [objNull, QGVAR(unitGPSMarker), format["%1_%2", QGVAR(unitGPSMarker), _name]] remoteExecCall [QEFUNC(common,clearMarker), -2, false];

}];

GVAR(EH_EntityRespawned) = addMissionEventHandler ["EntityRespawned", {
    params ["_newEntity", "_oldEntity"];

    // search for all markers with unit name in it and delete them on all clients
    private _name = name _oldEntity;
    [_oldEntity, QGVAR(unitGPSMarker), format["%1_%2", QGVAR(unitGPSMarker), _name]] remoteExecCall [QEFUNC(common,clearMarker), -2, false];

    private _name = name _newEntity;
    [_newEntity, QGVAR(unitGPSMarker), format["%1_%2", QGVAR(unitGPSMarker), _name]] remoteExecCall [QEFUNC(common,clearMarker), -2, false];

}];


