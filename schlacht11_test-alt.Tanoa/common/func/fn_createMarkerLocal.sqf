// create a local marker, returns created marker
// parameters: marker name, marker pos, marker shape, marker color, marker size;(optional) marker text, marker dir, marker type, marker brush
// example: ["my marker",  position player, "Dot", "ColorBlue", [0.5,0.5]] call tcb_fnc_CreateMarkerLocal;
private ["_m_name","_m_pos","_m_shape","_m_col","_m_size","_m_text","_m_dir","_m_type","_m_brush","_m_alpha"];

_m_name = _this select 0;
_m_pos = _this select 1;
_m_shape = _this select 2;
_m_col = _this select 3;
_m_size = _this select 4;
_m_text = (if (count _this > 5) then {_this select 5} else {""});
_m_dir = (if (count _this > 6) then {_this select 6} else {-888888});
_m_type = (if (count _this > 7) then {_this select 7} else {""});
_m_brush = (if (count _this > 8) then {_this select 8} else {""});
_m_alpha = (if (count _this > 9) then {_this select 9} else {0});
	
_marker = createMarkerLocal [_m_name, _m_pos];
if (_m_shape != "") then {_marker setMarkerShapeLocal _m_shape};
if (_m_col != "") then {_marker setMarkerColorLocal _m_col};
if (count _m_size > 0) then {_marker setMarkerSizeLocal _m_size};
if (_m_text != "") then {_marker setMarkerTextLocal _m_text};
if (_m_dir != -888888) then {_marker setMarkerDirLocal _m_dir};
if (_m_type != "") then {_marker setMarkerTypeLocal _m_type};
if (_m_brush != "") then {_marker setMarkerBrushLocal _m_brush};
if (_m_alpha != 0) then {_marker setMarkerAlphaLocal _m_alpha};

_marker
