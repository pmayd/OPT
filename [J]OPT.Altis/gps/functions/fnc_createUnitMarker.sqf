/**
* Description:
* client GPS. Create special local unit marker
* 
* Author: 
* [GNC]Lord-MDB & James
*
* Arguments:
* 0: <SIDE> player side
* 1: <NUMBER> marker no.
*
* Return Value:
* 0: <MARKER> player marker
*
* Server only:
* no
*
* Public:
* no
*
* Global:
* no
*
* Sideeffects:
* create local marker
* 
* Example:
* [] call EFUNC(gps,createUnitMarker);
*
*/
#include "script_component.hpp"

/* PARAMS */
params [
    ["_playerSide", sideUnknown, [sideUnknown], 1],
    ["_markerNo", -1, [0], 1]
];

/* VALIDATION */
if (_playerSide isEqualTo sideUnknown or _markerNo isEqualTo -1) exitWith {};

/* CODE */
private _marker = '';
switch (_playerSide) do {
    case west: { 
        _marker = createMarkerLocal [format["%1_W%2", QGVAR(unit_marker), _markerNo], [0,0]];
        _marker setMarkerColorLocal "ColorBLUFOR";
    };
    case east: { 
        _marker = createMarkerLocal [format["%1_E%2", QGVAR(unit_marker), _markerNo], [0,0]];
        _marker setMarkerColorLocal "ColorOPFOR";
    };
    default { };
};

_marker setMarkerTypeLocal "mil_triangle";
_marker setMarkerSizeLocal [0.8, 0.8];
_marker setMarkerAlphaLocal 0;

_marker