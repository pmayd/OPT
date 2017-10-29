/**
* Author: James
* spawn a vehicle 
*
* Arguments:
* 0: <type> description
*
* Return Value:
* None
*
* Example:
* [parameter] call fnc_spawnVehicle.sqf;
*
*/
#include "script_component.hpp"

params ["_vecType", "_spawnPos"];

// get spawnPos right
_spawnPos = if (typeName _spawnPos == "OBJECT") then {getPosATL _spawnPos} else {_spawnPos};

private _vec = createVehicle [_vecType, _spawnPos, [], 0, "NONE"];

//added by psycho - check for free space to place the vehicle
private _sizeOfVec = sizeOf _vecType;
private _isFlat = [];
if (surfaceIsWater _spawnPos) then {
	_isFlat = (position _vec) isFlatEmpty [_sizeOfVec / 2, 50, 0.7, _sizeOfVec, 2, false, _vec];
} else {
	_isFlat = (position _vec) isFlatEmpty [_sizeOfVec / 2, 80, 0.7, _sizeOfVec, 0, false, _vec];
};

if (typeName _spawnPos == "OBJECT") then {_vec setDir (getDir _spawnPos)};
if (surfaceIsWater _spawnPos) then {
	_vec setPosASL ((getPos _vec) set [2, 0]);
} else {
	_vec setPosATL (getPos _vec vectorAdd [0,0,0.1]);
};

_vec addEventHandler ["Killed", {
	_this call FUNC(handleDeadVehicle);
}];

//datalink-test-eintrag, kallek
_vec setVehicleReportOwnPosition true;
_vec setVehicleReportRemoteTargets true;
_vec setVehicleReceiveRemoteTargets true;

// fügt auf allen clients einen Add Action Eintrag für umgekippte Fahrzeuge hinzu
// ersetzt player add action in onPlayerRespawn (viel performanter, da kein pulling)
if (_vec isKindOf "AllVehicles") then {
	[QEGVAR(common,addAction), 
        [
		    _vec, 
		    ["Fahrzeug aufrichten" call XTuerkiesText, {[] call EFUNC(common,unFlip);}, [], 0, false, true, "", format["[_target, player] call %1", QEFUNC(common,flipCheck)]]
        ]
	] call CBA_fnc_globalEventJIP;
};

// Engine EH für Piloten -> Log transportierte Soldaten
if (_vec isKindOf "Air") then {
    _vec addEventHandler [
        "GetIn",
        {
            /*
            vehicle: Object - Vehicle the event handler is assigned to
            position: String - Can be either "driver", "gunner" or "cargo"
            unit: Object - Unit that entered the vehicle
            (Since Arma 3 v1.36)
            turret: Array - turret path
            */
            params ["_vec", "_pos", "_unit"];
            
            // speichere Pilot als Variable des Objekts Heli
            if (_pos isEqualTo "driver") then {
                _vec setVariable [QGVAR(transport_pilot), _unit, true];
            };

            // speichere aktuellen Ort an der Einheit
            _unit setVariable [QGVAR(transport_start_loc), getPosASL _vec, false];
        }
    ];
    _vec addEventHandler [
        "GetOut",
        {
            /*
            vehicle: Object - Vehicle the event handler is assigned to
            position: String - Can be either "driver", "gunner" or "cargo"
            unit: Object - Unit that left the vehicle
            turret: Array - turret path (since Arma 3 v1.36)
            */
            params ["_vec", "_pos", "_unit"];

            // logge transport von Spielern, falls Spieler nicht Pilot und Strecke geflogen
            private _dis = (getPosASL _vec) distance2D (_unit getVariable QGVAR(transport_start_loc));
            if ( _pos in ["cargo", "gunner"] && (_dis > 500) ) then {
                private _message = format[
                    "%1 (%2) wurde von %3 (%4) eingeflogen (%5 m)", 
                    name _unit, 
                    _unit getVariable QEGVAR(mission,playerSide),  
                    name (_vec getVariable QGVAR(transport_pilot)), 
                    (_vec getVariable QGVAR(transport_pilot)) getVariable QEGVAR(mission,playerSide),
                    _dis
                ];

                [QEGVAR(log,write), ["Transport", _message]] call CBA_fnc_serverEvent;

            };

        }
    ];
};

// Create Vehicle Crew
// James: Nutze stattdessen UAV classname aus setup
_uavs = [
	"OPT_B_UGV_01_F",
	"OPT_B_UGV_01_rcws_F",
	"OPT_O_UGV_01_F",
	"OPT_O_UGV_01_rcws_F",
	"B_UCSV_01",
	"O_UCSV_01",
	"OPT_B_UAV_01_F",
	"OPT_O_UAV_01_F",
	"OPT_B_Static_Designator_01_F",
	"OPT_O_Static_Designator_02_F",
    "OPT_O_T_UGV_01_ghex_F"
];

if (_vecType in (_uavs + GVARMAIN(big_uavs))) then {
	createVehicleCrew (_vec);
	_vec setSkill 0.8;
};

_vec setDamage 0;