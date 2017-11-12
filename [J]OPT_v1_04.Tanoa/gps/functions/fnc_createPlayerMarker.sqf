/**
* Author: James
* create and store player marker
*
* Arguments:
* None
*
* Return Value:
* 0: <MARKER> marker name
*
* Example:
* [] call fnc_createPlayerMarker.sqf;
*
*/
#include "script_component.hpp"

private _marker = player getVariable[QGVAR(unitMarker), ""];

if (_marker isEqualTo "") then {
    private _name = [player] call EFUNC(log,getPlayerName);
    _marker = createMarkerLocal [format["%1_%2", QGVAR(unitMarker), _name], [0,0]];
    _marker setMarkerTypeLocal "mil_circle";
    _marker setMarkerColorLocal "ColorBrown";
    _marker setMarkerSizeLocal MARKERSIZE;
    _marker setMarkerAlphaLocal MARKERALPHA;

    player setVariable [QGVAR(unitMarker), _marker];
};

_marker