// by psycho
// check if vehicle need a flip
private ["_cond","_obj"];

_obj = cursorTarget;

_cond = [true, false] select {
	(speed _obj < 1) and 
	((_obj distance player) < 10) and 
	(_obj isKindOf 'landVehicle') and 
	(alive _obj) and 
	((vectorUp _obj) select 2 < 0.4)
};

_cond