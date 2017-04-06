params ["_vec", "_killer"];

// log destroyed vehicle and killer
["opt_eh_server_log_vec_destroyed", [_vec, _killer]] call CBA_fnc_serverEvent;

// remove vehicle and ai crew
#ifdef __REMOVE_DEAD_AI_AND_VECS__
	(_this) spawn {
		params ["_vec", "_killer"];
		sleep 60;
		{deleteVehicle _x} foreach (crew _vec);
		deleteVehicle _vec;
	};

#endif	