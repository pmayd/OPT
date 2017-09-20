if (missionStarted) exitWith {hint "Mission bereits gestartet."};

openMap [true, false];

// create local marker for each flag pole
private _flagMarker = [];
{
    if (_x getVariable "opt_flag") then {
        _markerName = format["marker_%1_%2", _x, _forEachIndex];
        _marker = createMarkerLocal [_markerName, getPos _x];
        _marker setMarkerTypeLocal "hd_objective";
        _flagMarker pushBack _marker;

        switch (playerSide) do {
            case west: {

                if (_x in opt_csat_flags) then {
                    _markerName = format["marker_active_flag"];
                    _marker = createMarkerLocal [_markerName, getPos _x];
                    _marker setMarkerTypeLocal "selector_selectedMission";
                    _marker setMarkerSizeLocal [2,2];
                    _marker setMarkerColorLocal "ColorBLUFOR";
                };
        
            };
            case east: {

                if (_x in opt_nato_flags) then {
                    _markerName = format["marker_active_flag"];
                    _marker = createMarkerLocal [_markerName, getPos _x];
                    _marker setMarkerTypeLocal "selector_selectedMission";
                    _marker setMarkerSizeLocal [2,2];
                    _marker setMarkerColorLocal "ColorOPFOR";
                };
            };
        };
    };

} forEach allMissionObjects "FlagPole_F";

// add EH for mouse action
/* _this ([<units>,<pos>,<alt>,<shift>]) and in special variables _units, _pos, _alt, _shift */
["sectorMap", "onMapSingleClick", {
    _flag = nearestObjects [_pos, ["FlagPole_F"], 15];

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