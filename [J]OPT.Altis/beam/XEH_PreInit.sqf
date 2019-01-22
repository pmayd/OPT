#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

ADDON = true;

/* INITIALIZE GLOBAL VARS */
// list all global variables used within the component
// define variable with default value!
// GVAR(...)
GVAR(box) = []; // contains all available beam positions defined in setup_beamOrte.sqf
GVAR(locations_west) = []; // contains all beam locations for west
GVAR(locations_east) = []; // contains all beam locations for east
GVAR(heavy_vehicles) = []; // contains all heavy vehicle classnames that are only allowed at lvl 3
GVAR(beam_trigger) = []; // contains all trigger variable names that allow player to open beam dialog

// initialize CBA settings
[] call FUNC(initCBASettings);