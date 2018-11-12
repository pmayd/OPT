/**
* Description:
* client GPS. Select all units of player side that are going to be marked by gps
* 
* Author: 
* [GNC]Lord-MDB & James
*
* Arguments:
* None
*
* Return Value:
* 0: <ARRAY> list of units to mark
*
* Server only:
* no
*
* Public:
* no
*
* Global:
* no
*
* Sideeffects:
* no
* 
* Example:
* [] call EFUNC(gps,selectUnits);
*
*/
#include "script_component.hpp"

/* PARAMS */

/* VALIDATION */

/* CODE BODY */
private _unitsToMark = [];

private _leaderUnits = [];    
{
    if (side (leader _x) == PLAYER_SIDE) then {    
        _leaderUnits pushBack (leader _x);

    };                        
} forEach allGroups;

private _groupUnits = units group player;

switch (GVAR(mode)) do {
    case 0: {
        if (leader group player == leader player) then {
            _unitsToMark append _leaderUnits;
            _unitsToMark append _groupUnits;   

        } else {                        
            _unitsToMark append _leaderUnits;

        };

    };

    case 1: {
        _unitsToMark append _leaderUnits;
        _unitsToMark append _groupUnits;  

    };

    case 2: {
        {
            if (side _x == PLAYER_SIDE) then {
                _unitsToMark pushBack _x;

            };
        } foreach allUnits;    // Drohnen für HL sichtbar machen

    };
};

_unitsToMark