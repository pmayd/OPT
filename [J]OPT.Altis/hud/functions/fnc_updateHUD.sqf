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
private _cutRSC = uiNamespace getVariable QGVAR(display);

waitUntil{ !isNil QEGVAR(serverclock,startTime)};

while {!(_cutRSC isEqualTo displayNull)} do
{
        //--------------------- get settings on whether to display extra labels --------------

    //--------------------- update players ------------------------------------------
    private _control = _cutRSC displayCtrl 5101;
    if (GVAR(numberPlayers)) then
    {

        private _playersStr = format ["Spieler: (N) %1 vs %2 (C)", playersNumber west, playersNumber east];

        // Anzeige updaten
        // Update Text
        _control ctrlSetText _playersStr;
        _control ctrlShow true;

    } else
    {

        _control ctrlShow false;
    };

    //--------------------- update Frames ------------------------------------------
    _control = _cutRSC displayCtrl 5102;
    if (GVAR(fps)) then
    {

        private _frameStr = format ["FPS: %1", round (diag_fps)];

        // Anzeige updaten
        // Update Text
        _control ctrlSetText _frameStr;
        _control ctrlShow true;

    } else
    {

        _control ctrlShow false;
    };

    //--------------------- update Budget ------------------------------------------
    _control = _cutRSC displayCtrl 5103;
    if (GVAR(budget)) then
    {

        [_control] call EFUNC(common,renderBudget);
        _control ctrlShow true;

    } else
    {

        _control ctrlShow false;
    };

    //----------------------- update score --------------------------------------------
    _control = _cutRSC displayCtrl 5104;
    if (GVAR(score)) then
    {

        private _scoreStr = format ["Punkte: (N) %1 : %2 (C)", GVARMAIN(westPoints), GVARMAIN(eastPoints)];

        // Anzeige updaten
        // Update Text
        _control ctrlSetText _scoreStr;
        _control ctrlShow true;

    } else
    {

        _control ctrlShow false;
    };

    //--------------------- update clock ---------------------------------------
    _control = _cutRSC displayCtrl 5105;
    if (GVAR(timer)) then
    {

        // get time from server
        private _timeElapsed = serverTime - EGVAR(serverclock,startTime);

        private _freezeTimeLeft = EGVAR(freeze,freezeTime) * 60 - _timeElapsed;
        private _truceTimeLeft = (EGVAR(serverclock,truceTime) + EGVAR(freeze,freezeTime)) * 60 - _timeElapsed;
        private _playTimeLeft = (EGVAR(serverclock,playTime) + EGVAR(freeze,freezeTime)) * 60 - _timeElapsed;

        private _timeStr = "";
        private _timeLeft = 0;

        if (EGVAR(freeze,on) and _freezeTimeLeft > 0) then
        {
            _timeLeft = [_freezeTimeLeft] call CBA_fnc_formatElapsedTime;

            _timeStr = format ["Missionsvorbereitung: %1", _timeLeft];
            _control ctrlSetTextColor [0.0, 0.0, 0.7, 1];
        };

        if (EGVAR(serverclock,truceStarted) and !EGVAR(serverclock,missionStarted)) then
        {
            _timeLeft = [_truceTimeLeft] call CBA_fnc_formatElapsedTime;

            if (_truceTimeLeft > 0) then
            {

                _timeStr = format ["Waffenruhe: %1", _timeLeft];
                _control ctrlSetTextColor [0.6, 0.1, 0, 1];

            } else
            {

                _timeStr = "Waffenruhe: 00:00";
                _control ctrlSetTextColor [0.7, 0.7, 0.7, 1];

            };

        };

        if (EGVAR(serverclock,missionStarted)) then
        {

            // Mission gestartet - Zeige verbleibende Spielzeit
            _timeLeft = [_playTimeLeft] call CBA_fnc_formatElapsedTime;

            if (_playTimeLeft > 0) then
            {

                _timeStr = format ["Rest-Spielzeit: %1", _timeLeft];
                _control ctrlSetTextColor [0.7, 0.7, 0.7, 1];

            } else
            {

                _timeStr = "Restspielzeit: 00:00";
                _control ctrlSetTextColor [1, 0, 0, 0.9];

            };
        };

        // Anzeige updaten
        // Update Text
        _control ctrlSetText _timeStr;
        // Färbe Uhr in den letzten 5 Minuten rot
        if (_playTimeLeft < 300) then
        {
            _control ctrlSetTextColor [0.9, 0.2, 0.2, 1];
        };

        _control ctrlShow true;

    } else
    {

        _control ctrlShow false;
    };

    sleep GVAR(updateInterval);
};