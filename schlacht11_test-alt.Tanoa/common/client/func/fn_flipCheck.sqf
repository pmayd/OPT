// by psycho
// check if vehicle need a flip
private ["_cond","_obj"];
_player = _this select 0;

cond = false;
_obj = cursorTarget;

cond = if (
	((_obj distance _player) < 10) && 
	{_obj isKindOf 'landVehicle'} && 
	{(vectorUp _obj) select 2 < 0.4} &&
	{alive _obj} && 
	{speed _obj < 1}
) then {
	true
} else {
	false
};


cond