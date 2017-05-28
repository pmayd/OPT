_state = _this select 0;

if (_state) then {
	player setVariable ["tf_unable_to_use_radio",false];
	player setVariable ["acre_sys_core_isDisabled",false];
} else {
	player setVariable ["tf_unable_to_use_radio",true];
	player setVariable ["acre_sys_core_isDisabled",true];
};

true