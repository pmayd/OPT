//create a group of given side
//parameters:
//side (string or side logic)
//example: _grp = [east] call tcb_fnc_createGroup;
private ["_grp","_side","_side_side"];
_side = _this select 0;
if (typeName _side == "STRING") then {
	_side_side = switch (toUpper _side) do {
		case "EAST" : {east};
		case "WEST" : {west};
		case "CIVILIAN" : {civilian};
		default {};
	};
};
if (typeName _side_side != "GROUP") exitWith {
	["ERROR: Cant create group. Wrong Data Format - given side: %1 (fn_createGroup.sqf)",_side] call BIS_fnc_logFormat;
	Nil
};
_grp = createGroup _side_side;
_grp