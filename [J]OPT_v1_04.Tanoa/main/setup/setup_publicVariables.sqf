// setup PublicVariable
// executed only from the Server one time
// define all public variables here
#include "script_component.hpp"

[] spawn {
	// warte OPT_FREEZE_TIME
	waitUntil {!isNil "opt_startTime"};
	waitUntil {sleep 1; serverTime - opt_startTime > OPT_FREEZE_TIME};
	opt_allow_movement = true;
	publicVariable "opt_allow_movement";
};

// Budget wird im Trainingsmodus überschrieben und auf unendlich gesetzt!
opt_west_budget = __BUDGET_NATO__;
opt_east_budget = __BUDGET_CSAT__;
opt_dispo = __BUDGET_DISPO__; // kann für zusätzliche Einkäufe belastet werden
opt_respawn_cost = __RESPAWN_COST__;

if (OPT_TRAINING == 1) then {
	opt_west_budget = 1e10;
	opt_east_budget = 1e10;
};

publicVariable "opt_west_budget";
publicVariable "opt_east_budget";
publicVariable "opt_dispo";
publicVariable "opt_respawn_cost";

EastPoints		= 0;
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

opt_nato_flags = [];
opt_csat_flags = [];

publicVariable "opt_nato_flags";
publicVariable "opt_csat_flags";