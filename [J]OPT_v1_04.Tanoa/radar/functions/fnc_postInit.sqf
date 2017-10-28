/**
* Author: James
* initialize radar componente and call the two main functions
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_init.sqf;
*
*/
#include "script_component.hpp"

GVAR(containerEast) addAction[
    ("<t color=""#df8601"">" + ("Radar aufbauen") + "</t>"),
    {[] call FUNC(deployRadarEast); },
    '', 
    1, 
    true, 
    true, 
    "", 
    format["(!(%1 getVariable [""RADAREASTaufgebaut"", false]))", GVAR(containerEast)]
]; 

GVAR(containerEast) addAction[
    ("<t color=""#df8601"">" + ("Radar abbauen") + "</t>"),
    {[] call FUNC(undeployRadarEast); },
    '', 
    1,
    true,
    true, 
    "", 
    format["(%1 getVariable [""RADAREASTaufgebaut"", false])", GVAR(containerEast)]
]; 

GVAR(containerWest) addAction[
    ("<t color=""#df8601"">" + ("Radar aufbauen") + "</t>"),
    {[] call FUNC(deployRadarWest); },
    '',
    1, 
    true, 
    true, 
    "", 
    format["(!(%1 getVariable [""RADARWESTaufgebaut"",false]))", GVAR(containerWest)]
]; 

GVAR(containerWest) addAction[
    ("<t color=""#df8601"">" + ("Radar abbauen") + "</t>"),
    {[] call FUNC(undeployRadarWest); },
    '', 
    1, 
    true, 
    true, 
    "", 
    format["(%1 getVariable [""RADARWESTaufgebaut"",false])", GVAR(containerWest)]
];

[] spawn FUNC(runRadarEast);
[] spawn FUNC(runRadarWest);