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

params [["_loop", false]];

// set variable for all vehicles on map at mission start
if (isServer) then {
	[] spawn {
		_first = true;
		while {_first or _loop} do {
			{ 
				if (getRepairCargo _x > 0) then {
					_x setRepairCargo 0;
					_x setVariable [QGVAR(repair_cargo), 1, true]; 
				};
			} foreach vehicles;
			_first = false;
			sleep 26.1;
		};
	};
};

GVAR(repair_hps) = ["HitLFWheel","HitLBWheel","HitLMWheel","HitLF2Wheel","HitRFWheel","HitRBWheel","HitRMWheel","HitRF2Wheel" ,"HitEngine", "HitLTrack","HitRTrack"] + ["HitFuel","HitAvionics","HitVRotor","HitHRotor"];
GVAR(hardRepairParts) = ["HitEngine", "HitLTrack","HitRTrack"] + ["HitFuel","HitAvionics","HitHRotor"];

zlt_mutexAction = false;