#include "setup\setup.sqf"
params ["_player", "_didJIP"];

// Intro 
#ifdef __INTRO__
if (!_didJIP) then {
	// Intro abspielen
	if (OPT_SHOW_INTRO == 1) then {
		[] remoteExec ["opt_fnc_intro", _player, false];
	};
};
#endif
