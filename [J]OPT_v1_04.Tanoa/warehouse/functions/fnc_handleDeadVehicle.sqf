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
* [car, player1, player2] call fnc_handleDeadVehicle.sqf;
*
*/
#include "script_component.hpp"

params ["_vec", "_killer", "_instigator"];

// log destroyed vehicle and killer
[QEGVAR(log,kill), [_vec, _instigator]] call CBA_fnc_serverEvent;	

// delete all wrecks within the base safezone
if ((_vec distance2D (getmarkerPos "respawn_west") < 200) or (_vec distance2D (getmarkerPos "respawn_east") < 200)) then {
    [_vec] spawn {
        params ["_vec"];
        sleep 5;
        deleteVehicle _vec;

        // message only for those within a 200m radius
        _name = getText(configFile >> "CfgVehicles" >> typeOf _vec >> "displayName");
        _txt = format["Es gab einen Unfall. Das Wrack von %1 wurde entsorgt.", _name];
        [QEGVAR(gui,message), ["Unfall in der Basis", _txt, "red"], playableUnits select {_x distance _vec < 200}] call CBA_fnc_targetEvent;
    };
};