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
* Server only:
* no
*
* Public:
* yes
*/
#include "script_component.hpp"

/* PARAMS */
params [
    ["_unit", objNull, [objNull]]
];

/* VALIDATION */
if (_unit isEqualTo objNull) exitWith{diag_log format ["OPT Debug Message: Null Obj player found: %1",str(_unit)]};

/* CODE BODY */
private _marker = _unit getVariable ["far_unitMarker", ""];

if (_marker isEqualTo "") then {
    _marker = format ["FAR_marker_%1", UNIT_NAME(_unit)];
    _index = allMapMarkers find _marker;

    if (_index != -1) then {
        deleteMarkerLocal _marker;
    };
} else {
   if (_unit getVariable ["FAR_isUnconscious", 0] == 0) then {
        deleteMarkerLocal _marker;
        _unit setVariable ["far_unitMarker", nil];
    };
};

true
