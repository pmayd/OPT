/**
* Author: James
* initialize MHQ scripts for a vehicle or object
*
* Arguments:
* 0: <OBJECT> vehicle (mhq) or an object to teleport to hq (e.g. flag pole)
* 1: <SIDE> side of object
*
* Return Value:
* None
*
* Example:
* [vehicle, west] call fnc_postInit.sqf;
*
*/
#include "script_component.hpp"

/* PARAMS */
params [
    ["_obj", objNull, [objNull], 1],
    ["_side", sideUnknown, [sideUnknown], 1]
];

/* VALIDATION */
if (!GVAR(on)) exitWith{};

/* CODE BODY */
waitUntil {time > 1};

if (_side isEqualTo sideUnknown && toLower typeOf _obj != toLower "MapBoard_altis_F") then {
    _side = [_obj] call EFUNC(common,vehicleSide);
};

[] spawn FUNC(clearNullFromArray);

switch (toLower typeOf _obj) do {
    case (toLower "B_Truck_01_transport_F"): {
        _composition = [["Land_PowerGenerator_F",[-2.99756,2.07959,0.0971174],180.556],["Land_CampingTable_F",[-3.40649,-1.95361,0.0971169],252.548],["Land_CampingChair_V1_F",[-4.34302,-1.66504,0.100242],253.27],["Land_Cargo20_grey_F",[4.11963,-0.677246,0.0971179],271.612,{_this animate ["Door_1_rot",1]; _this animate ["Door_2_rot",1]}]];
        _cargoInfo = ["Land_Cargo20_grey_F",[0.045,-2.31,1.15],270,{_this setVariable ['bis_disabled_Door_1',1]; _this setVariable ['bis_disabled_Door_2',1]}];
        [_obj, _side, _composition, _cargoInfo] call FUNC(startingSetup);
    };
    case (toLower "O_Truck_02_transport_F"): {
        _composition = [["Land_PowerGenerator_F",[-2.4873,2.33643,0.0315285],182.122],["Land_WaterTank_F",[3.85596,0.42627,0.0315242],4.92499],["Land_CampingTable_F",[-2.77075,-1.10254,0.031528],276.314],["Land_CampingChair_V1_F",[-3.8562,-0.631348,0.0346532],288.003],["Land_Cargo10_military_green_F",[3.70703,-2.79932,0.0315285],274.286]];	
        _cargoInfo = ["Land_Cargo10_sand_F",[0.07,-2,0.5],270];
        [_obj, _side, _composition, _cargoInfo] call FUNC(startingSetup);
    };
    case (toLower "I_Truck_02_transport_F"): {
        _composition = [["Land_PowerGenerator_F",[-2.4873,2.33643,0.0315285],182.122],["Land_WaterTank_F",[3.85596,0.42627,0.0315242],4.92499],["Land_CampingTable_F",[-2.77075,-1.10254,0.031528],276.314],["Land_CampingChair_V1_F",[-3.8562,-0.631348,0.0346532],288.003],["Land_Cargo10_military_green_F",[3.70703,-2.79932,0.0315285],274.286]];	
        _cargoInfo = ["Land_Cargo10_military_green_F",[0.07,-2,0.5],270];
        [_obj, _side, _composition, _cargoInfo] call FUNC(startingSetup);
    };
    case (toLower "O_Truck_03_transport_F"): {
        _composition = [["Land_PowerGenerator_F",[-2.74097,0.837891,0.0376329],182.12],["Land_CampingTable_F",[-3.02441,-2.60107,0.0376248],276.309],["Land_CampingChair_V1_F",[-4.10986,-2.13037,0.0407581],288.114],["Land_FieldToilet_F",[4.37451,-0.489258,0.0376129],195.192],["Land_Cargo10_sand_F",[3.79224,-3.17822,0.0376348],285.205],["CamoNet_OPFOR_big_F",[0,-0.568848,0.119837],350.522]];
        _cargoInfo = ["Land_Cargo10_sand_F",[0.07,-3.46,0.8],270];
        [_obj, _side, _composition, _cargoInfo] call FUNC(startingSetup);
    };
    case (toLower "B_G_Van_01_transport_F"): {
        _composition = [["Land_Portable_generator_F",[-2.4873,2.33643,0.0315285],182.122],["Land_WaterBarrel_F",[3.85596,0.42627,0.0315242],4.92499],["Land_CampingTable_F",[-2.77075,-1.10254,0.031528],276.314],["Land_CampingChair_V1_F",[-3.8562,-0.631348,0.0346532],288.003],["CargoNet_01_box_F",[3.70703,-2.79932,0.0315285],274.286]];
        _cargoInfo = ["CargoNet_01_box_F",[0,-1.2,0],0];
        [_obj, _side, _composition, _cargoInfo] call FUNC(startingSetup);
    };
    default {
        waitUntil {!isNil QGVAR(HQarray)};
        [_obj] call FUNC(updateTeleportActions);
        
        // run this code each time a new mhq is added or removed from the list of mhq
        [GVAR(HQarray), {params ["_obj", "_side"]; [_obj] remoteExecCall [QFUNC(updateTeleportActions), _side];}, [_obj,_side]] spawn FUNC(arrayUpdateEH);
    };
};