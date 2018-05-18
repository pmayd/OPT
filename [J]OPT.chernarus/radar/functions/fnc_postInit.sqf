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

private _container = [] call FUNC(getRadar);

_container addAction[
    ("<t color=""#df8601"">" + STR_RADAR_DEPLOY + "</t>"),
    {[] call FUNC(deployRadar); },
    '', 
    1, 
    true, 
    true, 
    "", 
    format["!(%1 getVariable ['%2', false])", _container, QGVAR(isDeployed)]
]; 

_container addAction[
    ("<t color=""#df8601"">" + STR_RADAR_UNDEPLOY + "</t>"),
    {[] call FUNC(undeployRadar); },
    '', 
    1,
    true,
    true, 
    "", 
    format["(%1 getVariable ['%2', false])", _container, QGVAR(isDeployed)]
]; 

[] spawn FUNC(runRadar);