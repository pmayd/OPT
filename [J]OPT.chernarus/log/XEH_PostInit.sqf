#include "script_component.hpp"

/*
    this line is commented, otherwise it would disturb the linter.
["LandVehicle", "init", FUNC(onInit), nil, nil, true] call CBA_fnc_addClassEventHandler;
*/

if (isServer) then {
    [] call FUNC(initCBAClassEvents);

    // init fps hash
    GVAR(fpsHash) = HASHCREATE;
};


if (hasInterface) then {
    [QGVAR(updatePlayerList), [getPlayerUID player, profileName, playerSide]] call CBA_fnc_serverEvent; 

    [] spawn FUNC(logFPS);
};
