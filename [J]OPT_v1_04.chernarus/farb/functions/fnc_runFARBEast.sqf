/**
* Author: James
* main FARB script, runs in stackedEH environment
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_runFARBEast.sqf;
*
*/
#include "script_component.hpp"

if (playerSide == west) exitwith { false };

private _FARB = GVAR(FARBEast);

private _FARBMarker = createMarkerLocal [format["FARMarker%1", east],[0,0]];
_FARBMarker setMarkerTypelocal "mil_dot";
_FARBMarker setMarkerTextLocal "FARB";
_FARBMarker setMarkerColorLocal "ColorOPFOR";
_FARBMarker setmarkerposlocal [0,0];

private _FARBZONE = createTrigger ["EmptyDetector", (getpos _FARB)];
_FARBZONE setTriggerArea [30, 30, 0, false, 0];
_FARBZONE setTriggerActivation ["ANY", "PRESENT", true];
_FARBZONE setTriggerStatements ["this", "", ""];

sleep 1;

[QGVAR(FARBEastActive), "onEachFrame", {
    params  ["_FARB", "_FARBMarker"];

    if !(alive _FARB) exitWith {};

    if !(_FARB getVariable ["FARBEASTaufgebaut", false]) then {
        _FARBMarker setmarkerposlocal getpos _FARB;
        _FARBMarker setMarkerSizeLocal [0, 0];

		
    } else {			
                    
        if (playerSide isEqualTo opfor) then {
            _FARBMarker setmarkerposlocal getpos _FARB;
            _FARBMarker setpos getpos _FARB;
			};
			
		if (vehicle player in _FARBZONE && !isNull (objectParent player) && driver (vehicle player) == player && speed (vehicle player) < 0.1) then 
		{
		nul = [true] spawn opt_mission_fnc_repairSystem;
		Hint "Test";
        };
    };

}, [_FARB, _FARBMarker, _FARBZONE]] call BIS_fnc_addStackedEventHandler;

waitUntil {!alive _FARB};

[QGVAR(FARBEastActive), "onEachFrame"] call BIS_fnc_removeStackedEventHandler;


deleteMarker _FARBMarker;
// delete objects around FARB - James
if (!isNil "FARBturmeast") then {
    deleteVehicle FARBturmeast;
};
if (!isNil "FARBnetzeast") then {
    deleteVehicle FARBnetzeast;
};

// FARB destroyed? delete AddAction - James
if (!alive _FARB) then {
    removeAllActions _FARB;
};
