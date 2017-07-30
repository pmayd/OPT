if (isDedicated || !hasInterface) exitWith {};
if (!(typeOf player in opt_pioniers)) exitWith{};

diag_log format ["%1 --- OPT_Detector_fnc_postInit startet für %2", diag_ticktime, name player];
	
player setVariable ["OPT_Detector_in_use", false];

// addaction menu for mine detector
// only visible when mine detector is in inventory
player addAction [
	"Minendetektor AN" call XOrangeText,
	{
		player forceWalk true;
		player setVariable ["OPT_Detector_in_use", true];
		
		if (currentWeapon player isEqualTo handgunWeapon player) then {
			player switchMove "AmovPercMstpSrasWrflDnon_AmovPercMstpSrasWpstDnon_end"
		};
		player selectWeapon (handgunWeapon player);
		_detector = createVehicle ["Item_MineDetector", (getPosASL player), [], 0, "NONE"];
		_detector attachTo [player, [0.01, 0, 0.6], "LeftHandMiddle1"];
		_detector setVariable ["OPT_needed_item", true, true];
		_detector setDamage 1;
		
		player spawn OPT_Detector_fnc_detect;
	},
	[],
	1.5,
	false,
	true,
	"",
	"'MineDetector' in (items _target) && !(_target getVariable ['OPT_Detector_in_use', false])"
];

player addAction [
	"Minendetektor AUS" call XOrangeText,
	{
		player forceWalk false;
		player setVariable ["OPT_Detector_in_use", false];
		hintSilent "";
		
		{
			if ((typeOf _x) isEqualTo "Item_MineDetector") then {
				_x setVariable ["OPT_needed_item", false, true];
				deleteVehicle _x;
				/*
				if (currentWeapon player isEqualTo primaryWeapon player) then {
					player switchMove "AmovPercMstpSrasWrflDnon_AmovPercMstpSrasWpstDnon_end"
				};
				*/
				player selectWeapon (primaryWeapon player);
			};
			true
		} count (attachedObjects player);
	},
	[],
	1.5,
	false,
	true,
	"",
	"_target getVariable ['OPT_Detector_in_use', true]"
];

diag_log format ["%1 --- OPT_Detector_fnc_postInit beendet", diag_ticktime];