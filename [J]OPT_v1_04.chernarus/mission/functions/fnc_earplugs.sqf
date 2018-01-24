/**
* Author: James
* add ace menu entry for earplugs
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_earplugs.sqf;
*
*/
#include "script_component.hpp"

if (isNil QGVAR(inUse)) then {
    GVAR(inUse) = 1;
};

switch (GVAR(inUse)) do {
    case 1: {
        1 fadeSound 0.25;
        ["<t size='0.8' shadow='1' color='#ffffff'>Ohrstoepsel rein</t>", (safeZoneX - 0.2), (safeZoneY + 0.3), 3, 1, 0, 1] spawn BIS_fnc_dynamicText;
        GVAR(inUse) = 2;
    };
    case 2: {
        1 fadeSound 1;
        ["<t size='0.8' shadow='1' color='#ffffff'>Ohrstoepsel raus</t>",  (safeZoneX - 0.2), (safeZoneY + 0.3), 3, 1, 0, 1] spawn BIS_fnc_dynamicText;
        GVAR(inUse) = 1;
    };
};

