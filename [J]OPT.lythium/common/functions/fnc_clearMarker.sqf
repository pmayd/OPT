/**
* Author: James
* delete a units marker either local or globally
*
* Arguments:
* 0: <OBJECT> unit whose marker should be deleted
* 1: <STRING> variable name to be used in getVariable command
* 2: <STRING> marker name to search for in allMapMarkers

* Return Value:
* None
*
* Server only:
* no
* 
* Public:
* yes
*
* Global: 
* no
*
* Example:
* [player, "unitMarker", "marker_player_James"] call EFUNC(common,clearMarker);
*
*/
#include "script_component.hpp"

/* PARAMS */
params [
    ["_unit", objNull, [objNull], 1],
    ["_markerVarName", "", ["s"], 1],
    ["_markerName", "", ["s"], 1]
];

/* VALIDATION */
if (_unit isEqualTo objNull and _markerName isEqualTo "") exitWith{};

/* CODY BODY */
// delete associated marker globally and reset variable
if  !(_unit isEqualTo objNull) then {
    private _marker = _unit getVariable [_markerVarName, ""];

    _marker setMarkerTextLocal "";
    deleteMarkerLocal _marker;

    _unit setVariable [_markerVarName, nil];

} else {
    private _marker = allMapMarkers select {(_x find _markerName) != -1};
    {deleteMarkerLocal _x} count _marker;
    
};

