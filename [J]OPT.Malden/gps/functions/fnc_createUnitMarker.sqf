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

if (_marker isEqualTo "") then {
    private _name = UNIT_NAME(_unit);

    _marker = createMarkerLocal [format["%1_%2_%3", QGVAR(unitGPSMarker), _name, time], [0,0]];
    _marker setMarkerTypeLocal MARKER_SYMBOL;
    _marker setMarkerSizeLocal MARKER_SIZE;
    _marker setMarkerAlphaLocal MARKER_ALPHA;
    
    if (_side == west) then {        
        _marker setMarkerColorLocal "ColorBLUFOR";
    };    
    if (_side == east) then {        
        _marker setMarkerColorLocal "ColorOPFOR";
    };
    
    _unit setVariable [QGVAR(unitGPSMarker), _marker];
};

_marker
