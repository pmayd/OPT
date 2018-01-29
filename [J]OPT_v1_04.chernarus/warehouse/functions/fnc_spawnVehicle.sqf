/**
* Author: James
* spawn a vehicle 
*
* Arguments:
* 0: <type> description
* 1: <OBJECT> object for spawn position
* 2: <POSITION> empty position
*
* Return Value:
* None
*
* Example:
* [parameter] call fnc_spawnVehicle.sqf;
*
*/
#include "script_component.hpp"

params ["_vecType", "_spawnObj", "_empty_pos"];

/* security check
spawn vehicle somewhere in the air
stop physics and damage calculation
move vehicle to free position
*/
private _vec = createVehicle [_vecType, [0,0, 1000 + random(500)], [], 0, "NONE"];
_vec enableSimulationGlobal false;
_vec allowDamage  false; // avoid any damage during spawn process
_vec setPosATL _empty_pos;

if (typeName _spawnObj == "OBJECT") then {_vec setDir (getDir _spawnObj)};
if (surfaceIsWater _empty_pos) then {
	_vec setPosASL ((getPosASL _vec) set [2, 0]);
};

//datalink-test-eintrag, kallek
_vec setVehicleReportOwnPosition true;
_vec setVehicleReportRemoteTargets true;
_vec setVehicleReceiveRemoteTargets true;

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

waitUntil { speed _vec == 0; };
_vec enableSimulationGlobal true;
_vec setDamage 0;
_vec allowDamage true;