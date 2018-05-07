/**
* Author: James
* delete all vehicles around the nearest spawnpad
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_deleteVehicle.sqf;
*
*/
#include "script_component.hpp"

// alle Objekte im Radius von GVAR(saleRadius) Metern um das Pad -> im Idealfall nur das zu verkaufende Fahrzeug
_spawnpos = nearestObject [player, "Land_HelipadCircle_F"];
_objs = nearestObjects [_spawnpos, ["AllVehicles", "Thing"], GVAR(orderSpawnRadius)];

// now delete
{
    // Current result is saved in variable _x
    if (toLower (typeOf _x) in (GVAR(orderDialogObjects) apply {toLower (_x select 0)}) and ({isPlayer (_x select 0)} count (fullCrew _x)) == 0) then {
        deleteVehicle _x;
    };

} forEach _objs;