/**
* Author: James
* init script for module hud. Adds EH for player
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

//LOG_1("HUD postInit.sqf aufgerufen - Var opt_startTime: %1",opt_startTime);

// Wenn HUD in main\setup\setup.hpp ein, füge EH für HUD hinzu
// HUD wird dann jedes Frame neu gezeichnet
// belastet nur Client FPS, wenn überhaupt
#ifdef __HUD_ON__
    ("opt_HUD" call BIS_fnc_rscLayer) cutRsc ["opt_HudDisplay", "PLAIN"];

    // Aktualisierung des HUD
    // each frame
    addMissionEventHandler ["Draw3D", {
        /**
        Runs the EH code each frame in unscheduled environment. Client side EH only (presence of UI). Will stop executing when UI loses focus (if user Alt+Tabs for example). Usually used with drawIcon3D, drawLine3D. 
        */
        if (!isNil "opt_startTime") then {
            [] call FUNC(updateHUD);
        };
    }];

    // only when opening or closing map
    addMissionEventHandler ["Map", {
        // no sheduled environment -> create one
        /* Triggered when map is opened or closed either by user action or script command openMap. */
        [] spawn {
            waitUntil{[] spawn FUNC(updateHUD); not visibleMap};
        };

    }];
#endif

true