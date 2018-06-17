/**
* Author: James
* deploy mhq and composition
*
* Arguments:
* 0: <OBJECT> mhq vehicle
* 1: <ARRAY> cargo info in format [classname, offset, dir, code]
* 2: <ARRAY> composition in format [classname, offset, dir, code]
*
* Return Value:
* None
*
* Example:
* [vehicle, [], []] call fnc_deploy.sqf;
*
*/
#include "script_component.hpp"

params [
    ["_vec", objNull, [objNull], 1],
    ["_cargoInfo", [], [[]]],
    ["_composition", [], [[]]]
];

private _side = [_vec] call EFUNC(common,getVehicleSide);

private _cargo = _vec getVariable [QGVAR(cargo), objNull];

[_vec, _composition] call EFUNC(composition,deployComposition);

// TODO
[[_vec], "CHHQ_fnc_removeAction", _side] call BIS_fnc_MP;

// TODO
[[_vec, _side, "HQ"],"CHHQ_fnc_drawMarker",_side] call BIS_fnc_MP;	

// TODO
[[_vec, ["Undeploy HQ", "_this spawn CHHQ_fnc_undeploy", [_side, _cargoInfo, _composition], 0, false, true, "", "[_target, _this] call CHHQ_fnc_actionConditions"]], "CHHQ_fnc_addAction", _side] call BIS_fnc_MP;

// TODO
[["RespawnAdded",["DEPLOYMENT POINT",format ["HQ deployed at grid %1", mapGridPosition (getPos _veh)],"\A3\ui_f\data\map\markers\nato\b_hq.paa"]],"BIS_fnc_showNotification",_side] call BIS_fnc_MP;

