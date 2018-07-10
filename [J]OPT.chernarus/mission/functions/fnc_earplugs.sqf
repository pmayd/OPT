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

if (isNil QGVAR(earplugsInUse)) then {
    GVAR(earplugsInUse) = 1;
};

switch (GVAR(earplugsInUse)) do {
    case 1: {
        1 fadeSound 0.25;
        ["<t size='0.8' shadow='1' color='#ffffff'>Ohrstoepsel rein</t>", (safeZoneX - 0.2), (safeZoneY + 0.3), 3, 1, 0, 1] spawn BIS_fnc_dynamicText;
        GVAR(earplugsInUse) = 2;
    };
    case 2: {
        1 fadeSound 1;
        ["<t size='0.8' shadow='1' color='#ffffff'>Ohrstoepsel raus</t>",  (safeZoneX - 0.2), (safeZoneY + 0.3), 3, 1, 0, 1] spawn BIS_fnc_dynamicText;
        GVAR(earplugsInUse) = 1;
    };
};

