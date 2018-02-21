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
if !(_marker in allMapMarkers) exitWith{};
if (markerShape _marer != "ICON") exitWith{};

//  [year, month, day, hour, minute, second]
private _hour = missionStart select 3;
private _minute = missionStart select 4;
private _time = time; // time since mission start
private _hoursToAdd = floor (_time / 3600);
private _minutesToAdd = floor ((_time - _hoursToAdd * 3600) / 60);

_marker setMarkerTextLocal format["%1 (%2:%3)", markerText _marker, _hour + _hoursToAdd, _minute + _minutesToAdd];

true