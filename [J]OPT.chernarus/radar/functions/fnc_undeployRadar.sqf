
/**
* Author: James
* undeploy radar container, delete attached objects
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_undeployRadarEast.sqf;
*
*/
#include "script_component.hpp"

private _container = [] call FUNC(getRadar);

if (_container getVariable [QGVAR(isDeployed), false]) then {
	_container setVariable [QGVAR(isDeployed), false, true];

	{
		deleteVehicle _x;
	}	forEach (_container getVariable [QGVAR(attachedObjects), []]);	
	_container setVariable [QGVAR(attachedObjects), [], true];

    // add ACE dragging entries
    [QEGVAR(cargo,initDragging), [_container]] call CBA_fnc_globalEvent;
};




