if (!isServer) exitWith {};
#include "..\..\..\setup\setup.sqf"

params ["_vecType", "_spawnID", "_isFlat"];

// create Vehicle
_spawnpos = if (typeName _spawnID == "OBJECT") then {getPosATL _spawnID} else {_spawnID};
_vec = createVehicle [_vecType, _spawnpos, [], 0, "CAN_COLLIDE"];

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

_vec addMPEventHandler ["MPKilled", {
	(_this select [0,2]) call tcb_fnc_handleDeadVehicle;
}];

_vec addEventHandler ["GetIn", {
	/*  
	  vehicle: Object - Vehicle the event handler is assigned to
    position: String - Can be either "driver", "gunner" or "cargo"
    unit: Object - Unit that entered the vehicle

(Since Arma 3 v1.36)

    turret: Array - turret path
    */
    params ["_vec", "_pos", "_unit", "_turret"];

    #ifdef __ONLY_PILOTS_CAN_FLY__
			if (OPT_ONLY_PILOTS == 1) then {
				if (!(typeOf _unit in opt_pilots) && {!(typeOf _unit in ["O_Helipilot_F","B_Helipilot_F"])}) then {
					if (_vec isKindOf "Air" && (_unit == assignedDriver _vec || _unit == _vec turretUnit [0])) then {
						if (!(typeOf _vec in ["Steerable_Parachute_F", "NonSteerable_Parachute_F"])) then {
							_unit action ["GetOut", _vec];
							TitleRsc ["only_pilots", "plain", 0.5];
						};
					};
				};
			};
			
		#endif

		#ifdef __ONLY_CREW_CAN_DRIVE__
			if (OPT_ONLY_CREW == 1) then {
				if (!(typeOf _unit in opt_crew) && {!(typeOf _unit in ["O_crew_F","B_crew_F"])}) then {
					if (_unit == driver _vec || _unit == gunner _vec || _unit == commander _vec) then {
						if (typeOf _vec in opt_crew_vecs || _vec isKindOf "Tank") then {
							_unit action ["GetOut", _vec];
							TitleRsc ["only_crew", "plain", 0.5];
						};
					};
				};
			};

		#endif
}];


// fügt auf allen clients einen Add Action Eintrag für umgekippte Fahrzeuge hinzu
// ersetzt player add action in onPlayerRespawn (viel performanter, da kein pulling)
if (_vec isKindOf "AllVehicles") then {
	["opt_eh_client_add_action", [_vec, ["Fahrzeug aufrichten" call XTuerkiesText, "call opt_fnc_unFlip", [], 0, false, true, "", "[_target, _this] call opt_fnc_flipCheck"]]] call CBA_fnc_globalEvent;
};

// Create Vehicle Crew
_uavs = [
	"OPT_B_UAV_02_F",
	"OPT_B_UAV_02_CAS_F",
	"OPT_B_UAV_02_light_F",
	"OPT_O_UAV_02_F",
	"OPT_O_UAV_02_CAS_F",
	"OPT_O_UAV_02_light_F",
	"OPT_B_UGV_01_F",
	"OPT_B_UGV_01_rcws_F",
	"OPT_O_UGV_01_F",
	"OPT_O_UGV_01_rcws_F",
	"B_UCSV_01",
	"O_UCSV_01",
	"OPT_B_UAV_01_F",
	"OPT_O_UAV_01_F"
];

if (_vecType in _uavs) then {
	createVehicleCrew (_vec);
	_vec setSkill 0.8;
};

//_FARPS = ["OPT_Land_Pod_Heli_Transport_04_repair_F", "OPT_B_Slingload_01_Repair_F"];
//if (_vecType in _FARPS) then {_vec addAction [("<t color=""#3FAF6C"">" + ("FARP Aufstellen") + "</t>"),'addons\opt3_farp\FARP_check.sqf', [2], 6, false, true]};

_vec setDamage 0;