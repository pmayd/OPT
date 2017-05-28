private ["_ea"];
_ea = x_event_holderSTO getVariable [_this select 0, []];
_ea pushBack (_this select 1);
x_event_holderSTO setVariable [_this select 0, _ea];