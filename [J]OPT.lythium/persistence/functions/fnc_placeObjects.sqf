/**
* Author: James
* read out stored data in server profileNamespace and process it
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call opt_persistence_fnc_placeObjects.sqf;
*
* Server only:
* yes
*
* Public:
* no - should be called only on mission start
*/
#include "script_component.hpp"

/* PARAMS */

/* VALIDATION */

/* CODE BODY */
[] call FUNC(getHash); // makes GVAR(hash) available

/* PROCESS DATA */
[] call FUNC(placeVehicles);