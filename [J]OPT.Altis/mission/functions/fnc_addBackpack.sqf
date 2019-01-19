/**
* Author: James
* check if player had attached objects and add again backpack
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_addBackpack.sqf;
*
* Server only:
* no
*
* Public:
* yes
*
*/
#include "script_component.hpp"

/* PARAMS */

/* Validation */

/* Code Body */

private _attachedBackpack = player getVariable [QGVAR(attachedBackpack), ""];

if !(_attachedBackpack isEqualTo "") then {
	player addBackpack _attachedBackpack;
	player setVariable [QGVAR(attachedBackpack), ""];
};

