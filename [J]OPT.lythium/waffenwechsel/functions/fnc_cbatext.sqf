/**
* Description:
* send message about a unit's actions to specific players
*
* Author:
* Lord
*
* Arguments:
* 0: <OBJECT> unit that has done the action 
* 1: <NUMBER> money the unit spent or got back
* 2: <STRING> action text that was product for the unit
*
* Return Value:
* None
*
* Server only:
* no
*
* Public:
* yes
*
* Global:
* no
*
* Sideeffects:
* players in GVAR(textslotwest) or GVAR(textsloteast) will see the message via GUI component
*
* Example:
* [alpha1, 1000, "Fahrzeug xyz ausgerüstet für 1000€."] call EFUNC(waffenwechsel,cbatext);
*/
#include "script_component.hpp"

/* PARAMS */
params [
    "_unit",
    "_betrag",
    "_txtcl"
];

/* VALIDATION */

/* CODE BODY */
if (PLAYER_SIDE isEqualTo west and typeOf player in  GVAR(textslotwest)) then {
    private _txt = format["%1:%2", _unit, _txtcl];
    ["Ausrüsten", _txt, "green"] call EFUNC(gui,message);        

};
    
if (PLAYER_SIDE isEqualTo east and typeOf player in GVAR(textsloteast)) then {
    private _txt = format["%1:%2", _unit, _txtcl];
    ["Ausrüsten", _txt, "green"] call EFUNC(gui,message);             
};    