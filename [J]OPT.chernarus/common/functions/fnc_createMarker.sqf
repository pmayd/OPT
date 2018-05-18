/**
* Author: James
* create marker with given params and return it
*
* Arguments:
* 0: <STRING> marker name
* 1: <POSITION> marker position
* 2: <STRING> marker type
* 3: <STRING> marker text
* 4: <ARRAY> marker size
* 5: <STRING> marker shape
* 6: <COLOR> marker color
* 7: <STRING> marker brush
* 8: <NUMBER> marker alpha
* 9: <BOOL> marker global?
*
* Return Value:
* 0: <MARKER> created marker
*
* Example:
* ["mymarker", [0,0,0], "mil_dot", "hierher", [1,1], "", "ColorBlue", "", 1, false] call fnc_createMarker.sqf;
*/
#include "script_component.hpp"

params [
    ["_markerName", "", [""], [1]],                 // 0
    ["_markerPos", [0,0,0], [[]], [2,3]],           // 1
    ["_markerType", "Empty", [""], [1]],            // 2
    ["_markerText", "", [""], [1]],                 // 3
    ["_markerSize", [1,1], [[]], [2]],              // 4
    ["_markerShape", "ICON", [""], [1]],            // 5
    ["_markerColor", "ColorBlack", [""], [1]],      // 6
    ["_markerBrush", "Solid", [""], [1]],           // 7
    ["_markerAlpha", 1, [1], [1]],                  // 8
    ["_markerDir", 0, [1], [1]],                    // 9
    ["_markerIsGlobal", false, [false], [1]]        // 10
];

private _marker = "";

if (_markerName in allMapMarkers) exitWith {_markerName};

if (_markerIsGlobal) then {
    _marker = createMarker [_markerName, _markerPos];
    _marker setMarkerType _markerType;
    _marker setMarkerText _markerText;
    _marker setMarkerSize _markerSize;
    _marker setMarkerShape _markerShape;
    _marker setMarkerColor _markerColor;
    _marker setMarkerBrush _markerBrush;
    _marker setMarkerAlpha _markerAlpha;
    _marker setMarkerDir _markerDir;
} else {
    _marker = createMarkerLocal [_markerName, _markerPos];
    _marker setMarkerTypeLocal _markerType;
    _marker setMarkerTextLocal _markerText;
    _marker setMarkerSizeLocal _markerSize;
    _marker setMarkerShapeLocal _markerShape;
    _marker setMarkerColorLocal _markerColor;
    _marker setMarkerBrushLocal _markerBrush;
    _marker setMarkerAlphaLocal _markerAlpha;
    _marker setMarkerDirLocal _markerDir;
};

_marker