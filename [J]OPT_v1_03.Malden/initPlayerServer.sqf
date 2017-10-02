#include "setup\setup.sqf"
params ["_player", "_didJIP"];

// Intro 
if (!_didJIP) then {
	// Intro abspielen
	if (OPT_SHOW_INTRO == 1) then {
		[] remoteExec ["opt_fnc_intro", _player, false];
	};
};

// rufe Zeusskript auf
[_player] execVM "addons\opt3_zeus\addEditableObjects.sqf";