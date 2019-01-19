/**
* Author: James
* log average and min fps each second on client and send to server after one minute
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_logFPS.sqf;
*
* Public:
* yes
*/
#include "script_component.hpp"

// log fps only after truce
waitUntil {EGVAR(serverclock,missionStarted)};

// log fps each update intervall on server
while {true} do {
    
    [PLAYER_NAME, diag_fps, diag_fpsMin] remoteExecCall [QFUNC(storeFPS), 2, false];

    sleep GVAR(fpsUpdateTime);
};