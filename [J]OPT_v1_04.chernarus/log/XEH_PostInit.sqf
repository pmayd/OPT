#include "script_component.hpp"

/*
    this line is commented, otherwise it would disturb the linter.
["LandVehicle", "init", FUNC(onInit), nil, nil, true] call CBA_fnc_addClassEventHandler;
*/

if (isServer) then {
    [] call FUNC(initCBAClassEvents);
};


if (hasInterface) then {
    [QGVAR(updatePlayerList), [getPlayerUID player, profileName, playerSide]] call CBA_fnc_serverEvent; 
};
