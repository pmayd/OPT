#include "../../setup.sqf"
private ["_camera"];

_viewDistance = viewDistance;
setViewDistance 1500;
["LeadTrack05_F_EPC", 50] spawn tcb_fnc_JukeBox;

waitUntil {!isNil "BIS_fnc_init"};
waitUntil {!isNull (findDisplay 46)};
[0,0,false] spawn BIS_fnc_cinemaBorder;
if (sunOrMoon == 0) then {camUseNVG true};

_pos = [getPosASL player, 50, getDir player] call BIS_fnc_relPos;
_camera = "camera" camCreate [_pos select 0, _pos select 1, 10];
waitUntil {preloadCamera _pos};
//sleep 1;
titleCut ["","BLACK IN", 3.5];
"dynamicblur" ppeffectenable true;
"dynamicblur" ppeffectadjust [5];
"dynamicblur" ppeffectcommit 0;
"dynamicblur" ppeffectadjust [0];
"dynamicblur" ppeffectcommit 5;


_camera camSetTarget [getPosASL player select 0, getPosASL player select 1 , 1.5];
_camera camSetFov 0.7;
_camera cameraEffect ["INTERNAL", "Back"];
_camera camCommit 1;
waitUntil {camCommitted _camera};

_layer = "tcbIntroLayer" call BIS_fnc_rscLayer;
_layer cutRsc ["mission_Label", "PLAIN"];

_camera camSetTarget player;
_camera camSetPos [getPosASL player select 0, getPosASL player select 1, 2];
_camera camCommit 5;
waitUntil {camCommitted _camera};
player cameraEffect ["terminate","back"];
camDestroy _camera;
closeDialog 0;

[1,nil,false] spawn BIS_fnc_cinemaBorder;
sleep 1;
[parseText format [ "<t align='right' size='1.2'><t font='PuristaBold' size='1.6'>""%1""</t><br/>%2</t>", __MISSION_NAME__, "von: " + __MADEBY__], true, nil, 7, 0.7, 0] spawn BIS_fnc_textTiles;
setViewDistance _viewDistance;

sleep 3;
intro_done = true;
titleRsc ["Mission_Title3", "PLAIN"];
enableSaving [false,false];