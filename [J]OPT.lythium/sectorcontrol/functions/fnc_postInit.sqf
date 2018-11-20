/**
* Author: James
* call all necessary script files after mission has started
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_postInit.sqf;
*
*/
#include "script_component.hpp"

if (isServer) then {

    // register callback function for server clock
    [QFUNC(calcPoints)] call EFUNC(serverclock,registerCallback);
    
    [] spawn {
        waitUntil{EGVAR(serverclock,missionStarted)};

        // start flag setup (setting owner)
        [] call FUNC(setupFlag);

        // calculate first time the dominator (it's needed if assynchrone number of flags are defined)
        [sideUnknown, objNull] call FUNC(setFlagOwner);
    };
};

if (hasInterface) then {

    /*
    * https://cbateam.github.io/CBA_A3/docs/files/keybinding/fnc_addKeybind-sqf.html
    */
    [
        "OPT", 
        QGVAR(cba_capture_flag), 
        ["Flagge ziehen", "Flagge ziehen, wenn anvisiert."], 
        {
            if (
                cursorObject in (GVARMAIN(nato_flags) + GVARMAIN(csat_flags)) and
                [cursorObject, player] call FUNC(captureFlagCondition)
            ) then {
                [cursorObject, player] call FUNC(captureFlag);
            };
            
        }, 
        {}, 
        [
            DIK_F, 
            [false, false, false] // [shift, ctrl, alt]
        ]
    ] call CBA_fnc_addKeybind;

};