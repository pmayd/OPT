#include "script_component.hpp"

// executed after briefing right to mission start
GVAR(EH_PreloadFinished) = addMissionEventHandler ["preloadFinished", {
    // öffnet das HUD initial für alle Spieler
    [] call FUNC(toggleHUD);

}];
