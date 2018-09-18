#include "script_component.hpp"

/*
    this line is commented, otherwise it would disturb the linter.
["LandVehicle", "init", FUNC(onInit), nil, nil, true] call CBA_fnc_addClassEventHandler;
*/

if (!GVAR(on)) exitWith{};

// set budget to 10 million
GVARMAIN(nato_budget) = parseNumber GVAR(budget);
GVARMAIN(csat_budget) = parseNumber GVAR(budget);


if (isServer) then {
    [] call FUNC(initServerMissionEH);
};

// executed after briefing right to mission start
GVAR(EH_PreloadFinished) = addMissionEventHandler ["PreloadFinished",  {
    /*  
        Executes assigned code after the mission preload screen. Stackable version of onPreloadFinished. 
    */
    [] call FUNC(initPlayerMissionEH);

}];