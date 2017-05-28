//by psycho
private ["_man","_strenght","_grp","_max","_strenght","_percent"];
_man = _this;
_strenght = 0;

_grp = group _man;
_max = count units _grp;
{
	if (_x distance _man < 150) then {
		_strenght = _strenght + 1;
	};
} forEach units _grp;

_percent = if (_strenght > 0) then {_strenght / _max} else {1};
if (_percent < 0.2) then {_percent = 0.2};

_percent