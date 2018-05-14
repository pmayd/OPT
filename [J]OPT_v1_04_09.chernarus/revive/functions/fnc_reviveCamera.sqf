/**
* Author: James
* kill camera + overlay ui
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_reviveCamera.sqf;
*
*/
#include "script_component.hpp"


closeDialog 0;
closeDialog 0;

private _camobj = player;
private _pos = positionCameraToWorld [0,0,-0.2];
private _destpos = [getpos player select 0, getpos player select 1, (getpos player select 2) + 20];
private _cam = "camera" camCreate _pos;
_cam cameraEffect ["internal", "BACK"];
_cam camSetFOV 1.0;
showCinemaBorder false;
if ( (date select 3) < 4 || (date select 3) >= 20 ) then { camUseNVG true; } else { camUseNVG false; };
_cam camSetTarget _camobj;

private _dialog = createDialog "far_blackscreen";
//0 fadesound 0;

[] spawn {
	sleep 3.5;
	3 fadesound 1;
	titleText  [ "" ,"BLACK IN",3];
};

"filmGrain" ppEffectAdjust [0.3, 2, 4, 0.5, 0.5, true];
"filmGrain" ppEffectCommit 0;
"filmGrain" ppEffectEnable TRUE;

"colorCorrections" ppEffectAdjust [1, 1.6, -0.35, [1, 1, 1, 0], [1, 1, 1, 0], [0.75, 0.25, 0, 1.0]];
"colorCorrections" ppEffectCommit 0;
"colorCorrections" ppEffectEnable TRUE;

if (random 3 > 1) then {	//1/3 chance
	private _ran1 = [4,5,6,7,8,9] call BIS_fnc_selectRandom;
	private _ran2 = [1,2,3,4,5] call BIS_fnc_selectRandom;
	private _deathsound = format ["A3\sounds_f\characters\human-sfx\P0%1\Hit_Max_%2.wss", _ran1, _ran2];
	playSound3D [_deathsound, player, false, getPos player, 1, 1, 70];	// 70m
};

_cam camCommit 0;
_cam camSetPos _destpos;
_cam camCommit 1800;


waitUntil {(player getVariable ["FAR_isUnconscious", 0]) == 1};
closeDialog 0;
waitUntil {!dialog};

[] spawn FUNC(reviveUI);
waitUntil {dialog};

private _run = true;
while {_run} do {
	waitUntil {(player getVariable "FAR_isUnconscious") == 0 || !alive player || !dialog};	// loop to prevent breakout trough Esc button

	if (alive player && {(player getVariable ["FAR_isUnconscious",0]) == 1}) then {
		if (!dialog && _run) then {
			[] spawn FUNC(reviveUI);
			waitUntil {dialog};
		};
	} else {
		closeDialog 5566;
		closeDialog 5651;
		disableUserInput false;
		"colorCorrections" ppEffectEnable FALSE;
		"filmGrain" ppEffectEnable FALSE;
		_cam cameraEffect ["Terminate", "BACK"];
		camDestroy _cam;
		camUseNVG false;
		_run = false;
	};
};