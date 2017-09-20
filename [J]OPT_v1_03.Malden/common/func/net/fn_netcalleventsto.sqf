// checks if object is local first otherwise tries to send to the owner client making use of publicVariableServer and publicVariableClient (on the server)
// ["eventname", [object, var or vararray]] call tcb_fnc_NetCallEventSTO
// ["eventname", object] call tcb_fnc_NetCallEventSTO

private ["_tt", "_obj", "_isLocal"];
_tt = _this select 1;
_obj = if (typeName _tt == "ARRAY") then {_tt select 0} else {_tt};
if (isNil "_obj" || {isNull _obj}) exitWith {};
_islocal = if (typeName _obj != "GROUP") then {
	local _obj
} else {
	local (leader _obj)
};

if (!_isLocal) then {
	x_nsto = _this;
	publicVariableServer "x_nsto";
} else {
	_this call tcb_fnc_NetRunEventSTO;
};