_viewDistance = viewDistance;
setViewDistance 1000;
["LeadTrack05_F_EPC", 50] spawn OPT_Core_fnc_Music;

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

_mName = "";
_mName = getText (missionConfigFile >> "MissionSQM" >> "Mission">> "Intel" >> "briefingName");
if (_mName == "") then {
	_mName = getMissionConfigValue ["onLoadName", "M-Name not defined!"];
};
_mAuthor = getMissionConfigValue ["author", "M-Author not defined!"];

_camera camSetTarget player;
_camera camSetPos [getPosASL player select 0, getPosASL player select 1, 2];
_camera camCommit 5;
sleep 1;
[parseText format [ "<t align='right' size='1.4'><t font='PuristaBold' size='2.0'>""%1""</t><br/>%2</t>", _mName, "von: " + _mAuthor], true, nil, 7, 0.7, 0.15] spawn BIS_fnc_textTiles;
waitUntil {camCommitted _camera};
player cameraEffect ["terminate","back"];
camDestroy _camera;
closeDialog 0;

[1,nil,false] spawn BIS_fnc_cinemaBorder;
titleRsc ["Mission_Title3", "PLAIN"];
sleep 1;

setViewDistance _viewDistance;

sleep 3;
intro_done = true;
[parseText format [ "<t align='right' size='1.2'><t font='PuristaBold' size='1.5'>%1</t><br/>%2</t>", (str(date select 3) + ":" + str(date select 4)) + " Uhr", "am " + (str(date select 2) + "." + str(date select 1) + "." + str(date select 0))], true, nil, 5, 0.7, 0.1] spawn BIS_fnc_textTiles;

disableRemoteSensors true;
enableEnvironment true;
enableRadio true;
player disableConversation true;
enableSentences false;
showSubtitles false;
enableSaving [false,false];
enableTeamswitch false;