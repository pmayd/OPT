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
        QGVAR(cba_open_waffenwechsel_dialog), 
        ["Waffenwechsel-Dialog öffnen", "Öffnet den Waffenwechsel-Dialog im Fahnenbereich."], 
        {
            private _triggerUnits = (list csat_trigger_Waffenwechsel1) + (list nato_trigger_Waffenwechsel1) + (list csat_trigger_Waffenwechsel2) + (list nato_trigger_Waffenwechsel2) + (list csat_trigger_Waffenwechsel1_1) + (list nato_trigger_Waffenwechsel1_1)+ (list csat_trigger_Waffenwechsel2_1) + (list nato_trigger_Waffenwechsel2_1);
            if (player isEqualTo assignedDriver vehicle player and (vehicle player in _triggerUnits)) then {
                [] call FUNC(openDialog);
            };
            
        }, 
        {}, 
        [
            DIK_F3, 
            [false, false, false] // [shift, ctrl, alt]
        ]
    ] call CBA_fnc_addKeybind;

};