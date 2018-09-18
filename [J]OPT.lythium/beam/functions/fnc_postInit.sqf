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

if (hasInterface) then {

    /*
    * https://cbateam.github.io/CBA_A3/docs/files/keybinding/fnc_addKeybind-sqf.html
    */
    [
        "OPT", 
        QGVAR(cba_open_beam_dialog), 
        ["Beam-Dialog öffnen", "Öffnet den Beam-Dialog im Fahnenbereich."], 
        {
            if ( vehicle player in ((list nato_trigger_beam) + (list csat_trigger_beam)) ) then {
                [] call FUNC(openDialog);
            };
            
        }, 
        {}, 
        [
            DIK_F2, 
            [false, false, false] // [shift, ctrl, alt]
        ]
    ] call CBA_fnc_addKeybind;

};
