/**
* Author: James
* create and store unit marker
*
* Arguments:
* 0: <Object> unit
*
* Return Value:
* 0: <MARKER_> marker name
*
* Server only:
* no
*
* Public:
* yes
*
* Example:
* [unit] call fnc_createUnitMarker.sqf;
*
*/
#include "script_component.hpp"

params [
    ["_unit", objNull, [objNull], 1]
];

if (_unit isEqualTo objNull) exitWith {""};

private _marker = _unit getVariable [QGVAR(unitGPSMarker), ""];
private _side = UNIT_SIDE(_unit);
private _name = UNIT_NAME(_unit);

if (_marker isEqualTo "") then {
    private _color = "";
    if (_side == west) then {        
        _color = "ColorBLUFOR";
    };    
    if (_side == east) then {        
        _color = "ColorOPFOR";
    };

    _marker = [
        format["%1_%2_%3", QGVAR(unitGPSMarker), _name, time],
        [0,0],
        MARKER_SYMBOL,
        "",
        MARKER_SIZE,
        "ICON",
        _color,
        "Solid",
        MARKER_ALPHA
    ] call EFUNC(common,createMarker);

    _unit setVariable [QGVAR(unitGPSMarker), _marker];
};

_marker
