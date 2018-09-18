/**
* Author: James
* log mission start state 
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call writeStartState.sqf;
*
* Server only:
* yes
*
* Public:
* no
*/
#include "script_component.hpp"

/* PARAMS */

/* VALIDATION */

/* CODE BODY */
_log_msg = format["Startbudget: NATO %1 - CSAT %2", GVARMAIN(nato_budget), GVARMAIN(csat_budget)];
["Budget", _log_msg] call FUNC(write);

_log_msg = format["Beginn Waffenruhe: %1 min", (OPT_PARAM_TRUCETIME + OPT_PARAM_FREEZE_TIME) / 60];
["Mission", _log_msg] call FUNC(write);