// example: _myrandomarray = _myNormalArray call tcb_fnc_RandomArray;
private ["_ar","_ran_array","_this"];
_ar =+ _this;
_ran_array = [];
while {count _ar > 0} do {
	_ran = (count _ar) call tcb_fnc_RandomFloor;
	_ran_array pushBack (_ar select _ran);
	_ar set [_ran, "xfXX_del"];
	_ar = _ar - ["xfXX_del"];
};
_ran_array