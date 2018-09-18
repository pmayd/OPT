/**
* Author: James
* wartet die Waffenruhe ab und startet die Mission
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_startMission.sqf;
*
*/
#include "script_component.hpp"

waitUntil { time > 1};

if (GVARMAIN(missionStarted)) exitWith {};

// SERVER ONLY
// nicht time! time ist 0, da time Zeit von Missionsbeginn mitteilt. serverTime hingegen wird
// immer synchronisiert und beinhaltet Zeit seit Serverstart
GVAR(startTime) = serverTime;
publicVariable QGVAR(startTime); // gibt allen Clients die Startzeit des Servers bekannt

[] call EFUNC(log,writeStartState);

// By James: ersetze while durch for, da wir genau wissen, wie viele Schritte wir brauchen
// bestimme Zeit, die bis hierher vergangen ist. Es kann nicht angenommen werden
// dass Time bei 0 startet. Da der Client mit der vergangenen Zeit rechnet, muss hier
// ebenfalls die korrekte Zeit berechnet werden. Wie immer serverTime - GVAR(startTime).
private _timeElapsed = (serverTime - GVAR(startTime));
// Waffenruhe wird um mögl. Freezetime verlängert, z.B. Waffenruhe 10 Minuten + 1 Minute Freeze
truceTime = (OPT_PARAM_TRUCETIME + OPT_PARAM_FREEZE_TIME) - _timeElapsed;

for "_t" from ceil(truceTime) to 0 step -1 do {
    uisleep 1;
};

// nach Ablauf der Waffenruhe (timeout), starte Mission und gib Variable an alle Clients weiter
GVARMAIN(missionStarted) = true; 
// side: schaltet Zeit in HUD frei, schaltet opt_countdown frei
publicVariable QGVARMAIN(missionStarted); 

// Benachrichtigung über Missionsstart an alle Clients
["Mission", "Mission gestartet", "green"] remoteExecCall [QEFUNC(gui,message), -2, false];

_timeElapsed = serverTime - GVAR(startTime);
_log_msg = format["Beginn Rest-Spielzeit: %1 min", (OPT_PARAM_PLAYTIME - _timeElapsed) / 60];
["Mission", _log_msg] call EFUNC(log,write);

// Beginnt mit dem Counter für die Spielzeit
// startet erst, wenn GVAR(missionStarted) = true gesetzt wird
[] spawn FUNC(countdown);

