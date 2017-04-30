/*
	Mission Timeout (Countdown to Missionstart)

	Author: schmingo (OPT MOD Team)

	v2015-03-06 | this script is part of OperationPandoraTrigger ArmA3 script collection
*/

// changed by psycho
params ["_timeout"];							// Zeit der Waffenruhe in Sekunden!
private ["_remaining", "_msg1", "_msg2"];

_msg2 = "Die Waffenruhe ist beendet!";

if (missionStarted) exitWith {};

waitUntil {time > 1};

// FOR ALL CLIENTS
"opt_timeoutMsg" addPublicVariableEventHandler {[] call opt_showCountdown};

if (isnil "opt_timeFormat") then {
	opt_timeFormat = {
		private ["_minutes", "_seconds"];

		_minutes = 0;
		_seconds = 0;
		_seconds = _this;
		
		if (_seconds > 59) then {
			_minutes = floor (_seconds / 60);
			_seconds = _seconds - (_minutes * 60);
		};
		if (_seconds < 10) then {
			_seconds = format ["0%1", _seconds];
		};
		if (_minutes < 10) then {
			_minutes = format ["0%1", _minutes];
		};
		[_minutes, _seconds]
	};
};

// FOR SERVER ONLY
if (isServer) then {

	waitUntil {serverTime < 1e6};
	opt_startTime = serverTime;			// nicht time! time ist 0, da time Zeit von Missionsbeginn mitteilt. serverTime hingegen wird
	// immer synchronisiert und beinhaltet Zeit seit Serverstart
	publicVariable "opt_startTime"; // gibt allen Clients die Startzeit des Servers bekannt

	_log_msg = format["NATO %1 - CSAT %2", opt_west_budget, opt_east_budget];
	["opt_eh_server_log_write", ["Startbudget", _log_msg]] call CBA_fnc_serverEvent;

	// By James: ersetze while durch for, da wir genau wissen, wie viele Schritte wir brauchen
	// bestimme Zeit, die bis hierher vergangen ist. Es kann nicht angenommen werden
	// dass Time bei 0 startet. Da der Client mit der vergangenen Zeit rechnet, muss hier
	// ebenfalls die korrekte Zeit berechnet werden. Wie immer serverTime - opt_startTime.
	private _timeElapsed = (serverTime - opt_startTime);
	truceTime = OPT_TRUCETIME - _timeElapsed;
	_ticker = 0;

	for "_t" from ceil(_timeout-_timeElapsed) to 0 step -1 do {
		truceTime = truceTime - 1;	// verringert truceTime pro Iteration um 1 Sekunde
		// if (local player) then {[] call opt_showCountdown};
		uisleep 1;

	};

	// nach Ablauf der Waffenruhe (timeout), starte Mission und gib Variable an alle Clients weiter
	missionStarted = true; 
	// side: schaltet Zeit in HUD frei, schaltet opt_countdown frei
	publicVariable "missionStarted"; 

	// Beginnt mit dem Counter für die Spielzeit
	// startet erst, wenn MissionStarted = true gesetzt wird
	execVM "common\server\opt_countdown.sqf";
};

if (local player) then {
	waitUntil {missionStarted;};
	// Benachrichtigung über Missionsstart
	["<t size='0.8' shadow='1' color='#ffffff'>Mission gestartet!</t>", (safeZoneX - 0.2), (safeZoneY + 0.3), 3, 1, 0, 2] spawn BIS_fnc_dynamicText;
};
