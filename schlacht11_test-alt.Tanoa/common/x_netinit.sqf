x_event_holder = "Land_HelipadEmpty_F" createVehicleLocal [0, 0, 0];
if (isServer) then {
	x_event_holderCTS = "Land_HelipadEmpty_F" createVehicleLocal [0, 0, 0];
};
x_event_holderSTO = "Land_HelipadEmpty_F" createVehicleLocal [0, 0, 0];
if (!isDedicated) then {
	x_event_holderToClients = "Land_HelipadEmpty_F" createVehicleLocal [0, 0, 0];
};

"x_n_e_gl" addPublicVariableEventHandler {					// all
	(_this select 1) call tcb_fnc_NetRunEvent;
};
if (isServer) then {										// client to server
	"x_ncts" addPublicVariableEventHandler {
		(_this select 1) call tcb_fnc_NetRunEventCTS;
	};
};
"x_nsto" addPublicVariableEventHandler {					// send to owner
	(_this select 1) call tcb_fnc_NetRunEventSTO;
};
if (!isDedicated) then {
	"x_nstc" addPublicVariableEventHandler {				// send to all clients (from server)
		(_this select 1) call tcb_fnc_NetRunEventToClients;
	};
};