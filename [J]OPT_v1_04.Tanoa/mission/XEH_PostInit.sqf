#include "script_component.hpp"

[] call FUNC(briefing); // fügt Briefing und Tagebuch hinzu

if (isServer) then {
    [] call FUNC(initMissionEH);
};

GVAR(EH_PreloadFinished) = addMissionEventHandler ["PreloadFinished",  {
    /*  	
        Executes assigned code after the mission preload screen. Stackable version of onPreloadFinished. 
    */
    if (local player) then {
        [] call FUNC(postInit); // führt alle wichtigen Skripte aus
        [] call FUNC(initPlayerEH); // lädt alle EH  
        [QEGVAR(log,updatePlayerList), [getPlayerUID player, profileName, playerSide]] call CBA_fnc_serverEvent;    
    };

    if (isServer) then {
        //Function that adds dynamic groups to the mission as seen in End Game
        ["Initialize"] call BIS_fnc_dynamicGroups;
        [] spawn FUNC(startMission); // Waffenruhe und Missionsstart, für Server und Client
    };
}];