/**
* Author: James
* main GPS script, running looped in the background with specified interval
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_updateMarker.sqf;
*
*/
#include "script_component.hpp"

while {true} do {

    if (visibleMap or visibleGPS) then {
        private _listOfPlayers = [];
        private _listOfLeaders = [];
        private _listOfGroupMembers = [];    

        // add all leaders from all groups        
        {
            private _leader = leader _x;

            if ((UNIT_SIDE(_leader)) isEqualTo (PLAYER_SIDE)) then {    
                _listOfLeaders pushBack _leader;

                if (player in units _leader) then {
                    _listOfGroupMembers append (units _x);
                };

            };

        } forEach allGroups;

        // mode 0: only add other group leaders
        if (GVAR(mode) == 0) then {
            _listOfPlayers append _listOfLeaders;
        };

        // mode 1: mode 0 + add all group units for leaders
        if (GVAR(mode) == 1) then {
            _listOfPlayers append _listOfGroupMembers;
        };

        // mode 2: mode 1 + all other units   
        if (GVAR(mode) == 2) then {
            _listOfPlayers append (allPlayers select {(UNIT_SIDE(_x)) isEqualTo (PLAYER_SIDE)});
        };

        // create or update player marker
        private _marker = [] call FUNC(createPlayerMarker);
        _marker setMarkerPosLocal (getPosATLVisual (vehicle player));        

        {
            [_x] call FUNC(processUnitMarker);
        } forEach _listOfPlayers;

    };

    sleep GVAR(updateInterval);
};
