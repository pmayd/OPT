// by psycho
private ["_east_owner","_west_owner"];
_east_owner = 0;
_west_owner = 0;

/*
{
	_flag = format ["%1",_x];
	_side_flag = _x getVariable _flag;
	if (_side_flag == east) then {
		_east_owner = _east_owner + 1;
	};
} forEach OPT_CSAT_FLAGs;

{
	_flag = format ["%1",_x];
	_side_flag = _x getVariable _flag;
	if (_side_flag == west) then {
		_west_owner = _west_owner + 1;
	};
} forEach OPT_NATO_FLAGs;
*/

// calculate every flag, regardless witch side was defined before - make it possible to generate assyncrone gameplay
_allFlags = OPT_CSAT_FLAGs + OPT_NATO_FLAGs;
{
	_side_flag = _x getVariable ["owner", nil];
	if (_side_flag == west) then {
		_west_owner = _west_owner + 1;
	} else {
		if (_side_flag == east) then {
			_east_owner = _east_owner + 1;
		} else {
			diag_log format ["undefined flag state found - error in variable handling or wrong player side (nor west,east)"];
			systemChat "undefined flag state found - error in variable handling or wrong player side (nor west,east)";
		};
	};
} forEach _allFlags;


_side = switch (true) do {
	case (_east_owner > _west_owner) : {east};
	case (_west_owner > _east_owner) : {west};
	case (_west_owner == _east_owner) : {resistance};	// nobody
};

_side