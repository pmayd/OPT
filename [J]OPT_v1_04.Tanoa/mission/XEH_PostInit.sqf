#include "script_component.hpp"

[] call FUNC(briefing); // fügt Briefing und Tagebuch hinzu

GVAR(EH_PreloadFinished) = addMissionEventHandler ["PreloadFinished",  {
    /*  	
        Executes assigned code after the mission preload screen. Stackable version of onPreloadFinished. 
    */
    if (local player) then {
        [] call FUNC(postInit); // führt alle wichtigen Skripte aus
        [] call FUNC(addFlagMenu); // fügt HL und PL Menü für Flaggenwahl hinzu
        [] call FUNC(initPlayerEH); // lädt alle EH 
    };

    [] spawn FUNC(startMission); // Waffenruhe und Missionsstart, für Server und Client

}];