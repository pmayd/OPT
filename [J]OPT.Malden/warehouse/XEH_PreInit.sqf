#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

ADDON = true;

GVAR(spawnInProgress) = false;

// CBA settings
[] call FUNC(initCBASettings);

[] call FUNC(setupVehiclePool);

if (isServer) then {
    [] call FUNC(initServerCBAEvents);

};

if (hasInterface) then {
    [] call FUNC(initPlayerCBAEvents);
};