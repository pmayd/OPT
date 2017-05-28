// Net Events

//number give's location where the code are executed:  0-every  --  1-server   --   2-client	-- 3-dedicated
[0, "lock_it", {(_this select 0) lock (_this select 1)}] call tcb_fnc_NetAddEvent;
[0, "vehicle_init_global", {call _this}] call tcb_fnc_NetAddEvent;
[0, "opt_logEvent", {diag_log _this}] call tcb_fnc_NetAddEvent;
[0, "far_rotate", {_this setDir 180}] call tcb_fnc_NetAddEvent;
[2, "say3D_sound", {(_this select 0) say3D (_this select 1)}] call tcb_fnc_NetAddEvent;
//[2, "sectorMessage", {_this call opt_fnc_zone_sectorControl_Msg}] call tcb_fnc_NetAddEvent;
[2, "FARPservice", {_psy = [_this] execVM "addons\opt3_farp\service.sqf"}] call tcb_fnc_NetAddEvent;
[2, "sectorControl_Msg", {[_this, (safeZoneX - 0.15), (safeZoneY + 0.3), 3, 1, 0, 3] spawn BIS_fnc_dynamicText}] call tcb_fnc_NetAddEvent;
[2, "FAR_inj_message", {systemChat format ["%1 was injured by %2", name (_this select 0), name (_this select 1)]}] call tcb_fnc_NetAddEvent;
[2, "tfar_mapMarker", {[_this] call opt_addons_fnc_createMarker}] call tcb_fnc_NetAddEvent;
[2, "tfar_removeMapMarker", {[_this] call opt_addons_fnc_removeMarker}] call tcb_fnc_NetAddEvent;
[2, "opt_serverTime", {opt_localServerTimeOffset = (_this - time)}] call tcb_fnc_NetAddEvent;


if (isServer) then {
	["addToCurator", {tcb_gamemaster addCuratorEditableObjects [[_this],false]}] call tcb_fnc_NetAddEventCTS;
	["addToCurator", {tcb_gamemaster addCuratorEditableObjects [[_this],false]}] call tcb_fnc_NetAddEventCTS;
	["vehicleOrder", {_this call opt_fnc_updateVehiclePool}] call tcb_fnc_NetAddEventCTS;
	["maintainer_vehicleOrder", {_this call opt_fnc_SpawnVehicle}] call tcb_fnc_NetAddEventCTS;
	["setNewFlagOwner", {_this call opt_fnc_setFlagOwner}] call tcb_fnc_NetAddEventCTS;
	["addScore", {(_this select 0) addScore (_this select 1)}] call tcb_fnc_NetAddEventCTS;
};
if (!isDedicated) then {
	["playActionNow", {(_this select 0) playActionNow (_this select 1)}] call tcb_fnc_NetAddEventToClients;
};