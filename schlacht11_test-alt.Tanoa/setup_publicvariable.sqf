// setup PublicVariable
// executed only from the Server one time
// define all public variables here


//["tcb_targets", 0] call tcb_fnc_NetSetJIP;

// defined trough vehiclePool
//{publicVariable _x} forEach ["opt_vehiclesNato", "opt_choppersNato", "opt_armoredNato", "opt_vehiclesCsat", "opt_choppersCsat", "opt_armoredCsat", "opt_suppliesNato", "opt_suppliesCsat"];

// Budget wird im Trainingsmodus überschrieben und auf unendlich gesetzt!

opt_west_budget = 2000000;
opt_east_budget = 2000000;

if (OPT_TRAINING == 1) then {
	opt_west_budget = 1e10;
	opt_east_budget = 1e10;
};

publicVariable "opt_west_budget";
publicVariable "opt_east_budget";

opt_startTime = serverTime;			// nicht time! time ist 0, da time Zeit von Missionsbeginn mitteilt. serverTime hingegen wird
// immer synchronisiert und beinhaltet Zeit seit Serverstart
publicVariable "opt_startTime"; // gibt allen Clients die Startzeit des Servers bekannt
EastPoints		= 0;
playTime = OPT_PLAYTIME;
truceTime = OPT_TRUCETIME;
publicVariable "EastPoints";
WestPoints		= 0;
publicVariable "WestPoints";
Draw			= 0;
publicVariable "Draw";
WinEast			= 0;
publicVariable "WinEast";
WinWest			= 0;
publicVariable "WinWest";
currentdate = daytime;
publicVariable "currentdate";
MissionStarted = false;
publicVariable "MissionStarted";
opt_dominator = "none";
publicVariable "opt_dominator";

// define standard sector owner
{
	if (!isNil {_x}) then {
		if (_x != objNull) then {
			_x setVariable ["owner", east, true];
		};
	};
} forEach OPT_CSAT_FLAGs;
{
	if (!isNil {_x}) then {
		if (_x != objNull) then {
			_x setVariable ["owner", west, true];
		};
	};
} forEach OPT_NATO_FLAGs;