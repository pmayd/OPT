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

private _marker = player getVariable [QGVAR(playerMarker), ""];

if (_marker isEqualTo "") then {
    private _name = profileName;
    _marker = createMarkerLocal [format["%1_%2_%3", QGVAR(playerMarker), _name, time], [0,0]];
    _marker setMarkerTypeLocal MARKER_PLAYER_SYMBOL;
    _marker setMarkerColorLocal MARKER_PLAYER_COLOR;
    _marker setMarkerSizeLocal MARKER_SIZE;
    _marker setMarkerAlphaLocal MARKER_ALPHA;

    player setVariable [QGVAR(playerMarker), _marker];
};

_marker