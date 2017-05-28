// Cache player's sid
if (isNull player) then {
	diag_log "OPT Debug: Null player in revive Init found";
};
waitUntil {!isNull player};

FAR_PlayerSide = playerSide;

// Clear event handler before adding it
player removeAllEventHandlers "HandleDamage";
player addEventHandler ["HandleDamage", opt_addons_fnc_HandleDamage];

player setVariable ["FAR_isUnconscious", 0, true];
player setVariable ["FAR_isStabilized", 0, true];
player setVariable ["FAR_isDragged", 0, true];
player setVariable ["tcb_healer", objNull, true];
player setCaptive false;
FAR_isDragging = false;
tcb_ais_medequip_array = [];

closeDialog 5566;
closeDialog 5651;

[true] call opt_addons_fnc_toggleTFAR;

if (!opt_far_f_r) then {
	["tfar_removeMapMarker", player] call tcb_fnc_NetCallEvent;
} else {
	opt_far_f_r = false;
};

[] spawn opt_addons_fnc_PlayerActions;