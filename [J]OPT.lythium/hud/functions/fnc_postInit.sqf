/**
* Author: James
* initialize CBA Keybind for HUD
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
#include "\A3\editor_f\Data\Scripts\dikCodes.h"

/*
* https://cbateam.github.io/CBA_A3/docs/files/keybinding/fnc_addKeybind-sqf.html
*/
[
    "OPT", 
    QGVAR(cba_toggle_hud), 
    ["HUD ein-/ausblenden", "Blendet das HUD am unteren Bildschirmrand ein und aus"], 
    {
        [] call FUNC(toggleHUD);
    }, 
    {}, 
    [
        DIK_F1, 
        [false, false, false] // [shift, ctrl, alt]
    ]
] call CBA_fnc_addKeybind;
