/**
* Author: James
* create and store unit marker
*
* Arguments:
* 0: <Object> unit
*
* Return Value:
* 0: <MARKER> marker name
*
* Example:
* [unit] call fnc_createPlayerMarker.sqf;
*
*/
#include "script_component.hpp"

params [
    ["_unit", objNull, [objNull], 1]
];
private _marker = _unit getVariable[QGVAR(unitMarker), ""];
private _side = _unit getVariable [QGVARMAIN(playerSide), sideUnknown];

if (_unit isEqualTo objNull) exitWith {""};

if (_marker isEqualTo "") then {
    private _name = [_unit] call EFUNC(log,getPlayerName);

    if (_side == west) then {
        _marker = createMarkerLocal [format["%1_%2", QGVAR(unitMarker), _name], [0,0]];
        _marker setMarkerTypeLocal MARKERSYMBOL;
        _marker setMarkerColorLocal "ColorBLUFOR";
        _marker setMarkerSizeLocal MARKERSIZE;
        _marker setMarkerAlphaLocal MARKERALPHA;
    } else {
        _marker = createMarkerLocal [format["%1_%2", QGVAR(unitMarker), _name], [0,0]];
        _marker setMarkerTypeLocal MARKERSYMBOL;
        _marker setMarkerColorLocal "ColorOPFOR";
        _marker setMarkerSizeLocal MARKERSIZE;
        _marker setMarkerAlphaLocal MARKERALPHA;
    };
    
    _unit setVariable [QGVAR(unitMarker), _marker];
};

_marker