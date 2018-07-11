/**
* Author: James
* repair a vehicle with rep truck
*
* Arguments:
* 0: <OBJECT> vehicle to repair
*
* Return Value:
* None
*
* Example:
* [vehicle] call fnc_needRepair.sqf;
*
*/
#include "script_component.hpp"

params [["_veh", objNull]];

if (_veh isEqualTo objNull) exitWith {false};

private _truck = vehicle player;
    
// inform player if anything is wrong
if (GVAR(mutexAction)) exitWith {
    ["Feldreparatur", STR_ANOTHER_ACTION, "yellow"] call EFUNC(gui,message);
};
if (_truck getVariable [QGVAR(repair_cargo), 0] <= 0) then {
    ["Feldreparatur", STR_REPAIR_TRUCK_DEPLETED, "yellow"] call EFUNC(gui,message);
};    
if (not alive player or vehicle player == player or speed _veh > 3 or _veh distance _truck > 15 ) exitWith {
    ["Feldreparatur", STR_REPAIR_CONDITIONS, "red"] call EFUNC(gui,message);
};

GVAR(mutexAction) = true;    
private _maxlength = DEFAULT_FULLREPAIR_LENGTH;
private _vehname = getText ( configFile >> "CfgVehicles" >> typeOf(_veh) >> "displayName");
private _length = _maxlength;

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
    [_veh, _truck],
    {
        (_this select 0) params ["_veh", "_truck"];

        ["Feldreparatur", STR_REPAIR_FINISHED, "green"] call EFUNC(gui,message);
        [_veh] remoteExecCall [QFUNC(fullRepair), _veh, false]; // called where vehicle is local!
        _truck setVariable [
            QGVAR(repair_cargo), 
            ((_truck getVariable [QGVAR(repair_cargo), 0]) - (1 / DEFAULT_REPAIR_TRUCK_USES)), 
            true
        ];
        
    },
    {
        ["Feldreparatur", STR_REPAIR_INTERRUPTED, "red"] call EFUNC(gui,message);

    },
    format[STR_REPAIR_MSG_STRING, _length, _vehname],
    {
        (_this select 0) params ["_veh", "_truck"];
        alive player and 
        player getVariable ["FAR_isUnconscious", 0] == 0 and // behebt Fehler, dass bewusstlose Soldaten weiter reparieren // TODO:
        alive _truck and 
        alive _veh and 
        (not isNull (objectParent player)) and
        speed _veh <= 3 and 
        speed _truck <= 3 and
        _veh distance _truck <= 15 
    },
    ["isnotinside"]
] call ace_common_fnc_progressBar;

GVAR(mutexAction) = false;      
