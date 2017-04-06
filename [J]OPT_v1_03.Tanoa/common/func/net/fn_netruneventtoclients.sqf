private ["_ea", "_p", "_pa"];
_ea = x_event_holderToClients getVariable (_this select 0);
if (!isNil "_ea") then {
	_pa = _this select 1;
	if (!isNil "_pa") then {
		{_pa call _x} forEach _ea;
	} else {
		{call _x} forEach _ea;
	};
};