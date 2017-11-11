private ["_params", "_action"];

// Parameters passed by the action
_caller = _this select 1;
_params = _this select 3;
_action = _params select 0;

////////////////////////////////////////////////
// Handle actions
////////////////////////////////////////////////
if (_action == "action_revive") then {
	[cursorTarget,_caller] spawn opt_addons_fnc_HandleRevive;
};

if (_action == "action_stabilize") then {
	[cursorTarget,_caller] spawn opt_addons_fnc_HandleStabilize;
};

if (_action == "action_suicide") then {
	player setDamage 1;
};

if (_action == "action_drag") then {
	[cursorTarget] spawn opt_addons_fnc_Drag;
};

if (_action == "action_release") then {
	[] spawn opt_addons_fnc_Release;
};