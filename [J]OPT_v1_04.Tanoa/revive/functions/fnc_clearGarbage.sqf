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

if (!local player) exitWith {};

{
	deleteVehicle _x;
} forEach FAR_medequipArray;


true