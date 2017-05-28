//	fn_iconColor

// changed by psycho

private ["_u","_c","_a"];
_u = _this select 0;
_a = 0.7;

if ((group _u) == (group player)) then {_a = 0.9;};

/*
if (_u getVariable "btc_qr_unc") exitWith {_c = [1,1,1,1];_c;};

if (side _u == east) exitWith {_c = [0.5,0,0,_a];_c;};
if (side _u == west) exitWith {_c = [0,0.3,0.6,_a];_c;};
if (side _u == independent) exitWith {_c = [0,0.5,0,_a];_c;};	// idependent doesnt exist
if (side _u == civilian) exitWith {_c = [0.4,0,0.5,_a];_c;};
_c = [0.7,0.6,0,_a];
*/


_c = switch (true) do {
	case (_u getVariable "btc_qr_unc") : {[1,1,1,1]};
	case (side _u == east) : {[0.5,0,0,_a]};
	case (side _u == west) : {[0,0.3,0.6,_a]};
	case (side _u == resistance) : {[0,0.5,0,_a]};
	case (side _u == civilian) : {[0.4,0,0.5,_a]};
	default {[0.7,0.6,0,_a]};
};

_c