// setup PublicVariable
// executed only from the Server one time
// define all public variables here
#include "script_component.hpp"

[] spawn {
	// warte OPT_FREEZE_TIME
	waitUntil {!isNil QEGVAR(mission,startTime)};
	waitUntil {sleep 1; serverTime - EGVAR(mission,startTime) > OPT_FREEZE_TIME};
	GVARMAIN(allow_movement) = true;
	publicVariable QGVARMAIN(allow_movement);
};

// Budget wird im Trainingsmodus überschrieben und auf unendlich gesetzt!
GVARMAIN(nato_budget) = __BUDGET_NATO__;
GVARMAIN(csat_budget) = __BUDGET_CSAT__;
GVARMAIN(dispo) = __BUDGET_DISPO__; // kann für zusätzliche Einkäufe belastet werden
GVARMAIN(respawn_cost) = __RESPAWN_COST__;

if (OPT_TRAINING == 1) then {
	GVARMAIN(nato_budget) = 1e10;
	GVARMAIN(csat_budget) = 1e10;
};

publicVariable QGVARMAIN(nato_budget);
publicVariable QGVARMAIN(csat_budget);
publicVariable QGVARMAIN(dispo);
publicVariable QGVARMAIN(respawn_cost);

GVARMAIN(csat_points) = 0;
publicVariable QGVARMAIN(csat_points);
GVARMAIN(nato_points) = 0;
publicVariable QGVARMAIN(nato_points);
GVARMAIN(draw) = 0;
publicVariable QGVARMAIN(draw);
GVARMAIN(csat_win)= 0;
publicVariable QGVARMAIN(csat_win);
GVARMAIN(nato_win) = 0;
publicVariable QGVARMAIN(nato_win);
GVARMAIN(missionStarted) = false;
publicVariable QGVARMAIN(missionStarted);
GVARMAIN(allow_movement) = false;
publicVariable QGVARMAIN(allow_movement);
GVARMAIN(dominator) = sideUnknown;
publicVariable QGVARMAIN(dominator);

GVARMAIN(nato_flags) = [];
GVARMAIN(csat_flags) = [];

publicVariable QGVARMAIN(nato_flags);
publicVariable QGVARMAIN(csat_flags);