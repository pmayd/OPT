#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

ADDON = true;

/* INITIALIZE GLOBAL VARS */
GVAR(locations_west) = []; // holds all beam positions for west
GVAR(locations_east) = []; // holds all beam positions for east
GVAR(heavy_vehicles) = []; // holds all heavy vehicles

// initialize CBA settings
[] call FUNC(initCBASettings);
