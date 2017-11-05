/**
* Author: James
* initialize mission EH
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_initMissionEH.sqf;
*
*/
#include "script_component.hpp"

if (OPT_PARAM_TELEPORT == 1 && OPT_PARAM_TRAINING == 1) then {
    player addAction ["Teleport" call XGreyText, {[] call FUNC(teleport)}, [], 0, false, true, '', "alive _target"];

    addMissionEventHandler ["EntityRespawned", {
        params ["_newEntity", "_oldEntity"];

        _newEntity addAction ["Teleport" call XGreyText, {[] call FUNC(teleport)}, [], 0, false, true, '', "alive _target"];
    }];

};

// TODO:
if (OPT_PARAM_TRAINING == 1) then {
	player addAction ["Flagge versetzen" call XGreyText, {createDialog "FlagDialog"}, [], 0, false, true, '', "alive _target"];

};