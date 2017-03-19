//
// Farooq's Revive 1.5
//

//------------------------------------------//
// Parameters - Feel free to edit these
//------------------------------------------//

// Seconds until unconscious unit bleeds out and dies. Set to 0 to disable.
FAR_BleedOut = 360;

// Show killer's name (only local to the killed)
FAR_EnableDeathMessages = true;

// Enable 3D icons
tcb_ais_show_3d_icons = true;

// Enable markers
tcb_downedMarkers = true;

// Enable hint to show distance of next medic
FAR_checkNearbyMedics = false;

SRS_damageThreshold =  0.95;   // damage threshold before being knocked out (0->1)

/*
	0 = Only medics can revive
	1 = All units can revive
	2 = Same as 1 but a medikit is required to revive
	3 = Same as 0 but a medikit is required to revive
*/
FAR_ReviveMode = 3;




//------------------------------------------//
FAR_isDragging = false;
FAR_Debugging = true;
tcb_draw3D_reset_done = false;
opt_far_dm_running = false;
opt_far_score_delay = false;
opt_far_f_r = true;

if (isDedicated) exitWith {};


// Player Initialization
[] spawn {
    waitUntil {!isNull player};	
	[] spawn opt_addons_fnc_playerInit;
	player addEventHandler ["Respawn", {[] spawn opt_addons_fnc_playerInit}];
	
	waitUntil {!isNull (findDisplay 46)};
	(findDisplay 46) displayAddEventHandler ["KeyDown", {_this call opt_addons_fnc_keyUnbind}];
};

// Drag & Carry animation fix
[] spawn {
	while {true} do {
		if (animationState player == "acinpknlmstpsraswrfldnon_acinpercmrunsraswrfldnon" || {animationState player == "helper_switchtocarryrfl"} || {animationState player == "AcinPknlMstpSrasWrflDnon"}) then {
			if (FAR_isDragging) then {
				player switchMove "AcinPknlMstpSrasWrflDnon";
			} else {
				player switchMove "amovpknlmstpsraswrfldnon";
			};
		};
		sleep 3;
	};
};


// 3D Marker
[] spawn {
	waitUntil {tcb_draw3D_reset_done};
	if (tcb_ais_show_3d_icons) then {
		_icons = addMissionEventHandler ["Draw3D", {
			{
				if ((_x distance player) < 30 && {_x getVariable ["FAR_isUnconscious", 0] == 1} && {_x != player} && {side player == side _x}) then {
					drawIcon3D ["\a3\ui_f\data\map\MapControl\hospital_ca.paa", [0.6,0.15,0,0.8], _x, 0.5, 0.5, 0, format["%1 (%2m)", name _x, ceil (player distance _x)], 0, 0.02];
				};
			} forEach playableUnits;
		}];
	};
};


////////////////////////////////////////////////
// [Debugging] Add revive to playable AI units
////////////////////////////////////////////////
if (!FAR_Debugging || isMultiplayer) exitWith {};

{
	if (!isPlayer _x) then 
	{
		_x addEventHandler ["HandleDamage", opt_addons_fnc_HandleDamage];
		_x setVariable ["FAR_isUnconscious", 0, true];
		_x setVariable ["FAR_isStabilized", 0, true];
		_x setVariable ["FAR_isDragged", 0, true];
	};
} forEach switchableUnits;