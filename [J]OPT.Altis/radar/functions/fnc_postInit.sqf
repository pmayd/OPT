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

[GVAR(containerWest), GVAR(containerEast)] apply
{
    _x addAction
    [
        ("<t color=""#df8601"">" + STR_RADAR_DEPLOY + "</t>"),
        {[_this select 0] spawn FUNC(deployRadar); },
        '',
        1,
        true,
        true,
        "",
        format["!(_target getVariable ['%1', false])", QEGVAR(composition,deployed)],
        5
    ];

    _x addAction
    [
        ("<t color=""#df8601"">" + STR_RADAR_UNDEPLOY + "</t>"),
        {[_this select 0] spawn FUNC(undeployRadar); },
        '',
        1,
        true,
        true,
        "",
        format["(_target getVariable ['%1', false])", QEGVAR(composition,deployed)],
        5
    ];

};

[] spawn FUNC(runRadar);
