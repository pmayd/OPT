#include "script_component.hpp"

/*
    this line is commented, otherwise it would disturb the linter.
["LandVehicle", "init", FUNC(onInit), nil, nil, true] call CBA_fnc_addClassEventHandler;
*/

GVAR(EH_PreloadFinished) = addMissionEventHandler ["preloadFinished", {
    // öffnet das HUD initial für alle Spieler
    [] call FUNC(initPlayerEH);

}];