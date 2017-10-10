#include "script_component.hpp"

openMap [true, false];

// create local marker for each flag pole
private _flagMarker = [];
{
    // skip all flags that are not opt flags
    if !(_x getVariable ["opt_flag", false]) exitWith {};
    
    // only show attack flags
    switch (playerSide) do {
        case west: {
            if (_x getVariable ["owner", sideUnknown] == east) then {
                _markerName = format["marker_attackNATO_%1", _forEachIndex];
                _marker = createMarkerLocal [_markerName, getPos _x];
                _marker setMarkerTypeLocal "hd_objective";
                _flagMarker pushBack _marker;
            };

            if (_x in opt_csat_flags) then {
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

            if (_x in opt_nato_flags) then {
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

        switch (playerSide) do {
            case west: {
                _marker setMarkerColorLocal "ColorBLUFOR"; opt_csat_flags = [_flag]; publicVariable "opt_csat_flags";
            };
            case east: {
                _marker setMarkerColorLocal "ColorOPFOR"; opt_nato_flags = [_flag]; publicVariable "opt_nato_flags";
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