#include "script_component.hpp"

[] call FUNC(initCBAEvents);
[] call FUNC(briefing); // fügt Briefing und Tagebuch hinzu

if (isServer) then {
    [] call FUNC(initServerMissionEH);

    //Function that adds dynamic groups to the mission as seen in End Game
    ["Initialize"] call BIS_fnc_dynamicGroups;
};

// executed after briefing right to mission start
GVAR(EH_PreloadFinished) = addMissionEventHandler ["PreloadFinished",  {
    /*  	
        Executes assigned code after the mission preload screen. Stackable version of onPreloadFinished. 
    */

    [] call FUNC(initPlayerEH);
    [] call FUNC(postInit); // führt alle wichtigen Skripte aus
}];