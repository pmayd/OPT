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

if (GVARMAIN(missionStarted)) exitWith {};

// SERVER ONLY
GVAR(startTime) = serverTime;			// nicht time! time ist 0, da time Zeit von Missionsbeginn mitteilt. serverTime hingegen wird
// immer synchronisiert und beinhaltet Zeit seit Serverstart
publicVariable QGVAR(startTime); // gibt allen Clients die Startzeit des Servers bekannt

_log_msg = format["Startbudget: NATO %1 - CSAT %2", GVARMAIN(nato_budget), GVARMAIN(csat_budget)];
[QEGVAR(log,write), ["Budget", _log_msg]] call CBA_fnc_localEvent;

_log_msg = format["Begin Waffenruhe: %1 min", (OPT_TRUCETIME + OPT_FREEZE_TIME) / 60];
[QEGVAR(log,write), ["Mission", _log_msg]] call CBA_fnc_localEvent;

// By James: ersetze while durch for, da wir genau wissen, wie viele Schritte wir brauchen
// bestimme Zeit, die bis hierher vergangen ist. Es kann nicht angenommen werden
// dass Time bei 0 startet. Da der Client mit der vergangenen Zeit rechnet, muss hier
// ebenfalls die korrekte Zeit berechnet werden. Wie immer serverTime - GVAR(startTime).
private _timeElapsed = (serverTime - GVAR(startTime));
// Waffenruhe wird um mögl. Freezetime verlängert, z.B. Waffenruhe 10 Minuten + 1 Minute Freeze
truceTime = (OPT_TRUCETIME + OPT_FREEZE_TIME) - _timeElapsed;

for "_t" from ceil(truceTime) to 0 step -1 do {
    uisleep 1;
};

// nach Ablauf der Waffenruhe (timeout), starte Mission und gib Variable an alle Clients weiter
GVARMAIN(missionStarted) = true; 
// side: schaltet Zeit in HUD frei, schaltet opt_countdown frei
publicVariable QGVARMAIN(missionStarted); 

// Benachrichtigung über Missionsstart an alle Clients
[QEGVAR(gui,message), ["Mission", "Mission gestartet", "green"]] call CBA_fnc_remoteEvent;

_timeElapsed = serverTime - GVAR(startTime);
_log_msg = format["Beginn Rest-Spielzeit: %1 min", (OPT_PLAYTIME - _timeElapsed) / 60];
[QEGVAR(log,write), ["Mission", _log_msg]] call CBA_fnc_localEvent;

// Beginnt mit dem Counter für die Spielzeit
// startet erst, wenn GVAR(missionStarted) = true gesetzt wird
[] spawn FUNC(countdown);

