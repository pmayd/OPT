/**
* Author: James
* delete medical equipment
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_handleRevive.sqf;
*
*/
#include "script_component.hpp"

if (!hasInterface) exitWith {};

FAR_medequipArray apply
{
    deleteVehicle _x;
};


true