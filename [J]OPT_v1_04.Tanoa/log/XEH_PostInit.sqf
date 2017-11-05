#include "script_component.hpp"

/*
    this line is commented, otherwise it would disturb the linter.
["LandVehicle", "init", FUNC(onInit), nil, nil, true] call CBA_fnc_addClassEventHandler;
*/

[] call FUNC(initCBAEvents);

// add player to listofplayers on server
if (local player) then {
    // add player to listofplayers on server
    [QGVAR(updatePlayerList), [getPlayerUID player, profileName, playerSide]] call CBA_fnc_serverEvent;
};
