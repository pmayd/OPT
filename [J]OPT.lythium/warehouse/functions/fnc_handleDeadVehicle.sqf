/**
* Author: James
* log destroyed vehicle with detailed information
*
* Arguments:
* 0: <OBJECT> - Object the event handler is assigned to
* 1: <OBJECT> - Object that killed the unit. Contains the unit itself in case of collisions
* 2: <OBJECT> - Person who pulled the trigger
* 3: <BOOL> - same as useEffects in setDamage alt syntax
*
* Return Value:
* None
*
* Example:
* [car, killer, instigator] call fnc_handleDeadVehicle.sqf;
*
*/
#include "script_component.hpp"

// TODO: rewrite into killed and damagged EH so we have the source parameter available
params [
    ["_vec", objNull, [objNull], 1],
    ["_source", objNull, [objNull], 1],
    ["_instigator", objNull, [objNull], 1],
    "_useEffects"
];

// log destroyed vehicle and killer
[_vec, _instigator, _source] call EFUNC(log,writeKill);


// delete all wrecks that are within a garbage collector trigger
private _garbageCollectors = allMissionObjects "EmptyDetectorAreaR50" select {str(_x) find "opt_warehouse_garbage_collector" != -1};

if (
        !(_vec isKindOf "CAManBase") and 
        ( ({_vec in list _x} count _garbageCollectors) > 0)
    ) then {
    [_vec] spawn {
        params ["_vec"];
        sleep 5;
        deleteVehicle _vec;

        // message only for those within a 200m radius
        _name = getText(configFile >> "CfgVehicles" >> typeOf _vec >> "displayName");
        _txt = format["Es gab einen Unfall in der Basis.<br/> Das Wrack von %1 wurde entsorgt.", _name];
        ["Unfall", _txt, "red"] remoteExecCall [QEFUNC(gui,message), playableUnits select {_x distance _vec < 200}, false];
    };
};