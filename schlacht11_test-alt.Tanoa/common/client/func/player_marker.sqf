#include "..\..\..\setup\setup.sqf"
_color = switch (playerSide) do {
	case (west) : {"ColorBlufor"};
	case (east) : {"ColorOpfor"};
	case (resistance) : {"ColorIndependent"};
	case (civilian) : {"ColorCivilian"};
	default {"ColorUnknown"};
};

{[(_x select 0), [0,0],"ICON",_color,[1,1],"",0,"hd_dot"] call tcb_fnc_CreateMarkerLocal} forEach tcb_p_entities;

[] spawn {
	sleep 10;
	["marker_units", {call tcb_fnc_MarkerPlayers}, 2.02] call tcb_fnc_addPerFrame;
};