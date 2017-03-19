/*
	Mission Timeout (Countdown to Missionstart)

	Author: schmingo (OPT MOD Team)

	v2015-03-06 | this script is part of OperationPandoraTrigger ArmA3 script collection
*/

// changed by psycho
private ["_remaining", "_timeout", "_msg1", "_msg2"];

_timeout = _this select 0;							// Zeit der Waffenruhe in Sekunden!
_msg2 = "Die Waffenruhe ist beendet!";

if (MissionStarted) exitWith {};
waitUntil {time > 1};

if (isServer) then {
	["opt_logEvent", format ["########## Startbudget: (NATO %1 | CSAT %2) ##########", opt_west_budget, opt_east_budget]] call tcb_fnc_NetCallEvent;
};

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

/*
// By James: Ersetzt durch Timer in HUD
if (isnil "opt_showCountdown") then {
	opt_showCountdown = {
		
		if (MissionStarted) then {
			["<t size='0.8' shadow='1' color='#ffffff'>Mission gestartet!</t>", (safeZoneX - 0.2), (safeZoneY + 0.3), 3, 1, 0, 2] spawn BIS_fnc_dynamicText;
		};
	};
};
*/

// FOR SERVER ONLY
if (isServer) then {
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
	MissionStarted = true; 
	// side: schaltet Zeit in HUD frei, schaltet opt_countdown frei
	publicVariable "MissionStarted"; 
};

if (local player) then {
	waitUntil {sleep 1; MissionStarted;};
	// Benachrichtigung über Missionsstart
	["<t size='0.8' shadow='1' color='#ffffff'>Mission gestartet!</t>", (safeZoneX - 0.2), (safeZoneY + 0.3), 3, 1, 0, 2] spawn BIS_fnc_dynamicText;
};
