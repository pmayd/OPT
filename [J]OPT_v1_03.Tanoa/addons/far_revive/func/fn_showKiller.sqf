// by psycho
private "_name";
params ["_unit", "_killer"];
_name = "";

if (_unit != _killer) then {
	if (isPlayer _killer) then {
		if (vehicle _killer != _killer) then {
			_vec = vehicle _killer;
			_obj = gunner _vec;
			if (isNull _obj) then {
				_obj = effectiveCommander _vec;
			};
            _uid = getPlayerUID _obj;
            _id = (opt_ListOfPlayers apply {_x select 0}) find _uid;
            _name = (opt_ListOfPlayers select _id) select 1;

		} else {
            _uid = getPlayerUID _killer;
            _id = (opt_ListOfPlayers apply {_x select 0}) find _uid;
            _name = (opt_ListOfPlayers select _id) select 1;
		};
	};
};

_name