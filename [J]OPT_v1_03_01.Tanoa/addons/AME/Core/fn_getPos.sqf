/*
	Author: [C-L-F] NetFusion

	Description:
	Faster way than the default getPos command.

	Parameter(s):
	- OBJECT - object to get the position of. 

	Returns:
	- ARRAY - the position in default format [x, y, z]

	Example:
	object call AME_Core_fnc_getPos;
*/

_pos = getPosATL _this;
if (surfaceIsWater _pos) then {
    _pos  = getPosASL _this;
};
_pos