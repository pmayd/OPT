//	fn_iconDrawMap

private ["_v","_iconType","_color","_pos","_iconSize","_dir","_text","_shadow","_textSize","_textFont","_textOffset","_units"];

if (!isNil "opt_hqObj") then {
	if (alive opt_hqObj && {!isNull opt_hqObj}) then {
		_shadow = 1;
		_textSize = 0.05;
		_textFont = 'puristaMedium';
		_textOffset = 'right';
		
		{
			_v = vehicle _x;
			if ((side _v == playerSide) || {(captive _x)} || {(player isKindOf "OPT_Maintainer")}) then {
				_iconType = [_v] call opt_fnc_iconType;
				_color = [_x] call opt_fnc_iconColor;
				_pos = getPosASL _v;		
				_iconSize = [_v] call opt_fnc_iconSize;	
				_dir = getDir _v;		
				_text = [_v] call opt_fnc_iconText;

				if (_x == crew _v select 0 || {(_x in allUnitsUav)}) then {	
					_this select 0 drawIcon [
						_iconType,
						_color,
						_pos,
						_iconSize,
						_iconSize,
						_dir,
						_text,
						_shadow,
						_textSize,
						_textFont,
						_textOffset
					]
				};
			};
		} count (allUnits + allUnitsUav);
	};
};