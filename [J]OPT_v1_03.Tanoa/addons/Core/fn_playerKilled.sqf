params [
	"_victim",
	"_killer"
];

[_victim, [missionNamespace, "tcb_inv"]] call BIS_fnc_saveInventory;
{_victim removeWeapon _x; true} count (weapons _victim);
if ('B_UavTerminal' in (items _victim + assignedItems _victim)) then {
	_victim unassignItem "B_UavTerminal";
	_victim removeItem "B_UavTerminal";
	_victim removeWeapon "B_UavTerminal";
};
if ('O_UavTerminal' in (items _victim + assignedItems _victim)) then {
	_victim unassignItem "O_UavTerminal";
	_victim removeItem "O_UavTerminal";
	_victim removeWeapon "O_UavTerminal";
};

//removeAllActions _victim;

if (dialog) then {
	[] spawn {
		while {dialog} do {
			closeDialog 5566;
			closeDialog 5651;
			closeDialog 0;
		};
	};
};

[_victim, _killer] spawn {
	params [
		"_victim",
		"_killer"
	];
	
	private _pos = [(getPosATL _victim select 0)-(vectorDir _victim select 0)*3,(getPosATL _victim select 1)-(vectorDir _victim select 1)*3,(getPosATL _victim select 2)+1];
	titleCut ["","BLACK IN",1];

	private _deadcam = "Camera" camCreate (position _victim);
	_deadcam cameraEffect ["internal","back"];
	showCinemaBorder true;
	_deadcam camPrepareTarget _victim;
	_deadcam camPreparePos _pos;
	_deadcam camPrepareFOV 0.7;
	_deadcam camCommitPrepared 0;
	
	_delay = getMissionConfigValue ["respawndelay", 0];

	if (_delay > 10) then {
		_quote = selectRandom opt_killcam_quotes;
		[_quote select 0, _quote select 1, _delay - 1] spawn OPT_Core_fnc_quote;
	};
	waitUntil {camCommitted _deadcam};

	if ((_killer == player) or (!alive _killer) or (isNull _killer)) then {
		_deadcam camPrepareTarget _victim;
		_deadcam camsetrelpos [-3, 20, 10];
		_deadcam camPrepareFOV 0.474;
		_deadcam camCommitPrepared 20;
		waitUntil {alive player};
		player cameraEffect ["terminate","back"];
		camDestroy _deadcam;
	} else {
		sleep 1;
		_deadcam camCommand "inertia on";
		_deadcam camPrepareTarget (vehicle _killer);
		_deadcam camsetrelpos [-3, 20, 10];
		_deadcam camPrepareFOV 1;
		_deadcam camCommitPrepared 10;
		waitUntil {alive player};
		player cameraEffect ["terminate","back"];
		camDestroy _deadcam;
	};
};

//playMusic "";			musike?!