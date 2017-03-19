//{
	private "_unit";
	_unit = _this select 0;
	if (isNull _unit) then {
		diag_log format ["OPT Debug Message: Null Obj player found: %1",str(_unit)];
	};
	//diag_log format ["OPT D %1",time];
	_marker = _unit getVariable ["far_unitMarker", Nil];

	if (!isNil "_marker") then {
		if (_unit getVariable ["FAR_isUnconscious", 0] == 0) then {
			deleteMarkerLocal _marker;
			_unit setVariable ["far_unitMarker", Nil];
		};
	};
//} forEach playableUnits;


true