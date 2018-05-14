#include "script_component.hpp"

openMap [true, false];

 // instructions for player
_txt = "Alle möglichen Angriffsflaggen sind mit einem schwarzen Kreis markiert.";
[QEGVAR(gui,message), ["Instruktionen", _txt, "blue"]] call CBA_fnc_localEvent;
_txt = "Die gewählte Flagge wird je nach Seite blau oder rot hervorgehoben.<br/>Es kann beliebig oft neu gewählt werden.<br/>";
[QEGVAR(gui,message), ["Instruktionen", _txt, "blue"]] call CBA_fnc_localEvent;

// create local marker for each flag pole
private _flagMarker = [];
{
    // skip all flags that are not opt flags
    if !(_x getVariable ["opt_flag", false]) exitWith {};

    // only show attack flags
    switch (PLAYER_SIDE) do {
        case west: {
            if (_x getVariable ["owner", sideUnknown] == east) then {
                _markerName = format["marker_attackNATO_%1", _forEachIndex];
                _marker = createMarkerLocal [_markerName, getPos _x];
                _marker setMarkerTypeLocal "hd_objective";
                _flagMarker pushBack _marker;
            };

            if (_x in GVARMAIN(csat_flags)) then {
                _markerName = format["marker_active_flag"];
                _marker = createMarkerLocal [_markerName, getPos _x];
                _marker setMarkerTypeLocal "selector_selectedMission";
                _marker setMarkerSizeLocal [2,2];
                _marker setMarkerColorLocal "ColorBLUFOR";
            };

        };

        case east: {
            if (_x getVariable ["owner", sideUnknown] == west) then {
                _markerName = format["marker_attackCSAT_%1", _forEachIndex];
                _marker = createMarkerLocal [_markerName, getPos _x];
                _marker setMarkerTypeLocal "hd_objective";
                _flagMarker pushBack _marker;
            };

            if (_x in GVARMAIN(nato_flags)) then {
                _markerName = format["marker_active_flag"];
                _marker = createMarkerLocal [_markerName, getPos _x];
                _marker setMarkerTypeLocal "selector_selectedMission";
                _marker setMarkerSizeLocal [2,2];
                _marker setMarkerColorLocal "ColorOPFOR";
            };

        };
    };
    
} forEach allMissionObjects "FlagPole_F";

// add EH for mouse action
/* _this ([<units>,<pos>,<alt>,<shift>]) and in special variables _units, _pos, _alt, _shift */
["sectorMap", "onMapSingleClick", {
    _flag = nearestObjects [_pos, ["FlagPole_F"], 35];

    if (count _flag > 0) then {
        _flag = _flag select 0;

        deleteMarkerLocal "marker_active_flag";
        
        _markerName = format["marker_active_flag"];
	    _marker = createMarkerLocal [_markerName, getPos _flag];
	    _marker setMarkerTypeLocal "selector_selectedMission";
        _marker setMarkerSizeLocal [2,2];

        switch (PLAYER_SIDE) do {
            case west: {
                _marker setMarkerColorLocal "ColorBLUFOR"; GVARMAIN(csat_flags) = [_flag]; publicVariable QGVARMAIN(csat_flags);
            };
            case east: {
                _marker setMarkerColorLocal "ColorOPFOR"; GVARMAIN(nato_flags) = [_flag]; publicVariable QGVARMAIN(nato_flags);
            };
        };

    };
    
}] call BIS_fnc_addStackedEventHandler;

waitUntil {!visibleMap};
["sectorMap", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;

{
    deleteMarker _x;
} forEach _flagMarker;
deleteMarker "marker_active_flag";