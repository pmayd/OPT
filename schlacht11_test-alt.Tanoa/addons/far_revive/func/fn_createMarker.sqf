private "_mark";
_unit = _this select 0;
_mark = "";
//if (_unit == player) exitWith {_mark};
	
if (FAR_PlayerSide == side _unit) then {
	_str = name _unit;
	_marker = format ["%1_far_marker", _str];

	_mark = createMarkerLocal [_marker, position _unit];
	_mark setMarkerTextLocal format ["%1 down", _str];
	_mark setMarkerShapeLocal "ICON";
	_markColor = "ColorRed";
	_markType  = "loc_Hospital";

	_mark setMarkerTypeLocal _markType;
	_mark setMarkerColorLocal _markColor;
	_mark setMarkerAlphaLocal 0.7;
	
	_unit setVariable ["far_unitMarker", _marker];
};

_mark