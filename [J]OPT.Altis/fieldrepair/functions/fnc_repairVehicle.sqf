/**
* Author: James
* field repair of a vehicle
*
* Arguments:
* 0: <OBJECT> vehicle to repair
*
* Return Value:
* None
*
* Example:
* [vehicle] call fnc_repairVehicle.sqf;
*
*/
#include "script_component.hpp"

params [["_veh", objNull]];

if (_veh isEqualTo objNull) exitWith {false};

// if another action is ongoing
if (GVAR(mutexAction)) exitWith {
    ["Feldreparatur", STR_ANOTHER_ACTION, "yellow"] call EFUNC(gui,message);
};

// if conditions are not met
if (not alive player or (player distance _veh) > 7 or (vehicle player != player) or speed _veh > 3) exitWith {
    ["Feldreparatur", STR_REPAIR_CONDITIONS, "red"] call EFUNC(gui,message);
};

// if player has no tool kit or vehicle was repaired more often than free repair
if (!(typeOf player in GVARMAIN(pioniers)) and (_veh getVariable [QGVAR(longRepairTimes), 0] > 0)) exitWith {
    ["Feldreparatur", STR_NEED_TOOLKIT, "red"] call EFUNC(gui,message);
};

GVAR(mutexAction) = true;

player selectWeapon primaryWeapon player;    // psycho, animation only able to play while primary weapon is in use
sleep 1;
private _lastPlayerState = animationState player;

// player playActionNow "medicStartRightSide";
player playMove "Acts_carFixingWheel";
sleep 0.5;
private _maxlength = (_veh getVariable [QGVAR(longrepair), [_veh] call FUNC(getPartsRepairTime)]) min DEFAULT_FIELDREPAIR_MAX_REP_TIME;
private _vehname = getText ( configFile >> "CfgVehicles" >> typeOf(_veh) >> "displayName");

// was vehicle already repaired?
private _startTime = time;
if (_veh getVariable [QGVAR(repTimeLeft), 0] > 0) then {
    _maxlength = (_veh getVariable QGVAR(repTimeLeft)) max 10; // reduce max length
};

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
    _maxlength,
    [_veh, _startTime, _maxlength],
    {
        (_this select 0) params ["_veh"];

        player switchMove "";
        ["Feldreparatur", STR_REPAIR_FINISHED, "green"] call EFUNC(gui,message);

        [_veh] remoteExecCall [QFUNC(partRepair), _veh, false]; // called where vehicle is local!

        _veh setVariable [QGVAR(longRepairTimes), (_veh getVariable [QGVAR(longRepairTimes), 0]) + 1 , true ];
        _veh setVariable [QGVAR(repTimeLeft), 0, true];
    },
    {   
        (_this select 0) params ["_veh", "_startTime", "_maxlength"];

        ["Feldreparatur", STR_REPAIR_INTERRUPTED, "red"] call EFUNC(gui,message);
        _veh setVariable [QGVAR(repTimeLeft), _maxlength - (time - _startTime), true];
    },
    format[STR_REPAIR_MSG_STRING, _maxlength, _vehname],
    {
        (_this select 0) params ["_veh"];
        alive player and (player distance _veh) < 7 and 
        player getVariable ["FAR_isUnconscious", 0] == 0 and
        isNull objectParent player and 
        speed _veh < 3
    }
] call ace_common_fnc_progressBar;

GVAR(mutexAction) = false; 

true