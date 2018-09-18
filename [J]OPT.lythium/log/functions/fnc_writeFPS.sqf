/**
* Author: James
* log FPS for each player/client that has been connected since the beginning
* log the whole fps array as well as average single fps
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_writeFPS.sqf;
*
* Server only:
* yes
*
* Public:
* yes
*/
#include "script_component.hpp"

/* VALIDATION */

/* CODE BODY */

 private _cat = "FPS";
private _keys = HASH_GETKEYS(GVAR(fpsHash));
{   
    private _key = _x;
    private _val = HASH_GET(GVAR(fpsHash),_key);

    _val params ["_unitFps", "_unitFpsMin"];

    private _message = format["Avg. FPS for %1: %2", _key, _unitFps];
    [_cat, _message] call FUNC(write);

    private _message = format["Min. FPS for %1: %2", _key, _unitFpsMin];
    [_cat, _message] call FUNC(write);

    private _sum = 0;
    {
        _sum = _sum + _x;
    } forEach _unitFps;
    private _mean = _sum / (count _unitFps);

    private _message = format["Single avg. FPS for %1: %2", _key, _mean];
    [_cat, _message] call FUNC(write);

    private _sum = 0;
    {
        _sum = _sum + _x;
    } forEach _unitFpsMin;
    private _mean = _sum / (count _unitFpsMin);

    private _message = format["Single min. FPS for %1: %2", _key, _mean];
    [_cat, _message] call FUNC(write);

} forEach _keys;