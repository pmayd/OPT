/**
* Author: James
* script for updating HUD information each forEachMember
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_updateHUD.sqf;
*
*/
#include "script_component.hpp"

disableSerialization;
private _currentCutDisplay = uiNamespace getVariable QGVAR(display);

while {true} do {
        //--------------------- get settings on whether to display extra labels --------------
        
    //--------------------- update players ------------------------------------------
    private _control = _currentCutDisplay displayCtrl 5101;
    if (GVAR(numberPlayers)) then {

        private _playersStr = format ["Spieler: (N) %1 vs %2 (C)", playersNumber west, playersNumber east];

        // Anzeige updaten
        // Update Text
        _control ctrlSetText _playersStr;    
        _control ctrlShow true;

    } else {

        _control ctrlShow false;
    };

    //--------------------- update Frames ------------------------------------------
    _control = _currentCutDisplay displayCtrl 5102;
    if (GVAR(fps)) then {

        private _frameStr = format ["FPS: %1", round (diag_fps)];

        // Anzeige updaten
        // Update Text
        _control ctrlSetText _frameStr;
        _control ctrlShow true;

    } else {

        _control ctrlShow false;
    };

    //--------------------- update Budget ------------------------------------------
    _control = _currentCutDisplay displayCtrl 5103;
    if (GVAR(budget)) then {

        [_control] call EFUNC(common,renderBudget);
        _control ctrlShow true;

    } else {

        _control ctrlShow false;
    };

    //----------------------- update score --------------------------------------------
    _control = _currentCutDisplay displayCtrl 5104;
    if (GVAR(score)) then {
        
        private _scoreStr = format ["Punkte: (N) %1 : %2 (C)", GVARMAIN(nato_points), GVARMAIN(csat_points)];

        // Anzeige updaten
        // Update Text
        _control ctrlSetText _scoreStr;    
        _control ctrlShow true;

    } else {

        _control ctrlShow false;
    };

    //--------------------- update clock ---------------------------------------
    _control = _currentCutDisplay displayCtrl 5105;
    if (GVAR(timer)) then {

        private "_timeStr";
        private _timeElapsed = (serverTime - EGVAR(mission,startTime));
        private _playTime = OPT_PARAM_PLAYTIME - _timeElapsed;
        private _truceTime = (OPT_PARAM_TRUCETIME + OPT_PARAM_FREEZE_TIME) - _timeElapsed;

        if (GVARMAIN(missionStarted)) then {

            // Mission gestartet - Zeige verbleibende Spielzeit
            _timeLeft = [_playTime] call CBA_fnc_formatElapsedTime;

            if (_playTime > 0) then {

                _timeStr = format ["Rest-Spielzeit: %1", _timeLeft];
                _control ctrlSetTextColor [0.7, 0.7, 0.7, 1];
            } else {

                _timeStr = "Time: 00:00";
                _control ctrlSetTextColor [1, 0, 0, 0.9];
            };
        } else {

            // Mission noch nicht gestartet - Zeige verbleibende Zeit der Waffenruhe
            _timeLeft = [_truceTime] call CBA_fnc_formatElapsedTime;

            if (_truceTime > 0) then {

                _timeStr = format ["Waffenruhe: %1", _timeLeft];
                _control ctrlSetTextColor [0.6, 0.1, 0, 1];
            } else {

                _timeStr = "Waffenruhe: 00:00";
                _control ctrlSetTextColor [0.7, 0.7, 0.7, 1];
            }
        };

        // Anzeige updaten
        // Update Text
        _control ctrlSetText _timeStr;
        // Färbe Uhr in den letzten 5 Minuten rot
        if (_playTime < 300) then {
            _control ctrlSetTextColor [0.9, 0.2, 0.2, 1];
        };

        _control ctrlShow true;

    } else {

        _control ctrlShow false;
    };

    sleep GVAR(updateInterval);
};