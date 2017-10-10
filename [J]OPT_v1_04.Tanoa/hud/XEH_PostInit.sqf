#include "script_component.hpp"

[QGVAR(initEH), "onPreloadFinished",  {
    /*  	
        Executes assigned code after the mission preload screen. Stackable version of onPreloadFinished. 
    */
    if (!local player) exitWith{};

    [] call FUNC(initPlayerEH);
}, []] call BIS_fnc_addStackedEventHandler; 