#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

ADDON = true;

[] call FUNC(setupVehiclePool);

if (isServer) then {
    [] call FUNC(initServerCBAEvents);
};

if (local player) then {
    [] call FUNC(initPlayerCBAEvents);
};

[] call FUNC(initCBAClassEvents);