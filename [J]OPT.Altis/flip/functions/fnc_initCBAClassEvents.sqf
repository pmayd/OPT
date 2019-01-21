/**
* Description:
* initialize CBA class event handler
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
* no - should be called only once at mission start from XEH_PostInit.sqf
*
* Global:
* no
*
* Sideeffects:
* add action menu item to vehicles (both land and air) to unflip vehicle
*
* Example:
* [] call EFUNC(flip,initCBAClassEvents);
*
*/
#include "script_component.hpp"

/* CLASS EH */
/* EXAMPLE FROM https://github.com/CBATeam/CBA_A3/wiki/Adding-Event-Handlers-to-Classes-of-Objects
["CAManBase", "fired", {systemChat str _this}] call CBA_fnc_addClassEventHandler;
This will show a chat message every time a soldier fires a weapon. It is advised to use CAManBase instead of Man when dealing with soldiers, because Man is the parent class of all animals, including the randomly spawning rabbits, snakes and fish. Using CAManBase slightly reduces the overhead that would happen when any of these spawn (which actually happens pretty frequently).

["AllVehicles", "getIn", {hint str _this}] call CBA_fnc_addClassEventHandler;
This event happens every time a soldier enters a vehicle.
*/


// fügt auf allen clients einen Add Action Eintrag für umgekippte Fahrzeuge hinzu
// ersetzt player add action in onPlayerRespawn (viel performanter, da kein pulling)
["LandVehicle", "Air"] apply
{
    [
        _x,
        "init",
        {
            params ["_vec"];

            _vec addAction
            [
                FLIP_ACTION_UNFLIP_TEXT call XTuerkiesText,
                {
                    params ["_target", "_caller", "_actionId", "_arguments"];
                    [_target] call FUNC(unFlip);
                },
                [],
                0,
                false,
                true,
                "",
                format["[_target, _this] call %1", QFUNC(flipCheck)]
            ];
        },
        nil,
        nil,
        true
    ] call CBA_fnc_addClassEventHandler;
};