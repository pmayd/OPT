private "_mark";
_unit = _this select 0;
_mark = "";
//if (_unit == player) exitWith {_mark};
	
if (FAR_PlayerSide == _unit getVariable "opt_var_playerSide") then {
    _uid = getPlayerUID _unit;
    _id = (opt_ListOfPlayers apply {_x select 0}) find _uid;
    _name = (opt_ListOfPlayers select _id) select 1;
	_str = _name;
	_marker = _unit getVariable ["far_unitMarker", ""];

	// erzeuge neuen Marker oder...
	if (_marker == "") then {

		_marker = format ["%1_far_marker", _str];
		_mark = createMarkerLocal [_marker, position _unit];
		_mark setMarkerTextLocal format ["%1 down", _str];
		_mark setMarkerShapeLocal "ICON";
		_markColor = "ColorRed";
		_markType  = "loc_Hospital";

		_mark setMarkerTypeLocal _markType;
		_mark setMarkerColorLocal _markColor;
		_mark setMarkerAlphaLocal 0.7;

		// da auf allen Clíents ausgeführt, hat jeder Client diese Info
		_unit setVariable ["far_unitMarker", _marker];
	} else {
		// versetze alten
		_marker setMarkerPosLocal (position _unit);
		_mark = _marker;
	};

};

_mark