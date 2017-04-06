// example: _myrandomindexarray = _numberentries call tcb_fnc_RandomIndexArray;
private ["_count","_ran_array"];
_count = _this;
_ran_array = [];
for "_i" from 0 to (_count - 1) do {_ran_array pushBack _i};
_ran_array = _ran_array call tcb_fnc_RandomArray;
_ran_array