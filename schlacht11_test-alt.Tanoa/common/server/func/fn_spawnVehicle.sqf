if (!isServer) exitWith {};
params ["_unitType", "_spawnID", "_isFlat"];

// create Vehicle
_spawnpos = if (typeName _spawnID == "OBJECT") then {getPosATL _spawnID} else {_spawnID};
_unit = createVehicle [_unitType, _spawnpos, [], 0, "NONE"];

//added by psycho - check for free space to place the vehicle
_svec = sizeOf _unitType;
if (surfaceIsWater _spawnpos) then {
	_isFlat = (position _unit) isFlatEmpty [_svec / 2, 50, 0.7, _svec, 2, false, _unit];
} else {
	_isFlat = (position _unit) isFlatEmpty [_svec / 2, 80, 0.7, _svec, 0, false, _unit];
};
if (count _isFlat > 1) then {
	_posv1 = _isFlat;
	_posv1 set [2, 0];
};

if (typeName _spawnID == "OBJECT") then {_unit setDir (getDir _spawnID)};
if (surfaceIsWater _spawnpos) then {
	_unit setPosASL [getPos _unit select 0, getPos _unit select 1, 0];
} else {
	_unit setPosATL [getPos _unit select 0, getPos _unit select 1, ((getPos _unit select 2) + .1)];
};

_unit addMPEventHandler ["MPKilled", {
	private "_vec";
	_vec = _this select 0;
	if (isNil "_vec") exitWith {diag_log "undefined vehicle destroyed"};
	_faction = (getText(configFile >> 'CfgVehicles' >> typeOf _vec >> 'faction'));
	_name = (getText(configFile >> 'CfgVehicles' >> typeOf _vec >> 'displayName'));
	_txt = format ['########## Fahrzeug zerstoert: %1 %2 ##########', _faction, _name];
	diag_log _txt;
}];

/*
_unit addEventHandler ["Killed", {
	[_this select 0] call opt_fnc_vehicleLogEvent;
	
	[_this select 0] spawn {
		(_this select 0) removeAllEventHandlers 'killed';
		sleep 240;
		deleteVehicle (_this select 0);
	};
}];
*/

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

if (_unitType in _uavs) then {
	createVehicleCrew (_unit);
	_unit setSkill 0.8;
};

//_FARPS = ["OPT_Land_Pod_Heli_Transport_04_repair_F", "OPT_B_Slingload_01_Repair_F"];
//if (_unitType in _FARPS) then {_unit addAction [("<t color=""#3FAF6C"">" + ("FARP Aufstellen") + "</t>"),'addons\opt3_farp\FARP_check.sqf', [2], 6, false, true]};

_unit setDamage 0;