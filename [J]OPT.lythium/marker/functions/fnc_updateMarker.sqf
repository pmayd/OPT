/**
* Author: James
* update marker with current time stemp
*
* Arguments:
* 0: <MARKER> marker to update
*
* Return Value:
* None
*
* Example:
* [marker] call fnc_updateMarker.sqf;
*
*/
#include "script_component.hpp"

params ["_marker"];

/*	[_marker],                  0
    markerpos _marker,          1
    markersize _marker,         2
    markercolor _marker,        3
    markertype _marker,         4
    markerbrush _marker,        5
    markershape _marker,        6
    markeralpha _marker,        7
    markertext _marker          8
*/
if (markerShape _marker != "ICON") exitWith{};

//  [year, month, day, hour, minute, second]
// realtime
private _hour = missionStart select 3;
private _minute = missionStart select 4;

private _minuteTxt = "";
private _hourTxt = "";

// ingame time
if (!GVAR(useRealTime)) then {
    _hour = date select 3;
    _minute = date select 4;

    _minuteTxt = str(_minute);
    _hourTxt = str(_hour);

} else {

    private _time = time; // time since mission start
    private _hoursToAdd = floor (_time / 3600);
    private _minutesToAdd = floor ((_time - _hoursToAdd * 3600) / 60);

    // check for overflow
    if (_minute + _minutesToAdd > 59) then {
        _minuteTxt = str((_minute + _minutesToAdd) % 60);
        _hourTxt = str(_hour + _hoursToAdd + 1);
    } else {
        _minuteTxt = str(_minute + _minutesToAdd);
        _hourTxt = str(_hour + _hoursToAdd);
    };
};


// add leading "0"
if (count _hourTxt < 2) then {
    _hourTxt = "0" + _hourTxt;
};
if (count _minuteTxt < 2) then {
    _minuteTxt = "0" + _minuteTxt;
};

if (GVAR(customMarkerTxt) isEqualTo "") then {
    _marker setMarkerTextLocal format["%1 (%2:%3)", markerText _marker, _hourTxt, _minuteTxt];
} else {
    _marker setMarkerTextLocal format["%1 (%2:%3)", markerText _marker select [0, (markerText _marker) find GVAR(customMarkerTxt)], _hourTxt, _minuteTxt];
};


true