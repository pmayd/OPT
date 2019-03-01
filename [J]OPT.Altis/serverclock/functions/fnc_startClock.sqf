/**
* Description:
* start global mission glock
* manage truce time and mission time
*
* Author:
* James
*
* Arguments:
* None
*
* Return Value:
* None
*
* Server only:
* yes - mission time is only managed by server and synced to clients when needed
*
* Public:
* no - script should only be called once by XEH_PostInit.sqf from server
*
* Global:
* no - effects are local on server until broadcasted to clients
*
* Sideeffects:
* start truce time with GVAR(truceStarted) = true + publicVar
* start main mission with GVARMAIN(startMission) = true + publicVar
* ends mission when time is over or one of winning conditions is true
* send a gui message on all clients
* log mission start state
* log rest of mission time
* log mission end state
*
* Example:
* [] spawn EFUNC(serverclock,startClock);
*/
#include "script_component.hpp"

/* PARAMS */

/* VALIDATION */
// exit if startTime is already set -> means script is called twice
if (GVAR(startTime) != 0) exitWith{};
if (EGVAR(serverclock,missionStarted)) exitWith {};
waitUntil { time > 1};

/* CODE BODY */
GVAR(startTime) = serverTime;
publicVariable QGVAR(startTime);

// freezeTime
// independent of all other times, always runs full freezeTime minutes
_log_msg = format["Beginn Freeze: %1 min", EGVAR(freeze,freezeTime)];
["Mission", _log_msg] call EFUNC(log,write);

for "_t" from ceil(FREEZE_TIME_IN_SECONDS) to 0 step -1 do
{
    uisleep 1;
};

// truceTime
// broadcast start of truceTime to all clients
GVAR(truceStarted) = true;
publicVariable QGVAR(truceStarted);

[] call EFUNC(log,writeStartState);

UPDATE_TIME;
// truceTime is independent of all other times, always runs full truceTime minutes
_log_msg = format["Beginn Waffenruhe: %1 min", GVAR(truceTime)];
["Mission", _log_msg] call EFUNC(log,write);

for "_t" from ceil(TRUCE_TIME_IN_SECONDS) to 0 step -1 do
{
    uisleep 1;
};

// nach Ablauf der Waffenruhe (timeout), starte Mission und gib Variable an alle Clients weiter
GVAR(missionStarted) = true;
publicVariable QGVAR(missionStarted);

// Benachrichtigung über Missionsstart an alle Clients
["Mission", "Mission gestartet", "green"] remoteExecCall [QEFUNC(gui,message), -2, false];

UPDATE_TIME;
// playTime IS dependent on truceTime, but not freezeTime!
_log_msg = format["Beginn Rest-Spielzeit: %1 min", PLAY_TIME_LEFT / 60];
["Mission", _log_msg] call EFUNC(log,write);

// begin with countdown of mission time
// decrease time in minutes by one for each minute
private _minuteCounter = 0;
for "_t" from ceil(PLAY_TIME_LEFT / 60) to 0 step -1 do 
{
	if !(MISSION_IS_RUNNING) exitWith{};

	// call all functions that were registered for running each minute
	GVAR(registeredCallbacks) apply 
	{
		call compile format["[] call %1", _x];
	};

	uiSleep 60;
    UPDATE_TIME;
};

// wait last seconds exactly until mission ends
waitUntil
{
    PLAY_TIME_LEFT < 0;
};

[] call EFUNC(log,writeEndState);

[] remoteExec [QEFUNC(mission,endMission), -2, true]; // call end script on all clients


