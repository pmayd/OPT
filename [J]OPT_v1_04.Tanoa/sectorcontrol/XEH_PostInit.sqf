#define EXCLUDE_CBA_MACROS
#include "script_component.hpp"

/*
    this line is commented, otherwise it would disturb the linter.
["LandVehicle", "init", FUNC(onInit), nil, nil, true] call CBA_fnc_addClassEventHandler;
*/

GVAR(EH_PreloadFinished) = addMissionEventHandler ["PreloadFinished",  {
    /*  	
        Executes assigned code after the mission preload screen. Stackable version of onPreloadFinished. 
    */
    
    if (isServer) then {
        [] call FUNC(postInit);
    };

    if (local player) then {
        [] call FUNC(initPlayerEH); // lädt alle EH 
        [] call FUNC(addFlagMenu); // gibt HL und PL neuen Menüeintrag für Flaggenwahl
    };

}];
