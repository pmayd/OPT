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

private _marker = player getVariable [QGVAR(playerGPSMarker), ""];

if (_marker isEqualTo "") then {
    _marker = [
        format["%1_%2_%3", QGVAR(playerGPSMarker), profileName, time],
        [0,0],
        MARKER_PLAYER_SYMBOL,
        "",
        MARKER_SIZE,
        "ICON",
        MARKER_PLAYER_COLOR,
        "Solid",
        MARKER_ALPHA
    ] call EFUNC(common,createMarker);

    player setVariable [QGVAR(playerGPSMarker), _marker];
};

_marker
