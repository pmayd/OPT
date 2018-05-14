/**
* Author: James
* clear a marker of a disconnected player
*
* Arguments:
* 0: <STRING> name of disconnected unit

* Return Value:
* None
*
* Example:
* [player] call fnc_clearMarker.sqf;
*
*/
#include "script_component.hpp"
params [
    ["_name", "", ["s"], 1]
];

// search for all markers with unit name in it and delete them globally
{
    if (_x find _name != -1) then {
        deleteMarkerLocal _x;
    };

} forEach allMapMarkers;