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

// delete old marker if unit disconnects
GVAR(EH_PlayerDisconnected) = addMissionEventHandler ["PlayerDisconnected", {
    /*
        id: Number - unique DirectPlay ID (very large number). It is also the same id used for user placed markers (same as _id param)
        uid: String - getPlayerUID of the leaving client. The same as Steam ID (same as _uid param)
        name: String - profileName of the leaving client (same as _name param)
        jip: Boolean - didJIP of the leaving client (same as _jip param)
        owner: Number - owner id of the leaving client (same as _owner param)
    */
    params ["_id", "_uid", "_name", "_jip", "_owner"];
    LOG_1("Spieler %1 disconnected!",_name);

    // search for all markers with unit name in it and delete them globally
    [QGVAR(clearMarker), [_name]] call CBA_fnc_remoteEvent;

}];
