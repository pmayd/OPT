/**
* Author: James
* process all vehicles after mission ends and store relevant vehicle data in hash
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call opt_persistence_fnc_processVehicles.sqf;
*
* Server only:
* yes
*
* Public:
* no
*/
#include "script_component.hpp"

/* PARAMS */

/* VALIDATION */
if (!GVAR(optionVehicles)) exitWith{};

/* CODE BODY */
private _vehicles = (allMissionObjects "LandVehicle") + (allMissionObjects "Air"); // base class for all vehicles, either land or air, only "All" is higher
private _vehicleStorage = [];
private _newData = [];
if (HASH_HASKEY(GVAR(hash), HASH_KEY_VEHICLES)) then {
    _newData = HASH_GET(GVAR(hash), HASH_KEY_VEHICLES);
};

{
    // only consider vehicles outside base
    if (_x distance (getMarkerPos "respawn_west") > GVAR(baseRadius) and _x distance2D (getMarkerPos "respawn_east") > GVAR(baseRadius)) then {

        // only consider not loaded vehicle
        // TODO: this is not correct, as loaded vehicle can have their own inventory etc. so instead of ignoring, spawn them and put them inside the outer vehicle
        // new vehicles are detected via position check
        if ((isVehicleCargo _x) isEqualTo objNull and !([_x, _newData] call FUNC(isDoubleEntry))) then {
            // store data
            _vehicleStorage pushBack ([_x] call FUNC(getVehicleData));

        };

    };
} forEach _vehicles;

// save hash
if !(_newData isEqualTo []) then {
    {
        // Current result is saved in variable _x
        _newData pushBack _x;
    } forEach _vehicleStorage;

} else {
    // just store the whole data 
    _newData = _vehicleStorage;
};

HASH_SET(GVAR(hash), HASH_KEY_VEHICLES, _newData);