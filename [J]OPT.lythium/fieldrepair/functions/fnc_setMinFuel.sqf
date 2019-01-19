/**
* Author: James
* set fuel for a vehicle to at least 10%
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [vehicle] call fnc_setMinFuel.sqf;
*
*/
#include "script_component.hpp"


params ["_vec"];

if (fuel _vec < 0.1) then {
    [_vec, 0.1] remoteExecCall ["setFuel", _vec, false];
};

true