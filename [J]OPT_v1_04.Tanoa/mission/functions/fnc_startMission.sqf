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

if (missionStarted) exitWith {};

waitUntil {time > 1};

// SERVER ONLY
if (isServer) then {

	opt_startTime = serverTime;			// nicht time! time ist 0, da time Zeit von Missionsbeginn mitteilt. serverTime hingegen wird
	// immer synchronisiert und beinhaltet Zeit seit Serverstart
	publicVariable "opt_startTime"; // gibt allen Clients die Startzeit des Servers bekannt

	_log_msg = format["Startbudget: NATO %1 - CSAT %2", opt_west_budget, opt_east_budget];
	["opt_eh_server_log_write", ["Budget", _log_msg]] call CBA_fnc_localEvent;

	_log_msg = format["Begin Waffenruhe: %1 min", (OPT_TRUCETIME + OPT_FREEZE_TIME) / 60];
	["opt_eh_server_log_write", ["Mission", _log_msg]] call CBA_fnc_serverEvent;

	// By James: ersetze while durch for, da wir genau wissen, wie viele Schritte wir brauchen
	// bestimme Zeit, die bis hierher vergangen ist. Es kann nicht angenommen werden
	// dass Time bei 0 startet. Da der Client mit der vergangenen Zeit rechnet, muss hier
	// ebenfalls die korrekte Zeit berechnet werden. Wie immer serverTime - opt_startTime.
	private _timeElapsed = (serverTime - opt_startTime);
	// Waffenruhe wird um mögl. Freezetime verlängert, z.B. Waffenruhe 10 Minuten + 1 Minute Freeze
	truceTime = (OPT_TRUCETIME + OPT_FREEZE_TIME) - _timeElapsed;

	for "_t" from ceil(truceTime) to 0 step -1 do {
		// if (local player) then {[] call opt_showCountdown};
		uisleep 1;
	};

	// nach Ablauf der Waffenruhe (timeout), starte Mission und gib Variable an alle Clients weiter
	missionStarted = true; 
	// side: schaltet Zeit in HUD frei, schaltet opt_countdown frei
	publicVariable "missionStarted"; 

	_timeElapsed = serverTime - opt_startTime;
	_log_msg = format["Beginn Rest-Spielzeit: %1 min", (OPT_PLAYTIME - _timeElapsed) / 60];
	["opt_eh_server_log_write", ["Mission", _log_msg]] call CBA_fnc_localEvent;

	// Beginnt mit dem Counter für die Spielzeit
	// startet erst, wenn MissionStarted = true gesetzt wird
    // TODO: einbinden in neue Version
	execVM "common\server\opt_countdown.sqf";
};

// CLIENT ONLY
if (local player) then {
	waitUntil {missionStarted;};
	// Benachrichtigung über Missionsstart
    ["opt_gui_message", ["Mission", "Mission gestartet", "green"]] call CBA_fnc_globalEvent;
};
