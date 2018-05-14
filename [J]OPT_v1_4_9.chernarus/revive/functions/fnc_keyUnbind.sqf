/**
* Author: Psycho 
* unbind some key functions while the player is unconcious (caused by stupid 3.0)
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_keyUnbind.sqf;
*
*/
#include "script_component.hpp"

private ["_key","_return"];
_key = _this select 1;
_return = false;

{
	if ((player getVariable ['FAR_isUnconscious',0] == 1) && {_key in (actionkeys _x)}) then {
		_return = (_key == (actionkeys _x) select 0);
		[QEGVAR(gui,message), ["San-System", "Chat deaktiviert", "red"]] call CBA_fnc_localEvent;
	};
} forEach ['Chat'];


_return