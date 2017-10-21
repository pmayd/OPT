#include "script_component.hpp"

GVAR(EH_PreloadFinished) = addMissionEventHandler ["preloadFinished", {
    // öffnet das HUD initial für alle Spieler
    [] call FUNC(toggleHUD);

}];
