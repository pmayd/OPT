
/**
* Author: James
* undeploy radar container, delete attached objects
*
* Arguments:
* 0: <OBJECT> radar container
*
* Return Value:
* None
*
* Example:
* [] call fnc_undeployRadarEast.sqf;
*
*/
#include "script_component.hpp"

params [
    ["_container", objNull, [objNull], 1]
];

if (_container isEqualTo objNull) exitWith {};

if (_container getVariable [QGVAR(isDeployed), false]) then {
	_container setVariable [QGVAR(isDeployed), false, true];

	{
		deleteVehicle _x;
	}	forEach (_container getVariable [QGVAR(attachedObjects), []]);	
	_container setVariable [QGVAR(attachedObjects), [], true];

    // add ACE dragging entries
    [QEGVAR(cargo,initCargo), [_container]] call CBA_fnc_serverEvent;
    [QEGVAR(cargo,initDragging), [_container]] call CBA_fnc_globalEvent;
};




