/**
* Author: James
* create marker for mhq
*
* Arguments:
* 0: <OBJECT> mhq vehicle
* 1: <SIDE> vehicle's side
* 2: <STRING> marker text
*
* Return Value:
* None
*
* Example:
* [vehicle, "HQ"] call fnc_drawMarker.sqf;
*
*/
#include "script_component.hpp"

/* PARAMS */
params [
    ["_vec", objNull, [objNull], 1],
    ["_side", sideUnknown, [sideUnknown], 1],
    ["_text", "", ["s"], 1]
];

/* CODE BODY */
terminate (_vec getVariable [QGVAR(drawMarkerHandle), scriptNull]);

// determine color and icon dependent on player side
private _color = nil;
private _icon = nil;
switch _side do {
    case west: {
        _color = "ColorWEST";
        _icon = "b_hq";
    };
    case east: {
        _color = "ColorEAST";
        _icon = "o_hq";
    };
    case resistance: {
        _color = "ColorGUER";
        _icon = "n_hq";
    };
    default {
        _color = "ColorUNKNOWN";
        _icon = "n_hq";
    };
};

// create marker name and store it
private _markerName = _vec getVariable [QGVAR(markerName), ""];
if (_markerName isEqualTo "") then {
   _markerName = format ["CHHQ_%1", [str _vec] call BIS_fnc_filterString];
   _vec setVariable [QGVAR(markerName), _markerName];
};

// position marker
if (getMarkerPos _markerName isEqualTo [0,0,0]) then {
    createMarkerLocal [_markerName, getPos _vec];
} else {
    _markerName setMarkerPosLocal (getPos _vec);
};

// set icon, type and color
_markerName setMarkerShapeLocal "ICON";
_markerName setMarkerTypeLocal _icon;
//_markerName setMarkerSizeLocal [0.7,0.7];
_markerName setMarkerColorLocal _color;

// start script in background
private _handle = [_vec, _markerName, _text] spawn {
    params ["_vec", "_markerName", "_text"];

    private _markerTxt = "";
    while {alive _vec} do {
        _markerTxt = if (count GVAR(HQarray) > 1) then {
            format ["%1-%2", _text, _vec getVariable [QGVAR(HQIndex), -1]]
        } else {
            _text;
        };

        _markerName setMarkerTextLocal _markerTxt;
        _markerName setMarkerPosLocal (getPos _vec);

        sleep 1;
    };

    deleteMarkerLocal _markerName;
};
_vec setVariable [QGVAR(drawMarkerHandle), _handle];