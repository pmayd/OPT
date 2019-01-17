/**
* Author: James
* find near medics
*
* Arguments:
* None
*
* Return Value:
* 0: <STRING> message for player
*
* Example:
* [] call fnc_checkForNearbyMedics.sqf;
*
*/
#include "script_component.hpp"

private _dist = FAR_REVIVE_NEARBY_MEDIC_DISTANCE;
private _nearbyUnits = nearestObjects [getpos player, ["CAManBase"], _dist] - [player];
private _hintMsg = "";

// Find nearby friendly medics
private _medics = _nearbyUnits select {[_x] call FUNC(isFriendlyMedic)};

// Sort medics by distance
if (count _medics > 0) then
{
    // sort medics by distance to player
    _medics = _medics apply {[player distance _x, _x]};
    _medics sort true; // ASC

    _dist = _medics select 0 select 0;
    private _san = _medics select 0 select 1;
    private _unitName = UNIT_NAME(_san);
    _hintMsg = format["Sanitäter %1 ist %2m entfernt.", _unitName, floor _dist];

} else
{
    _hintMsg = "Kein Sanitäter in der Nähe.";
};

_hintMsg