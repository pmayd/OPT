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
private _ori = getDir _spawnPos;
_spawnPos = if (typeName _spawnPos == "OBJECT") then {getPosATL _spawnPos} else {_spawnPos};

private _vec = createVehicle [_vecType, _spawnPos, [], 0, "NONE"];

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
_vec setDir _ori;