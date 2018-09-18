/**
* Author: James
* register all custom CBA EventHandler that are related to the main OPT missionConfigFile
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_initCBAEvents.sqf;
*
*/
#include "script_component.hpp"

["ace_interactMenuClosed", {
    params ["_menuType"];

    // check if player has new attachedObjects
    if (_menuType == 1) then {
        // objects are not immediately attached
        [] spawn {
            sleep 1;
            if  (count (attachedObjects player select {!(_x isEqualTo objNull)}) > 0) then {
                player setVariable [QGVAR(attachedBackpack), typeOf ((attachedObjects player select {!(_x isEqualTo objNull)}) select 0)];
            } else {
                player setVariable [QGVAR(attachedBackpack), ""];
            };
        };
        
    };

}] call CBA_fnc_addEventHandler;