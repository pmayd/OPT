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
			_name = name _obj;
		} else {
		_name = name _killer;
		};
	};
};

_name