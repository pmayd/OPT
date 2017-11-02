if (!isServer) exitWith {};
#include "..\..\..\setup\setup.sqf"

params ["_vecType", "_spawnID", "_isFlat"];

// create Vehicle
_spawnpos = if (typeName _spawnID == "OBJECT") then {getPosATL _spawnID} else {_spawnID};

_vec = createVehicle [_vecType, _spawnpos, [], 0, "NONE"];

//added by psycho - check for free space to place the vehicle
_sizeOfVec = sizeOf _vecType;
if (surfaceIsWater _spawnpos) then {
	_isFlat = (position _vec) isFlatEmpty [_sizeOfVec / 2, 50, 0.7, _sizeOfVec, 2, false, _vec];
} else {
	_isFlat = (position _vec) isFlatEmpty [_sizeOfVec / 2, 80, 0.7, _sizeOfVec, 0, false, _vec];
};
if (count _isFlat > 1) then {
	_posv1 = _isFlat;
	_posv1 set [2, 0];
};

if (typeName _spawnID == "OBJECT") then {_vec setDir (getDir _spawnID)};
if (surfaceIsWater _spawnpos) then {
	_vec setPosASL [getPos _vec select 0, getPos _vec select 1, 0];
} else {
	_vec setPosATL [getPos _vec select 0, getPos _vec select 1, ((getPos _vec select 2) + .1)];
};

_vec addEventHandler ["Killed", {
	_this call tcb_fnc_handleDeadVehicle;
}];

//datalink-test-eintrag, kallek
_vec setVehicleReportOwnPosition true;
_vec setVehicleReportRemoteTargets true;
_vec setVehicleReceiveRemoteTargets true;

// fügt auf allen clients einen Add Action Eintrag für umgekippte Fahrzeuge hinzu
// ersetzt player add action in onPlayerRespawn (viel performanter, da kein pulling)
if (_vec isKindOf "AllVehicles") then {
	["opt_eh_client_add_action", [
		_vec, 
		["Fahrzeug aufrichten" call XTuerkiesText, "call opt_fnc_unFlip", [], 0, false, true, "", "[_target, _this] call opt_fnc_flipCheck"]]
	] call CBA_fnc_globalEvent;
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
                _vec setVariable ["opt_var_vec_pilot", _unit, true];
            };

            // speichere aktuellen Ort an der Einheit
            _unit setVariable ["opt_var_vec_loc", getPosASL _vec, false];
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
            private _dis = (getPosASL _vec) distance2D (_unit getVariable "opt_var_vec_loc");
            if ( _pos in ["cargo", "gunenr"] && (_dis > 500) ) then {
                _uid = getPlayerUID _unit;
                _id = (opt_ListOfPlayers apply {_x select 0}) find _uid;
                _nameUnit = (opt_ListOfPlayers select _id) select 1;

                _uid = getPlayerUID (_vec getVariable "opt_var_vec_pilot");
                _id = (opt_ListOfPlayers apply {_x select 0}) find _uid;
                _namePilot = (opt_ListOfPlayers select _id) select 1;
                private _message = format[
                    "%1 (%2) wurde von %3 (%4) eingeflogen (%5 m)", 
                    _nameUnit, 
                    _unit getVariable "opt_var_playerSide",  
                    _namePilot, 
                    (_vec getVariable "opt_var_vec_pilot") getVariable "opt_var_playerSide",
                    _dis
                ];

                ["opt_eh_server_log_write", ["Transport", _message]] call CBA_fnc_serverEvent;

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

if (_vecType in (_uavs + opt_big_uavs)) then {
	createVehicleCrew (_vec);
	_vec setSkill 0.8;
};

_vec setDamage 0;