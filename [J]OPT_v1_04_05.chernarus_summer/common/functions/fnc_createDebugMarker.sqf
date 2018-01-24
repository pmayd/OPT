/**
 * Author: Dorbedo
 * creates a tracked local marker for debug purpose
 *
 * Arguments:
 * 0: <ARRAY/OBJECT/GROUP> the position where the marker should be created
 * 1: <STRING> marker text
 * 2: <STRING> marker color
 * 3: <STRING> marker type
 * 4: <SCALAR> direction
 *
 * Return Value:
 * <STRING> the created marker
 *
 */

#include "script_component.hpp"

params [
    ["_target", [], [[], objNull, grpNull], [2, 3]],
    ["_text", "", [""]],
    ["_color","",[""]],
    ["_type","",[""]],
    ["_dir",0,[0]]
];

ISNILS(GVARMAIN(debug_marker),[]);

If (_target isEqualTo []) exitWith {};

If (IS_GROUP(_target)) then {
    _target = (leader _target);
};

If (_color isEqualTo "") then {
    If (IS_OBJECT(_target)) then {
        _color = switch (side _target) do {
            case (west) : {"ColorBLUFOR"};
            case (east) : {"ColorOPFOR"};
            case (resistance) : {"ColorIndependent"};
            case (civilian) : {"ColorCivilian"};
            default {"ColorBlack"};
        };
    }else{
        _color = "ColorBlack";
    };
};

If (_type isEqualTo "") then {
    If (IS_OBJECT(_target)) then {
        private _pre = switch (side _target) do {
            case (east) : {"o_"};
            case (resistance) : {"n_"};
            default {"b_"};
        };
        private _post = switch (true) do {
            case ((typeOf vehicle _target) in ["rhsusf_M1083A1P2_B_M2_d_MHQ_fmtv_usarmy"]): {"hq"};
            case (getText(configFile >> "cfgVehicles" >> typeOf _target >> "vehicleclass") in ["MenSniper","MenRecon"]) : {"recon"};
            case (getNumber(configFile >> "CfgVehicles" >> typeOf _target >> "engineer") == 1): {"maint"};
            case ((vehicle _target isKindOf "MBT_01_arty_base_F")or(vehicle _target isKindOf "MBT_01_mlrs_base_F")) : {"art"};
            case ((vehicle _target isKindOf "Wheeled_Apc_F")or(vehicle _target isKindOf "APC_Tracked_02_base_F")or(vehicle _target isKindOf "APC_Tracked_03_base_F")) : {"mech_inf"};
            case (vehicle _target isKindOf "Tank") : {"armor"};
            case (vehicle _target isKindOf "Car") : {"motor_inf";};
            case ((vehicle _target isKindOf "Ship")or(vehicle _target isKindOf "Submarine")) : {"naval"};
            case ((getText(configFile >> "CfgVehicles" >> typeOf (vehicle _target) >> "vehicleClass") == "Autonomous")) : {"uav"};
            case (vehicle _target isKindOf "Plane") : {"plane"};
            case (vehicle _target isKindOf "Air") : {"air"};
            case (vehicle _target isKindOf "Man") : {"inf"};
            case (vehicle _target isKindOf "StaticWeapon") : {"support"};
            default {"unknown"};
        };
        _type = _pre + _post;
    }else{
        _type = "hd_dot";
    };
};

If (IS_OBJECT(_target)) then {
    _target = getPos _target;
};

private _marker = createMarkerLocal [format["DEBUGMARKER_%1", (count GVARMAIN(debug_marker))], _target];
GVARMAIN(debug_marker) pushBack _marker;
_marker setMarkerShapeLocal "ICON";
_marker setMarkerColorLocal _color;
_marker setMarkerTypeLocal _type;
If !(_text isEqualTo "") then {
    _marker setMarkerTextLocal _text;
};
_marker setMarkerDir _dir;
_marker
