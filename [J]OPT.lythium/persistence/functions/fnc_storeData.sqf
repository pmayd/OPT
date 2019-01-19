/**
* Author: James
* loop through allMissionObjects and store desired objects with all information in server profileNamespace.
* Will be called after mission has finished
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_storeData.sqf;
*
* Server only:
* yes
*
* Public:
* no - should be run only at mission end, otherwise will replace data in profileNamespace
*/
#include "script_component.hpp"

/* PARAMS */

/* VALIDATION */

/* CODE BODY */
[] call FUNC(getHash); // makes GVAR(hash) available

/* Process all categories for allMissionObjects */
[] call FUNC(processVehicles);

// overwrite content in server profileNamespace
[QGVAR(hash), GVAR(hash), true] call EFUNC(database,setVar);
[] call EFUNC(database,saveProfile);