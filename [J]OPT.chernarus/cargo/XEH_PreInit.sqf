#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

ADDON = true;

[] call FUNC(setupCargoSpaceAndSize);

// has to be called in PreInit so that all mission objects are affected!
if (isServer) then {
    [] call FUNC(initCBAClassEvents);
};

[] call FUNC(initCBAEvents);