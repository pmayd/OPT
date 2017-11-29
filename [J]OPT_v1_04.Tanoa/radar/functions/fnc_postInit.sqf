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
    format["!(%1 getVariable ['%2', false])", GVAR(containerEast), QUOTE(RADAREASTaufgebaut)]
]; 

GVAR(containerEast) addAction[
    ("<t color=""#df8601"">" + STR_RADAR_UNDEPLOY + "</t>"),
    {[] call FUNC(undeployRadarEast); },
    '', 
    1,
    true,
    true, 
    "", 
    format["(%1 getVariable ['%2', false])", GVAR(containerEast), QUOTE(RADAREASTaufgebaut)]
]; 

GVAR(containerWest) addAction[
    ("<t color=""#df8601"">" + STR_RADAR_DEPLOY + "</t>"),
    {[] call FUNC(deployRadarWest); },
    '',
    1, 
    true, 
    true, 
    "", 
    format["!(%1 getVariable ['%2', false])", GVAR(containerWest), QUOTE(RADARWESTaufgebaut)]
]; 

GVAR(containerWest) addAction[
    ("<t color=""#df8601"">" + STR_RADAR_UNDEPLOY + "</t>"),
    {[] call FUNC(undeployRadarWest); },
    '', 
    1, 
    true, 
    true, 
    "", 
    format["(%1 getVariable ['%2', false])", GVAR(containerWest), QUOTE(RADARWESTaufgebaut)]
];

[] spawn FUNC(runRadarEast);
[] spawn FUNC(runRadarWest);