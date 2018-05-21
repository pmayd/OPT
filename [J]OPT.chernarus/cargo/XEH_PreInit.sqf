#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

ADDON = true;

[] call FUNC(setupCargoSpaceAndSize);

// has to be called in preInit to affect all vehicles
[] call FUNC(initCBAClassEvents);

[] call FUNC(initCBAEvents);
