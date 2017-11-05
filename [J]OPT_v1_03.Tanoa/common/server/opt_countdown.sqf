/*
	Countdown Timer

	Author: schmingo (OPT MOD Team)

	v2014-11-21 | this script is part of OperationPandoraTrigger ArmA3 script collection
*/

//changed by psycho
private ["_timeElapsed"];
if (isMultiplayer && !isServer) exitWith {};

// Waffenruhe abgelaufen?
if (!missionStarted) exitWith {diag_log format["OPT LOG: ERROR: opt_countdown.sqf started before missionStarted=true!"]};

// calculate first time the dominator (it's needed if assynchrone number of flags are defined)
[civilian, objNull] spawn opt_fnc_setFlagOwner;

// Logge und übertrage Punktestand alle 60 Sekunden, solange Spiel noch läuft
while {_timeElapsed = (serverTime - opt_startTime); (WinEast == 0 &&  WinWest == 0 && Draw == 0 && (OPT_PLAYTIME - _timeElapsed) > 0)} do {

	// Falls es einen Dominator gibt -> Erhöhe Punkte +1
	if (opt_dominator != "none") then {

		if (toUpper(opt_dominator) == "CSAT") then {

			EastPoints = EastPoints + 1;
			publicVariable "EastPoints";
			systemChat "CSAT: +1 Punkt";
			_message = format ["CSAT +1 (NATO %1 | CSAT %2)", WestPoints, EastPoints];
			["opt_eh_server_log_write", ["Punkte", _message]] call CBA_fnc_localEvent;

		} else {

			WestPoints = WestPoints + 1;
			publicVariable "WestPoints";
			systemChat "NATO: +1 Punkt";
			_message = format ["NATO +1 (NATO %1 | CSAT %2)", WestPoints, EastPoints];
			["opt_eh_server_log_write", ["Punkte", _message]] call CBA_fnc_localEvent;
		};
			
	} else {

			_message = format ["no Domination (NATO %1 | CSAT %2)", WestPoints, EastPoints];
			["opt_eh_server_log_write", ["Punkte", _message]] call CBA_fnc_localEvent;

	};

	uiSleep 60;
};

["opt_eh_server_log_write", ["Mission", "Missionzeit abgelaufen"]] call CBA_fnc_localEvent;
["opt_eh_server_printPlayerList",[]] call CBA_fnc_localEvent;
_message = format ["Endbudget: (NATO %1 | CSAT %2)",  opt_west_budget, opt_east_budget];
["opt_eh_server_log_write", ["Budget", _message]] call CBA_fnc_localEvent;
_message = format ["Endpunktestand: (NATO %1 | CSAT %2)",  WestPoints, EastPoints];
["opt_eh_server_log_write", ["Punkte", _message]] call CBA_fnc_localEvent;
call opt_fnc_logPScore;