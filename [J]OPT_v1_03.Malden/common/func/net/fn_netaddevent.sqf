private ["_a", "_ea"];
_a = switch (_this select 0) do {
	case 0: {true}; // all
	case 1: {isServer}; // server only
	case 2: {!isDedicated}; // client only
	case 3: {isDedicated}; // dedicated only
	case 4: {!isServer}; // client only, 2
};
if (_a) then {
	_ea = x_event_holder getVariable [_this select 1, []];
	//if (isNil "_ea") then {_ea = []};
	_ea pushBack (_this select 2);
	x_event_holder setVariable [_this select 1, _ea];
};