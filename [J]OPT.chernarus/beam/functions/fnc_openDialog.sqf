/**
* Author: James
* open beam dialog
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_openDialog.sqf;
*
*/
#include "script_component.hpp"

if (!dialog) then {
    createDialog "DialogBeam";
};