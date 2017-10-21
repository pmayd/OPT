#include "script_component.hpp"

[] call FUNC(briefing); // fügt Briefing und Tagebuch hinzu

GVAR(EH_PreloadFinished) = addMissionEventHandler ["PreloadFinished",  {
    /*  	
        Executes assigned code after the mission preload screen. Stackable version of onPreloadFinished. 
    */
    if (local player) then {
        [] call FUNC(postInit); // führt alle wichtigen Skripte aus
        [] call FUNC(initPlayerEH); // lädt alle EH 
    };

    if (isServer) then {
        //Function that adds dynamic groups to the mission as seen in End Game
        ["Initialize"] call BIS_fnc_dynamicGroups;

        [] spawn FUNC(startMission); // Waffenruhe und Missionsstart, für Server und Client
    };

}];