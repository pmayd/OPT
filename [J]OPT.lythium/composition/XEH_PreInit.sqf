#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

ADDON = true;

/* INITIALIZE GLOBAL VARS */
GVAR(composition) = []; // holds the composition array
GVAR(cargo) = objNull; // holds the cargo container object, if any
GVAR(deployed) = false; // whether deployment was successful
GVAR(deploymentInProgress) = false; // whether deployment is in progress
GVAR(undeploymentInProgress) = false; // whether undeployment is in progress
GVAR(deployBlackout) = ""; // layer ID for cut resource