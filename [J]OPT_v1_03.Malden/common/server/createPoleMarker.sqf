// by psycho
if (!isServer) exitWith {};
waitUntil {time > 1};

{
	_flag = _x;
	_side = _flag getVariable ["owner", nil];
	_m_name = format["marker_%1_%2", _flag, _forEachIndex];
	_m_pos = getPos _flag;
	_marker = createMarker [_m_name, _m_pos];

	_marker setMarkerShape
	_marker setMarkerType "ELLIPSE";
	
	_side = _flag getVariable ["owner", nil];
	if (!isNil {_side}) then {
		_color = if (_side == west) then {"ColorBlufor"} else {"ColorOpfor"};
		_marker setMarkerColor _color;
	} else {
		_marker setMarkerColor "ColorBlack";
	};
	_marker setMarkerSize [5,5];
	_marker setMarkerBrush "SOLID";
	_marker setMarkerAlpha 1;
	_flag setVariable ["opt_flagMarker", _marker];
} forEach (opt_csat_flags + opt_nato_flags);
