#include "..\..\..\setup\setup.sqf"

params ["_vec", "_killer", "_instigator"];

// log destroyed vehicle and killer
["opt_eh_server_log_kill", [_vec, _instigator]] call CBA_fnc_serverEvent;

// remove vehicle and ai crew
#ifdef __REMOVE_DEAD_AI_AND_VECS__
	(_this) spawn {
		params ["_vec", "_killer"];
		sleep __REMOVE_DEAD_AI_AND_VECS__;
		{deleteVehicle _x} foreach (crew _vec);
		deleteVehicle _vec;
	};
#endif	