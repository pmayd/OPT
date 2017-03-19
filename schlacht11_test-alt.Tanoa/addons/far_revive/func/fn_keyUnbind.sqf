// by psycho
// unbind some key functions while the player is unconcious (caused by stupid 3.0)
private ["_key","_return"];
_key = _this select 1;
_return = false;

{
	if ((player getVariable ['FAR_isUnconscious',0] == 1) && {_key in (actionkeys _x)}) then {
		_return = (_key == (actionkeys _x) select 0);
		["<t size='0.8' shadow='1' color='#ffffff'>Chat deaktiviert.</t>", (safeZoneX - 0.2), (safeZoneY + 0.3), 3, 1, 0, 1] spawn BIS_fnc_dynamicText;
	};
} forEach ['Chat'];


_return