// by psycho
// check if vehicle need a flip
params ["_target", "_caller"];

_cond = false;

if 
	(
		(speed _target < 1) and 
		((_target distance _caller) < 10) and 
		(_target isKindOf 'landVehicle') and 
		(alive _target) and 
		((vectorUp _target) select 2 < 0.4)
	) then {
	_cond = true;
};

_cond