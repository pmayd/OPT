/**
* Author: James
* call all necessary script files after mission has setStarterRTD
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

[] spawn {
    waitUntil{GVARMAIN(missionStarted)};

    // start flag setup (setting owner)
    [] call FUNC(setupFlag);

    // calculate first time the dominator (it's needed if assynchrone number of flags are defined)
    [sideUnknown, objNull] call FUNC(setFlagOwner);
};