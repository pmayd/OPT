#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

ADDON = true;

/* INITIALIZE GLOBAL VARS*/
GVAR(canTransportCargo) = []; // holds cargo definitions for all objects with cargo space
GVAR(canBeTransported)  = []; // holds all objects that can be transported
GVAR(canBeDragged) = []; // holds all objects that can be dragged
GVAR(canBeCarried) = []; // holds all objects that can be carried

// initialize CBA settings
[] call FUNC(initCBASettings);

// setup all global variables
[] call FUNC(setupCargoSpaceAndSize);
