/**
* Author: James
* initialize player mission EH
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_initPlayerMissionEH.sqf;
*
*/
#include "script_component.hpp"

addMissionEventHandler ["EntityRespawned", {
    params ["_newEntity", "_oldEntity"];

    // respawn costs
    if !(_oldEntity isEqualTo objNull) then {
        
        // Kosten für Seite abziehen + log
        private _cost = [] call FUNC(respawnCost);

	    [QEGVAR(common,updateBudget), [PLAYER_SIDE, _cost, "-"]] call CBA_fnc_serverEvent;
        [QEGVAR(log,write), ["Respawn", format["Spieler: %1 - Kosten: %2", PLAYER_NAME, _cost]]] call CBA_fnc_serverEvent;

    };

}];