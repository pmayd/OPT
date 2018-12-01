/**
* Description:
* create down marker for ith unit. Will be updated via gps routine
*
* Author:
* James
*
* Arguments:
* 0: <NUMBER> number of marker
*
* Return Value:
* <MARKER> created marker name
*
* Server only:
* no
*
* Public:
* no - will be called by GPS script
*
* Global:
* no
*
* Sideeffects:
* yes - create local marker for down units
*
* Example:
* [1] call EFUNC(gps,createDownMarker);
*/
#include "script_component.hpp"

/* PARAMS */
params [
   ["_markerNo", -1, [0], 1]
];

/* VALIDATION */
if (_markerNo isEqualTo -1) exitWith {};

/* CODE BODY */
private _marker = createMarkerLocal [format["%1_%2", QGVAR(unit_marker_down), _markerNo], [0,0]];
_marker setMarkerShapeLocal "ICON";
_marker setMarkerTypeLocal FAR_REVIVE_MARKER_TYPE;
_marker setMarkerColorLocal FAR_REVIVE_MARKER_COLOR;
_marker setMarkerAlphaLocal 1;
	
_marker
