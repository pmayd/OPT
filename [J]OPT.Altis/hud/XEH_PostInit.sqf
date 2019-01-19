#include "script_component.hpp"

if (!GVAR(on)) exitWith{};

// executed after briefing right to mission start
GVAR(EH_PreloadFinished) = addMissionEventHandler ["preloadFinished", {
    // öffnet das HUD initial für alle Spieler
    [] call FUNC(toggleHUD);

}];

// CBA Keybinds
if (hasInterface) then {
    [] call FUNC(postInit);
};