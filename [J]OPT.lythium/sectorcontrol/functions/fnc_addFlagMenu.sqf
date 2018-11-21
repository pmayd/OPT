/**
* Author: James
* fügt allen Offizieren (HL und PL) einen addAction Eintrag für die Flaggenwahl
* zu Missionsbeginn hinzu. Ruft das Skript chooseFlag auf. Wird ausgeblendet,
* sobald die Mission begonnen hat.     
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_addFlagMenu.sqf;
*
*/
#include "script_component.hpp"

if EGVAR(serverclock,missionStarted) exitWith{};

// Mausradmenüeinträge für HL und PL
if (typeOf player in GVARMAIN(officer)) then {
    player addAction [
        format["<t size=""1.5"" color=""#ffffff"">%1</t>", SECTORCONTROL_ACTION_SELECT_FLAG], 
        {[] spawn FUNC(chooseFlag);}, 
        [], 
        6, 
        true, 
        true, 
        "", 
        format["!%1", QEGVAR(serverclock,missionStarted)]
    ];

    // inform player
    _txt = "Bitte eine Flagge über das Mausradmenü wählen.<br/>Dies muss während der Waffenruhe geschehen!";
    ["Wahl der Angriffsflagge", _txt, "yellow"] call EFUNC(gui,message);
};