/**
* Author: James
* called via CBA Keybind. Toggle ingame HUD
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_toggleHUD.sqf;
*
*/
#include "script_component.hpp"

// Wenn HUD in main\setup\setup.hpp ein, füge EH für HUD hinzu
// HUD wird dann jedes Frame neu gezeichnet
// belastet nur Client FPS, wenn überhaupt

private _noHUD = (uiNamespace getVariable QGVAR(display)) isEqualTo displayNull;

if (_noHUD) then {
    // create rsc layer and add mission EH for updating HUD
    #ifdef __HUD_ON__
        (QGVAR(layerID) call BIS_fnc_rscLayer) cutRsc [QGVAR(rsc_hud), "PLAIN", 1];

        // Aktualisierung des HUD
        // each frame
        GVAR(eh_draw3d) = addMissionEventHandler ["Draw3D", {
            /**
            Runs the EH code each frame in unscheduled environment. Client side EH only (presence of UI). Will stop executing when UI loses focus (if user Alt+Tabs for example). Usually used with drawIcon3D, drawLine3D. 
            */
            [] call FUNC(updateHUD);

        }];

        // only when opening or closing map
        GVAR(eh_map) = addMissionEventHandler ["Map", {
            // no sheduled environment -> create one
            /* Triggered when map is opened or closed either by user action or script command openMap. */
            [] spawn {
                waitUntil{[] spawn FUNC(updateHUD); not visibleMap};
            };

        }];
    #endif
} else {

    // delete rsc layer and all mission EH
    (QGVAR(layerID) call BIS_fnc_rscLayer) cutFadeOut 1;
    removeMissionEventHandler ["Draw3D", GVAR(eh_draw3d)];
    removeMissionEventHandler ["Map", GVAR(eh_map)];
};


true