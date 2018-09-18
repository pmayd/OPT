/**
* Author: James
* spawn a vehicle 
*
* Arguments:
* 0: <OBJECT> unit which send the order
* 1: <string> classname to spawn
* 2: <OBJECT> nearest spawn pos
* 3: <NUMBER> unit cost
*
* Return Value:
* None
*
* Example:
* [parameter] call fnc_spawnVehicle.sqf;
*
*/
#include "script_component.hpp"

params ["_unit", "_vecType", "_spawnObj", "_unitCost"];

// semaphore -> wait for other spawn processes to finish
waitUntil { !GVAR(spawnInProgress); };
GVAR(spawnInProgress) = true;

private _empty_pos = (position _spawnObj) findEmptyPosition [0.2, GVAR(orderSpawnRadius), _vecType];

if (count _empty_pos == 0) exitWith {
    private _txt = format["Kein freier Platz im Umkreis von %1m. Bereich räumen.", GVAR(orderSpawnRadius)];
    ["Platz unzureichend", _txt, "red"] remoteExecCall [QEFUNC(gui,message), _unit, false];
    GVAR(spawnInProgress) = false;
};

private _vec = createVehicle [_vecType, _empty_pos, [], 0, "NONE"];
// _vec enableSimulationGlobal false;
// _vec allowDamage false; // avoid any damage during spawn process
// _vec setPosATL _empty_pos;

if (typeName _spawnObj == "OBJECT") then {_vec setDir (getDir _spawnObj)};
if (surfaceIsWater _empty_pos) then {
    _vec setPos [(_empty_pos select 0),(_empty_pos select 1), 0.2]; 
};

//datalink-test-eintrag, kallek
// _vec setVehicleReportOwnPosition true;
// _vec setVehicleReportRemoteTargets true;
// _vec setVehicleReceiveRemoteTargets true;

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

//waitUntil { speed _vec == 0; };
//_vec enableSimulationGlobal true;
_vec setDamage 0;
//_vec allowDamage true;
sleep 1;
_vec setDamage 0;

GVAR(spawnInProgress) = false;

private _displayName = getText (configFile >> "CfgVehicles" >> _vecType >> "displayName");
private _txt = format["%1 geliefert.",_displayName];
["Bestellung", _txt, "green"] remoteExecCall [QEFUNC(gui,message), _unit, false];

// update budget initialized by server!
[UNIT_NAME(_unit), UNIT_SIDE(_unit), _vecType, _unitCost, "-"] call EFUNC(common,updateBudget);
[] remoteExecCall [QFUNC(updateBudget), _unit, false];