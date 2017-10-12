#include "script_component.hpp"

GVAR(EH_PreloadFinished) = addMissionEventHandler ["PreloadFinished",  {
    /*  	
        Executes assigned code after the mission preload screen. Stackable version of onPreloadFinished. 
    */
    if (!local player) exitWith{};

    [] call FUNC(initPlayerEH);
}];