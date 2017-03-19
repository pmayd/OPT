/*
	Maintainer scripts - special actions

	Author: Phantom (OPT MOD Team)
		Modified by schmingo (OPT MOD Team)

	v2015-02-06 | this script is part of OperationPandoraTrigger ArmA3 script collection
*/

#define mt_win_dialog 30000

private ["_argument"];

_argument = _this select 0;

switch (_argument) do {
	
	case "teleport": {
		closeDialog 0;
		[] call opt_fnc_teleport;
	};

	case "nodamage": {
		closeDialog 0;
		_vehicle = vehicle player;
		_vehicle allowDamage false;
		_vehicle setFuel 1;
		_vehicle setVehicleAmmo 1;
		player sideChat "Fahrzeug unzerstörbar, betankt und neu bewaffnet.";
	};
	
	case "SM3start": {
		closeDialog 0;
		SM3_started	= true;
		publicVariableServer "SM3_started";
		hintSilent "Sidemission 3 gestartet";
	};
	
	case "bombe": {
		closeDialog 0;
		openMap [true, true];
		mapAnimAdd [0.5, 0.2, getPos player];
		mapAnimCommit;
		onMapSingleClick "[_pos] execVM 'addons\opt3_maintainer\bigBomb.sqf'; onMapSingleClick ''; openMap [true, false]; openMap [false, false]; true;";
	};

	case "winNATO": {
		closeDialog 0;
		WinWest = 1; publicVariable "WinWest";
	};
	
	case "winCSAT": {
		closeDialog 0;
		WinEast = 1; publicVariable "WinEast";
	};
	
	case "unentschieden": {
		closeDialog 0;
		Draw = 1; publicVariable "Draw";
	};

	case "mt_win_dialog": {
		closeDialog 0;
		createDialog "maintainer_win_dialog";
	};

	case "startMission": {
		closeDialog 0;
		MissionStarted = true;
		publicVariable "MissionStarted";
		hint "Mission gestartet";
	};
	
	case "spectator": {
		closeDialog 0;
		openCuratorInterface;
	};
};