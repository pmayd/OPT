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

// set variable for all vehicles on map at mission start
if (isServer) then {
	[] spawn {
		{ 
			if (getRepairCargo _x > 0) then {
				_x setRepairCargo 0;
				_x setVariable [QGVAR(repair_cargo), 1, true]; 
			};
		} foreach vehicles;
	};
};

GVAR(repair_hps) = ["HitLFWheel","HitLBWheel","HitLMWheel","HitLF2Wheel","HitRFWheel","HitRBWheel","HitRMWheel","HitRF2Wheel" ,"HitEngine", "HitLTrack","HitRTrack"] + ["HitFuel","HitAvionics","HitVRotor","HitHRotor"];
GVAR(hardRepairParts) = ["HitEngine", "HitLTrack","HitRTrack"] + ["HitFuel","HitAvionics","HitHRotor"];

GVAR(mutexAction) = false;