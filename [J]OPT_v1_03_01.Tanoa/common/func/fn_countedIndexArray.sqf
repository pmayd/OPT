// example: _myrandomindexarray = [_mynormalarray,_numberoffoutgivenentries] call tcb_fnc_CountedIndexArray;
private ["_ran","_array","_num ","_ran_array"];
_array = _this select 0;
_num = _this select 1;
_ran_array = (count _array) call tcb_fnc_RandomIndexArray;
while {count _ran_array > _num} do {
	_ran = (count _ran_array) call tcb_fnc_RandomFloor;
	_ran_array set [_ran, "xfXX_del"];
	_ran_array = _ran_array - ["xfXX_del"];
};
_ran_array