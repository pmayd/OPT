/**
* Author: James
* remove unit down marker set by FAR 
*
* Arguments:
* 0: <OBJECT> unit
*
* Return Value:
* None
*
* Example:
* [player] call fnc_removeMarker.sqf;
*
*/
#include "script_component.hpp"

params [
	["_unit", objNull, [objNull]]
];

if (isNull _unit) then {
	diag_log format ["OPT Debug Message: Null Obj player found: %1",str(_unit)];
};

_marker = _unit getVariable ["far_unitMarker", Nil];

if (!isNil "_marker") then {
	if (_unit getVariable ["FAR_isUnconscious", 0] == 0) then {
		deleteMarkerLocal _marker;
		_unit setVariable ["far_unitMarker", nil];
	};
};

true