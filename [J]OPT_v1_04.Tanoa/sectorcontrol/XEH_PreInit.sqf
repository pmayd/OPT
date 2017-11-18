#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

ADDON = true;

if (isServer) then {
    [] call FUNC(setup_flagPositions);
    [] call FUNC(initServerCBAEvents);
};