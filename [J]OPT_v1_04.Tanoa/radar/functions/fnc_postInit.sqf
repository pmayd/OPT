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
* [] call fnc_postInit.sqf;
*
*/
#include "script_component.hpp"

GVAR(containerEast) addAction[
    ("<t color=""#df8601"">" + STR_RADAR_DEPLOY + "</t>"),
    {[] call FUNC(deployRadarEast); },
    '', 
    1, 
    true, 
    true, 
    "", 
    QUOTE(!(GVAR(containerEast) getVariable [QUOTE(RADAREASTaufgebaut), false]))
]; 

GVAR(containerEast) addAction[
    ("<t color=""#df8601"">" + STR_RADAR_UNDEPLOY + "</t>"),
    {[] call FUNC(undeployRadarEast); },
    '', 
    1,
    true,
    true, 
    "", 
    QUOTE(GVAR(containerEast) getVariable [QUOTE(RADAREASTaufgebaut), false])
]; 

GVAR(containerWest) addAction[
    ("<t color=""#df8601"">" + STR_RADAR_DEPLOY + "</t>"),
    {[] call FUNC(deployRadarWest); },
    '',
    1, 
    true, 
    true, 
    "", 
    QUOTE(!(GVAR(containerWest) getVariable [QUOTE(RADARWESTaufgebaut), false]))
]; 

GVAR(containerWest) addAction[
    ("<t color=""#df8601"">" + STR_RADAR_UNDEPLOY + "</t>"),
    {[] call FUNC(undeployRadarWest); },
    '', 
    1, 
    true, 
    true, 
    "", 
    QUOTE(GVAR(containerWest) getVariable [QUOTE(RADARWESTaufgebaut), false])
];

[] spawn FUNC(runRadarEast);
[] spawn FUNC(runRadarWest);