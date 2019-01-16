/**
* Description:
* client GPS. Select all units of player side that are going to be marked by gps
* GPS differentiates between cinscious and unconscious units
*
* Author:
* [GNC]Lord-MDB & James
*
* Arguments:
* None
*
* Return Value:
* 0: [<ARRAY>, <ARRAY>] 2d array of units to mark and units unconscious
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
// add all unconscious units of player side to the GPS
private _unconsciousUnits = allPlayers select
{
    (UNIT_SIDE(_x)) isEqualTo (PLAYER_SIDE) and
    (_x getVariable ["FAR_isUnconscious", 0]) == 1
};

private _unitsToMark = [];
private _leaderUnits = (allGroups select {(UNIT_SIDE(leader _x)) isEqualTo (PLAYER_SIDE)}) apply {leader _x};
private _groupUnits = units group player;

switch (GVAR(mode)) do
{
    case 0:
    {
        if ((leader group player) isEqualTo (leader player)) then
        {
            _unitsToMark append _leaderUnits;
            _unitsToMark append (_groupUnits - _leaderUnits);
        }
        else
        {
            _unitsToMark append _leaderUnits;
        };

    };

    case 1:
    {
        _unitsToMark append _leaderUnits;
        _unitsToMark append (_groupUnits - [leader player]);
    };

    case 2:
    {
        _unitsToMark = allUnits select {(UNIT_SIDE(_x)) isEqualTo (PLAYER_SIDE)}; // Drohnen für HL sichtbar machen

    };
};

[_unitsToMark, _unconsciousUnits]