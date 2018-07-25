/**
* Author: James
* main script for handling HandleRating time and ending mission
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [parameter] call fnc_countdown.sqf;
*
*/
#include "script_component.hpp"

// Waffenruhe abgelaufen?
if !GVARMAIN(missionStarted) exitWith {LOG_1("OPT LOG: ERROR: opt_countdown.sqf started before missionStarted=true!");};

// Logge und übertrage Punktestand alle 60 Sekunden, solange Spiel noch läuft
while {_timeElapsed = (serverTime - GVAR(startTime)); (GVARMAIN(csat_win) == 0 && GVARMAIN(nato_win) == 0 && GVARMAIN(draw) == 0 && (OPT_PARAM_PLAYTIME - _timeElapsed) > 59)} do {

	// Falls es einen Dominator gibt -> Erhöhe Punkte +1
	if !(GVARMAIN(dominator) isEqualTo sideUnknown) then {

		if (GVARMAIN(dominator) isEqualTo east) then {

			GVARMAIN(csat_points) = GVARMAIN(csat_points) + 1;
			publicVariable QGVARMAIN(csat_points);
			systemChat "CSAT: +1 Punkt";
			_message = format ["CSAT +1 (NATO %1 | CSAT %2)", GVARMAIN(nato_points), GVARMAIN(csat_points)];
			["Punkte", _message] remoteExecCall [QEFUNC(write), 2, false];

		};

        if (GVARMAIN(dominator) isEqualTo west) then {

			GVARMAIN(nato_points) = GVARMAIN(nato_points)  + 1;
			publicVariable QGVARMAIN(nato_points);
			systemChat "NATO: +1 Punkt";
			_message = format ["NATO +1 (NATO %1 | CSAT %2)", GVARMAIN(nato_points), GVARMAIN(csat_points)];
			["Punkte", _message] remoteExecCall [QEFUNC(write), 2, false];
		};
			
	} else {

			_message = format ["Kein Dominator (NATO %1 | CSAT %2)", GVARMAIN(nato_points), GVARMAIN(csat_points)];
			["Punkte", _message] call EFUNC(log,write);

	};

	uiSleep 60;
};

// wait last seconds exactly until mission ends
waitUntil { _timeElapsed = (serverTime - GVAR(startTime)); (OPT_PARAM_PLAYTIME - _timeElapsed) < 0; };

[] call EFUNC(log,writeEndState);

[] remoteExec [QFUNC(endMission), -2, true]; // call end script on all clients

//"SideScore" call BIS_fnc_endMissionServer;
