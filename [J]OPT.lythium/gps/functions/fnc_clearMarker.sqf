/**
* Author: James
* delete a units marker either local or globally
*
* Arguments:
* 0: <OBJECT> unit whose marker should be deleted

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
* [player, ""] call fnc_clearMarker.sqf;
*
*/
#include "script_component.hpp"

/* PARAMS */
params [
    ["_unit", objNull, [objNull], 1],
    ["_name", "", ["s"], 1]
];

/* VALIDATION */
if (_unit isEqualTo objNull and _name isEqualTo "") exitWith{};

/* CODY BODY */
// delete associated marker globally and reset variable
if  !(_unit isEqualTo objNull) then {
    private _marker = _unit getVariable [QGVAR(unitGPSMarker), ""];

    _marker setMarkerTextLocal "";
    deleteMarkerLocal _marker;

    _unit setVariable [QGVAR(unitGPSMarker), nil];

} else {
    private _marker = allMapMarkers select {(_x find format["%1_%2", QGVAR(unitGPSMarker), _name]) != -1};
    {deleteMarkerLocal _x} count _marker;
    
};

