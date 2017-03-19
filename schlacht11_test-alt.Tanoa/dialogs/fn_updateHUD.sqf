// from AAS, changed by psycho

// include setup
#include "../setup.sqf"

// positions for info display which includes:
#define PLAYERSLABEL_X      0.02 	// number of players
#define FRAMELABEL_X        0.28 	// avg frames
#define HEADINGLABEL_X      0.25 	// score
#define TIMERLABEL_X        0.47 	// time remaining
#define FRAMELABEL_X        0.28 	// avg frames
#define BUDGETLABEL_X       0.38 	// budget

#define HEADINGLABEL_Y      0.95	// score
#define PLAYERSLABEL_Y      0.95	// number of players
#define TIMERLABEL_Y        0.95	// time remaining
#define FRAMELABEL_Y        0.95	// avg frames
#define BUDGETLABEL_Y       0.95	// budget


disableSerialization;
_currentCutDisplay = uiNamespace getVariable "opt_HudDisplay";


//--------------------- get settings on whether to display extra labels --------------
	
	
//--------------------- update clock ---------------------------------------
_control = _currentCutDisplay displayCtrl 5090;
#ifdef __HUD_TIMER__

	private "_timeStr";
	private _timeElapsed = (serverTime - opt_startTime);
	private _playTime = OPT_PLAYTIME - _timeElapsed;
	private _truceTime = OPT_TRUCETIME - _timeElapsed;

	if (MissionStarted) then {

		// Mission gestartet - Zeige verbleibende Spielzeit
		_timeLeft = [_playTime] call CBA_fnc_formatElapsedTime;

		if (_playTime > 0) then {

			_timeStr = format ["Time: %1", _timeLeft];
			_control ctrlSetTextColor [1, 1, 1, 0.9];
		} else {

			_timeStr = "Time: 00:00";
			_control ctrlSetTextColor [1, 0, 0, 0.9];
		};
	} else {

		// Mission noch nicht gestartet - Zeige verbleibende Zeit der Waffenruhe
		_timeLeft = [_truceTime] call CBA_fnc_formatElapsedTime;

		if (_truceTime > 0) then {

			_timeStr = format ["Waffenruhe: %1", _timeLeft];
			_control ctrlSetTextColor [1, 0, 0, 0.9];
		} else {

			_timeStr = "Waffenruhe: 00:00";
			_control ctrlSetTextColor [1, 1, 1, 0.9];
		}
	};

	// Anzeige updaten
	// Update Text
	_control ctrlSetText _timeStr;
	// Färbe Uhr in den letzten 5 Minuten rot
	if (_playTime < 300) then {
		_control ctrlSetTextColor [0.9, 0.2, 0.2, 1];
	};

#else

	_control ctrlShow false;
#endif
	
//--------------------- update players ------------------------------------------
_control = _currentCutDisplay displayCtrl 5101;
#ifdef __HUD_NUMBER_PLAYERS__

	_playersStr = format ["NATO %1 vs %2 CSAT (total: %3)", playersNumber west, playersNumber east, (playersNumber west) + (playersNumber east)];

	// Anzeige updaten
	// Update Text
	_control ctrlSetText _playersStr;	

#else

	_control ctrlShow false;
#endif
//----------------------- update score --------------------------------------------
_control = _currentCutDisplay displayCtrl 5102;
#ifdef __HUD_SCORE__

	_scoreStr = format ["Score: NATO %1:%2 CSAT", WestPoints, EastPoints];

	// Anzeige updaten
	// Update Text
	_control ctrlSetText _scoreStr;	

#else

	_control ctrlShow false;
#endif

//--------------------- update Frames ------------------------------------------
_control = _currentCutDisplay displayCtrl 5091;
#ifdef __HUD_FPS__

	_frameStr = format ["Fps: %1", round (diag_fps)];

	// Anzeige updaten
	// Update Text
	_control ctrlSetText _frameStr;

#else

	_control ctrlShow false;
#endif

//--------------------- update Budget ------------------------------------------
_control = _currentCutDisplay displayCtrl 5092;
#ifdef __HUD_BUDGET__

	_side_Budget = if (playerSide == west) then {opt_west_budget} else {opt_east_budget};
	if (_side_Budget < 400000) then {
		_control ctrlSetTextColor [0.9, 0.2, 0.2, 1];
	};
	_BudgetStr = if (_side_Budget > 999999) then {
		_side_Budget = _side_Budget / 1000000;
		format ["Budget: %1 Mio. €", str(_side_Budget)];	// psycho: budget muss numerisch reduziert werden um Darstellung aufrecht zu erhalten
	} else {
		format ["Budget: %1 €", str(_side_Budget)];
	};

	// Anzeige updaten
	// Update Text
	_control ctrlSetText _BudgetStr;

#else

	_control ctrlShow false;
#endif
