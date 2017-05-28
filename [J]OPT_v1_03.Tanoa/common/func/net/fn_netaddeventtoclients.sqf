private ["_ea"];
_ea = x_event_holderToClients getVariable [_this select 0, []];
_ea pushBack (_this select 1);
x_event_holderToClients setVariable [_this select 0, _ea];