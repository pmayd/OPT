/**
* Author: James
* delete a units marker either local or globally
*
* Arguments:
* 0: <OBJECT> unit whose marker should be deleted

* Return Value:
* None
*
* Example:
* [player] call fnc_clearMarker.sqf;
*
*/
#include "script_component.hpp"

/* PARAMS */
params [
    ["_unit", objNull, [objNull], 1]
];

/* VALIDATION */
if (_unit isEqualTo objNull) exitWith{};

/* CODY BODY */
// delete associated marker globally and reset variable
private _marker = _unit getVariable [QGVAR(unitMarker), ""];

if (hasInterface) then {
    if !(_marker isEqualTo "") then {
        _marker setMarkerTextLocal "";
        deleteMarkerLocal _marker;
    };

    _unit setVariable [QGVAR(unitMarker), nil];
};

// global
if (isServer) then {
    if !(_marker isEqualTo "") then {
        _marker setMarkerText "";
        deleteMarker _marker;
    };

    _unit setVariable [QGVAR(unitMarker), nil, true];
};