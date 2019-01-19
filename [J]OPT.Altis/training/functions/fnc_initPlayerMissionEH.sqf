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

if (GVAR(teleport)) then 
{
    player addAction [TRAINING_ACTION_TELEPORT call XGreyText, {[] call FUNC(teleport)}, [], 0, false, true, '', "alive _target"];

    player addAction [
        TRAINING_ACTION_FLAG call XGreyText,
        {createDialog QGVAR(dlg_flag)}, 
        [], 
        0, 
        false, 
        true, 
        '', 
        "alive _target and _target == player"
    ];

};
