/**
* Author: James
* heal player up to 25%
*
* Arguments:
* 0: <OBJECT> unit that called the action
*
* Return Value:
* None
*
* Example:
* [player] call fnc_handleFirstAid.sqf;
*
*/
#include "script_component.hpp"

params ["_caller"];

if (_caller getVariable ["FAR_isUnconscious", 0] == 1) exitWith {};

_caller setVariable ["FAR_healer", _caller, true];
FAR_healerStopped = false;

_caller selectWeapon primaryWeapon _caller;
sleep 1;
_caller playAction "medicStart"; // endless loop until we call "medicStop"


[_caller, _caller] call FUNC(medicEquipment);

sleep 1;

/*        
    * Arguments:
    * 0: Total Time (in game "time" seconds) <NUMBER>
    * 1: Arguments, passed to condition, fail and finish <ARRAY>
    * 2: On Finish: Code called or STRING raised as event. <CODE, STRING>
    * 3: On Failure: Code called or STRING raised as event. <CODE, STRING>
    * 4: (Optional) Localized Title <STRING>
    * 5: Code to check each frame (Optional) <CODE>
    * 6: Exceptions for checking EFUNC(common,canInteractWith) (Optional)<ARRAY>
*/

[
    FAR_REVIVE_FIRST_AID_TIME,
    [_caller],
    {
        (_this select 0) params ["_caller"];

        //_patient setDamage FAR_REVIVE_FIRST_AID_MIN_DAMAGE; -> has to be argument local 
        private _multiplier = _caller getVariable ["FAR_firstAidMultiplicator", 0];

        _caller setDammage ((FAR_REVIVE_FIRST_AID_MIN_DAMAGE - 0.01 + _multiplier * FAR_REVIVE_FIRST_AID_MULTIPLIER) min 0.9);

        _caller setVariable ["FAR_firstAidMultiplicator", _multiplier + 1, true];
        
    },
    {
        (_this select 0) params ["_caller"];

        if (_caller getVariable "FAR_isUnconscious" == 0) exitWith {
            ["San-System", FAR_REVIVE_ACTION_REVIVE_CANCLED, "red"] call EFUNC(gui,message);
        };

    },
    format[FAR_REVIVE_ACTION_FIRST_AID_BAR_TEXT, FAR_REVIVE_FIRST_AID_TIME],
    {
        (_this select 0) params ["_caller"];

        alive _caller and
        _caller getVariable "FAR_isUnconscious" == 0 and
        !FAR_healerStopped

    }
] call ace_common_fnc_progressBar;

_caller setVariable ["FAR_healer", objNull, true]; 

_caller playAction "medicStop";

[] call FUNC(clearGarbage);

true