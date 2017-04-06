/*
	Countdown Timer

	Author: schmingo (OPT MOD Team)

	v2014-11-21 | this script is part of OperationPandoraTrigger ArmA3 script collection
*/

//changed by psycho
private ["_breaker","_ticker"];
if (isMultiplayer && !isServer) exitWith {};

waitUntil {MissionStarted};
["opt_logEvent", "########## Mission wurde gestartet ##########"] call tcb_fnc_NetCallEvent;

// calculate first time the dominator (it's needed if assynchrone number of flags are defined)
[civilian, objNull] spawn opt_fnc_setFlagOwner;

_breaker = false;
_ticker = 0;

// playTime unverändert, da wir die volle Zeit spielen wollen!
// Daher von playTime in 1 sec Schritten bis 0.
for "_i" from (playTime) to 0 step -1 do {

	// Bestimme noch zu spielende Zeit: Gesamtzeit - Waffenruhe - Zeit seit Missionsstart = Gesamtzeit - vergangene Zeit
	private _timeElapsed = (serverTime - opt_startTime);
	playTime = OPT_PLAYTIME  - _timeElapsed;
	_ticker = _ticker + 1;

	// every 60 seconds: locking for domination, sync time to clients and transmit public vars
	if (_ticker >= 60) then {

		_ticker = 0;

		if (opt_dominator != "none") then {
			if (toUpper(opt_dominator) == "CSAT") then {
				EastPoints = EastPoints + 1;
				publicVariable "EastPoints";
				systemChat "CSAT: +1 Punkt";
				["opt_logEvent", format ["########## Punkte: CSAT +1 (NATO %1 | CSAT %2) ##########", WestPoints, EastPoints]] call tcb_fnc_NetCallEvent;
			} else {
				WestPoints = WestPoints + 1;
				publicVariable "WestPoints";
				systemChat "NATO: +1 Punkt";
				["opt_logEvent", format ["########## Punkte: NATO +1 (NATO %1 | CSAT %2) ##########", WestPoints, EastPoints]] call tcb_fnc_NetCallEvent;
			};
			_breaker = false;
		} else {
			if (!_breaker) then {
				["opt_logEvent", format ["########## no Domination (NATO %1 | CSAT %2) ##########", WestPoints, EastPoints]] call tcb_fnc_NetCallEvent;
				_breaker = true;
			};
		};
	};
	uiSleep 1;
};

["opt_logEvent", "########## Missionzeit abgelaufen ##########"] call tcb_fnc_NetCallEvent;
["opt_logEvent", format ["########## Endbudget: (NATO %1 | CSAT %2) ##########", opt_west_budget, opt_east_budget]] call tcb_fnc_NetCallEvent;
["opt_logEvent", format ["########## Endpunktestand: (NATO %1 | CSAT %2) ##########", WestPoints, EastPoints]] call tcb_fnc_NetCallEvent;
call opt_fnc_logPScore;