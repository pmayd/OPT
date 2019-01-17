/**
* Description:
* add a new CBA keybind (default F2) for all clients to open beam dialog
* condition is that the player is within one of the beam triggers
*
* Author:
* James
*
* Arguments:
* None
*
* Return Value:
* None
*
* Server only:
* no
*
* Public:
* no - should be called only once by XEH_PostInit.sqf at mission start
*
* Global:
* no
*
* Sideeffects:
* yes - add new CBA keybind that can be configured by client in the addons settings
*
* Example:
* [] call EFUNC(beam,postInit);
*/
#include "script_component.hpp"

/* PARAMS */

/* VALIDATION */
if (!hasInterface) exitWith{};

/* CODE BODY */
/*
* https://cbateam.github.io/CBA_A3/docs/files/keybinding/fnc_addKeybind-sqf.html
*/
[
    "OPT", 
    QGVAR(cba_addKeybind_beam_dialog), 
    ["Beam-Dialog öffnen", "Öffnet den Beam-Dialog im Fahnenbereich."], 
    {
        if ( ({vehicle player in list _x} count GVAR(beam_trigger)) > 0 ) then 
        {
            [] call FUNC(openDialog);
        };
        
    }, 
    {}, 
    [
        DIK_F2, 
        [false, false, false] // [shift, ctrl, alt]
    ]
] call CBA_fnc_addKeybind;
