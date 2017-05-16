#include "..\..\setup\setup.sqf"
private ["_victim","_killer","_pos","_deadcam"];
_victim = _this select 0;
_killer = _this select 1;

if (dialog) then {
	[] spawn {
		while {dialog} do {
			closeDialog 5566;
			closeDialog 5651;
			closeDialog 0;
		};
	};
};

_pos = [(getPosATL _victim select 0)-(vectorDir _victim select 0)*3,(getPosATL _victim select 1)-(vectorDir _victim select 1)*3,(getPosATL _victim select 2)+1];
titleCut ["","BLACK IN",1];

_deadcam = "Camera" camCreate (position _victim);
_deadcam cameraEffect ["internal","back"];
showCinemaBorder true;
_deadcam camPrepareTarget _victim;
_deadcam camPreparePos _pos;
_deadcam camPrepareFOV 0.7;
_deadcam camCommitPrepared 0;

if ((__RESPAWN_DELAY__ > 10) || (__RESPAWN_TYPE__ < 2)) then {
	_quote = tcb_ais_killcam_quotes call tcb_fnc_RandomArrayVal;
	_handle = [_quote select 0, _quote select 1, ((missionNameSpace getVariable "tcb_ais_respawndelay") - 1)] execVM "common\client\quote.sqf";;
};
if (__RESPAWN_TYPE__ == 0) then {
	_quote = tcb_ais_killcam_quotes call tcb_fnc_RandomArrayVal;
	_handle = [_quote select 0,_quote select 1, 999] execVM "common\client\quote.sqf";
};
waitUntil {camCommitted _deadcam};

if ((_killer == _victim) or (!alive _killer) or (isNull _killer)) then {
	_deadcam camPrepareTarget _victim;
	_deadcam camsetrelpos [-3, 20, 10];
	_deadcam camPrepareFOV 0.474;
	_deadcam camCommitPrepared 20;
	waitUntil {alive player};
	player cameraEffect ["terminate","back"];
	camDestroy _deadcam;

} else {
	if (isPlayer _killer) then {
		titleText [format ["You were killed from %1", name _killer],"PLAIN DOWN",0.5];
	};
	sleep 1;
	_deadcam camCommand "inertia on";
	_deadcam camPrepareTarget (vehicle _killer);
	_deadcam camsetrelpos [-3, 20, 10];
	_deadcam camPrepareFOV 1;
	_deadcam camCommitPrepared 10;
	waitUntil {alive player};
	player cameraEffect ["terminate","back"];
	camDestroy _deadcam;

};

// log
["opt_eh_server_log_player_killed", [_victim, _killer]] call CBA_fnc_serverEvent;