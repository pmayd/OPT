/**
* Author: James
* end mission for client
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] spawn fnc_endMission.sqf;
*
* Server only:
* no
*
* Public:
* yes
*/
#include "script_component.hpp"

/* VALIDATION */
if (!canSuspend) exitWith{};

/* CODE BODY */
private _timeElapsed = serverTime - EGVAR(serverclock,startTime);

if ((EGVAR(serverclock,playTime) - _timeElapsed) <= 0) then {
    diag_log format ["########## Schlacht automatisch beendet. Endpunktestand: NATO %1 | CSAT %2 ##########", GVARMAIN(nato_points), GVARMAIN(csat_points)];
} else {
    diag_log format ["########## Schlacht von MT beendet. Endpunktestand: NATO %1 | CSAT %2 ##########", GVARMAIN(nato_points), GVARMAIN(csat_points)];
};

// calculate winner
if (GVARMAIN(csat_points) != GVARMAIN(nato_points)) then {
    if (GVARMAIN(csat_points) > GVARMAIN(nato_points)) then {
        GVARMAIN(csat_win) = 1;
    } else {
        GVARMAIN(nato_win) = 1;
    };
};

private _camPos = vehicle player;
private _text = switch (true) do {
    case (GVARMAIN(csat_win) == 1) : {"CSAT hat gewonnen!"};
    case (GVARMAIN(nato_win) == 1) : {"NATO hat gewonnen!"};
    default {"Unentschieden!"};
};

private _camera = "camera" camCreate [(getPos _camPos Select 0), (getPos _camPos Select 1), 50];
_camera cameraEffect ["internal", "back"];
_camera camSetTarget _camPos;
_camera camCommit 1;

sleep 0.1;

showCinemaBorder false;
_camera camSetRelPos [0,10,5];
titleText [_text, "PLAIN DOWN",60];
_camera camCommit 10;

waitUntil {camCommitted _camera};

//titleText [_text, "PLAIN DOWN"];
removeallweapons player;
sleep 3;

// calculate personal endscreen and shutdown the running mission
private _end = switch (true) do {
    case (side player == west && {GVARMAIN(nato_win) == 1}) : {["END1",true,true]};
    case (side player == west && {GVARMAIN(csat_win) == 1}) : {["END2",false,true]};
    case (side player == east && {GVARMAIN(nato_win) == 1}) : {["END1",false,true]};
    case (side player == east && {GVARMAIN(csat_win) == 1}) : {["END2",true,true]};
    default {["END3",true,true]};
};
_end spawn BIS_fnc_endMission;

_camera cameraEffect ["terminate", "back"];
camDestroy _camera;
