#include "script_component.hpp"

/*
    this line is commented, otherwise it would disturb the linter.
["LandVehicle", "init", FUNC(onInit), nil, nil, true] call CBA_fnc_addClassEventHandler;
*/

if (!GVAR(on)) exitWith{};

// addon check
if (count ("(configName _x) find 'TFAR' >= 0" configClasses (configFile >> "CfgPatches")) == 0) exitWith{};

// executed after briefing right to mission start
GVAR(EH_PreloadFinished) = addMissionEventHandler ["PreloadFinished",  {
    /*  	
        Executes assigned code after the mission preload screen. Stackable version of onPreloadFinished. 
    */
    [] call FUNC(postInit); // führt alle wichtigen Skripte aus
    [] call FUNC(initPlayerEH);

}];
