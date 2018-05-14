/**
* Author: James
* initialize server mission EH
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_initServerMissionEH.sqf;
*
*/
#include "script_component.hpp"

GVAR(EH_PlayerConnected) = addMissionEventHandler ["PlayerConnected", {
    /*
    id: Number - unique DirectPlay ID (very large number). It is also the same id used for user placed markers (same as _id param)
    uid: String - getPlayerUID of the joining client. The same as Steam ID (same as _uid param)
    name: String - profileName of the joining client (same as _name param)
    jip: Boolean - didJIP of the joining client (same as _jip param)
    owner: Number - owner id of the joining client (same as _owner param)
    */
    params ["_id", "_uid", "_name", "_jip", "_owner"];
    //LOG_2("PlayerConnected - jip: %1 - owner: %2",_jip,_owner);
    
    if (OPT_PARAM_SHOW_INTRO and !OPT_PARAM_TRAINING and !(_jip)) then {
        [QGVAR(startIntro), [], playableUnits select {owner _x == _owner}] call CBA_fnc_targetEvent;    
    };

}];

GVAR(EH_EntityRespawned) = addMissionEventHandler ["EntityRespawned", {
    params ["_newEntity", "_oldEntity"];

    // respawn costs
    if !(_oldEntity isEqualTo objNull) then {

        // add to zeus
        [QEGVAR(common,addToCurator), [_newEntity]] call CBA_fnc_serverEvent;
        
        // Kosten für Seite abziehen + log
        private _cost = [] call FUNC(respawnCost);

	    [QEGVAR(common,updateBudget), [UNIT_NAME(_newEntity), UNIT_SIDE(_newEntity), typeOf _newEntity, _cost, "-", true]] call CBA_fnc_localEvent;
        [QEGVAR(log,write), ["Respawn", format["Spieler: %1", UNIT_NAME(_newEntity)]]] call CBA_fnc_localEvent;

        // reset earplugs
        [QEGVAR(common,setVariable), [QGVAR(inUse), 1], _newEntity] call CBA_fnc_targetEvent;

    };

    // renew zeus
    [QEGVAR(common,renewCurator), [_newEntity]] call CBA_fnc_localEvent;

}];

GVAR(EH_EntityKilled) = addMissionEventHandler ["EntityKilled", {
    params ["_killed", "_killer", "_instigator", "_useEffects"];

    // Funkgeräte löschen
    _inventory = (assignedItems _killed) + (items _killed);
    if ((backpack _killed find "TFAR_" == 0) or (backpack _killed find "tf_" == 0)) then {
        removeBackpackGlobal _killed;
    };


    {
        if ((_x find "TFAR_" == 0) or (_x find "tf_" == 0)) then {
            _killed unassignItem _x;
            _killed removeItem _x;

        };
    } foreach _inventory;

}];

// delete body if unit disconnects
GVAR(EH_PlayerDisconnected) = addMissionEventHandler ["PlayerDisconnected", {
    /*
        id: Number - unique DirectPlay ID (very large number). It is also the same id used for user placed markers (same as _id param)
        uid: String - getPlayerUID of the leaving client. The same as Steam ID (same as _uid param)
        name: String - profileName of the leaving client (same as _name param)
        jip: Boolean - didJIP of the leaving client (same as _jip param)
        owner: Number - owner id of the leaving client (same as _owner param)
    */
    params ["_id", "_uid", "_name", "_jip", "_owner"];

    {
        if (_x getVariable [QGVARMAIN(ownerID), 0] == _owner) then {
            deleteVehicle _x;
        };

    } forEach playableUnits;
}];