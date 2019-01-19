/**
* Author: James
* store client fps in handsHit
*
* Arguments:
* 0: <STRING> unit name
* 1: <NUMBER> avg fps 
* 2: <NUMBER> min fps
* 
* Return Value:
* None
*
* Example:
* ["James", 60, 30] call fnc_storeFPS.sqf;
*
* Server only:
* yes
* 
* Public:
* yes
*/
#include "script_component.hpp"

/* PARAMS */
params [
   ["_unitName", "", [""], 1],
   ["_fpsAvg", 0, [0], 1],
   ["_fpsMin", 0, [0], 1]
];

/* VALIDATION */
if (_unitName isEqualTo "") exitWith{};

// either update existing hash entry or create new one
if (HASH_HASKEY(GVAR(fpsHash),_unitName)) then {
    private _val = HASH_GET(GVAR(fpsHash),_unitName);

    // add fps entry
    _val params ["_unitFps", "_unitFpsMin"];
    _unitFps pushBack (round _fpsAvg); // works imemdiately, need no HASH_SET
    _unitFpsMin pushBack (round _fpsMin);

} else {
    private _startVal = [[round _fpsAvg],[round _fpsMin]];
    HASH_SET(GVAR(fpsHash),_unitName,_startVal);

};