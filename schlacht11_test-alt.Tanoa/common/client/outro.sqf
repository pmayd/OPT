//by psycho
if (isDedicated) exitWith {forceEnd};
_artist = _this select 0;
if (isNull _artist) then {_artist = player};
_name = name _artist;

waitUntil {alive _artist};

if (vehicle _artist != _artist) then {
	_vec = vehicle _artist;
	_vec setVeloCity [0,0,0];
	_vec allowDamage false;
	if (_vec isKindOf "Air") then {
		_vec setVectorUp [0,0,1];
		_artist action ["autoHover", _vec];
		_vec setVeloCity [0,0,0];
	};
};

_artist = vehicle _artist;

playMusic "EP1_Track01";
showCinemaBorder false;
_artist allowDamage false;

_camera = "camera" camcreate [0,0,0];
_camera cameraeffect ["internal", "back"];
titleCut ["","BLACK IN",3];


//=== 12:52:55 --target player
_camera camPrepareTarget _artist;
_camera camPreparePos (position _artist);
_camera camsetrelpos [0, 1, 1.5];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 0;
waitUntil {camCommitted _camera};

_camera camPrepareTarget _artist;
_camera camsetrelpos [0, 1, 1.5];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 0;
waitUntil {camCommitted _camera};
sleep 2;
TitleText [format ["Good Job %1",_name], "Plain Down"];
sleep 1;

//=== 12:54:52 --wegfahren
_camera camPrepareTarget _artist;
_camera camsetrelpos [-3, 20, 3];
_camera camPrepareFOV 0.474;
_camera camCommitPrepared 26;


sleep 8;
["Credits:" call XBlueText,-0.3,1.5,6,0.5,-2,790] spawn BIS_fnc_dynamicText;
sleep 2;
["Spectating Script by Kegetys",0,1.5,6,0.5,-2,791] spawn BIS_fnc_dynamicText;
sleep 2;
["Artillery System by Xeno",0,1.5,6,0.5,-2,792] spawn BIS_fnc_dynamicText;
sleep 2;
["Death-Dialog by Psychobastard",0,1.5,6,0.5,-2,793] spawn BIS_fnc_dynamicText;
sleep 2;
["AIS-Wounding System by BonInf*",0,1.5,6,0.5,-2,794] spawn BIS_fnc_dynamicText;
sleep 2;
["Settings and Backpack Dialog by BonInf*",0,1.5,6,0.5,-2,795] spawn BIS_fnc_dynamicText;
sleep 2;
["Nethandling by CBA Team",0,1.5,6,0.5,-2,796] spawn BIS_fnc_dynamicText;
sleep 2;
["Operation Flashpoint by BIS",0,1.5,6,0.5,-2,797] spawn BIS_fnc_dynamicText;
sleep 2;
["and all the players from today ;-)" call XOrangeText,-0.3,1.5,6,0.5,-2,798] spawn BIS_fnc_dynamicText;
sleep 3;
{
	if (isPlayer _x) then {
		sleep 0.3;
		_name = name _x;
		[_name,0,1.5,4,0.2,-2,800 + _forEachIndex] spawn BIS_fnc_dynamicText;
	};
} forEach playableUnits;


sleep 5;
TitleRsc ["OUTRO","plain",1.2];
waitUntil {camCommitted _camera};
12 fadeMusic 0;
sleep 6;

titleCut ["","BLACK OUT",3];
sleep 4;


Player cameraEffect ["terminate","back"];
camDestroy _camera;

endmission "END1";
forceEnd;