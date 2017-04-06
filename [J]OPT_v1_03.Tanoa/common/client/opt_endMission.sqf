/*
	Final messages and actions

	Author: Phantom (OPT MOD Team)
		Modified by schmingo (OPT MOD Team)

	v2014-10-06 | this script is part of OperationPandoraTrigger ArmA3 script collection
*/


//changed by psycho
// auto-mission end is possible now
if (!local player) exitWith {};
waitUntil {sleep 4; (WinEast == 1 || WinWest == 1 || Draw == 1 || playTime <= 0)};

if (playTime <= 0) then {
	diag_log format ["########## Schlacht automatisch beendet. Endpunktestand: NATO %1 | CSAT %2 ##########", WestPoints, EastPoints];
} else {
	diag_log format ["########## Schlacht von MT beendet. Endpunktestand: NATO %1 | CSAT %2 ##########", WestPoints, EastPoints];
};

// calculate winner
if (EastPoints != WestPoints) then {
	if (EastPoints > WestPoints) then {
		WinEast = 1;
	} else {
		WinWest = 1;
	};
};

_camPos = vehicle Player;
_text = switch (true) do {
	case (WinEast == 1) : {"CSAT hat gewonnen!"};
	case (WinWest == 1) : {"NATO hat gewonnen!"};
	default {"Unentschieden!"};
};

_camera = "camera" camCreate [(getPos _camPos Select 0), (getPos _camPos Select 1), 50];
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
_end = switch (true) do {
	case (side player == west && {WinWest == 1}) : {["END1",true,true]};
	case (side player == west && {WinEast == 1}) : {["END2",false,true]};
	case (side player == east && {WinWest == 1}) : {["END1",false,true]};
	case (side player == east && {WinEast == 1}) : {["END2",true,true]};
	default {["END3",true,true]};
};
_end spawn BIS_fnc_endMission;

_camera cameraEffect ["terminate", "back"];
camDestroy _camera;