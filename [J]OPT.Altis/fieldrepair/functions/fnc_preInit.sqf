/**
* Author: James
* initialize variables for this component
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_preInit.sqf;
*
*/
#include "script_component.hpp"

GVAR(repair_hps) = ["HitLFWheel", "HitLBWheel", "HitLMWheel", "HitLF2Wheel", "HitRFWheel", "HitRBWheel", "HitRMWheel","HitRF2Wheel", "HitEngine", "HitLTrack","HitRTrack", "HitHull", "HitWinch"] + ["HitEngine1", "HitEngine2", "HitEngine3", "HitFuel", "HitAvionics", "HitVRotor", "HitHRotor", "HitHydraulics", "HitGear", "HitTail", "HitPitotTube", "HitStaticPort"];
GVAR(hardRepairParts) = ["HitEngine", "HitLTrack", "HitRTrack", "HitHull"] + ["HitEngine1", "HitEngine2", "HitEngine3", "HitFuel", "HitAvionics", "HitHRotor", "HitHydraulics", "HitGear", "HitTail"];

GVAR(mutexAction) = false;