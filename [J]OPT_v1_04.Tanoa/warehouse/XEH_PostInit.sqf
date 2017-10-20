#include "script_component.hpp"

/*
    this line is commented, otherwise it would disturb the linter.
["LandVehicle", "init", FUNC(onInit), nil, nil, true] call CBA_fnc_addClassEventHandler;
*/

if (isServer) then {
    {
        _x addEventHandler ["killed", {
            (_this select [0,2]) call FUNC(handleDeadVehicle);
        }];
    } forEach vehicles;
};