/**
* Author: James
* initialize scripts and commands before world has initialized
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_preInit.sqf;
*
*/
#include "script_component.hpp"

#define MAX_RADIUS_OPEN_BEAM_DIALOG 10

if (hasInterface) then {

    /*
    * https://cbateam.github.io/CBA_A3/docs/files/keybinding/fnc_addKeybind-sqf.html
    */
    [
        "OPT", 
        QGVAR(cba_open_beam_dialog), 
        ["Open Beam Dialog", "Öffnet den Beam-Dialog im Fahnenbereich"], 
        {
            if (player in (list nato_trigger_beam) or player in (list csat_trigger_beam)) then {
                [] call FUNC(openDialog);
            };
            
        }, 
        {}, 
        [
            DIK_LMENU, 
            [false, false, false] // [shift, ctrl, alt]
        ]
    ] call CBA_fnc_addKeybind;

};