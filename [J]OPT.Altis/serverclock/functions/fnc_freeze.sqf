/**
* Description:
* if freeze is enabled, player are freezed until freeze time is over
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
* no - called for each client
*
* Public:
* no - script should only be called once by XEH_PostInit.sqf from server
*
* Global:
* no - effects are local on all clients
*
* Sideeffects:
* freeze player (unable to move and ignore all inputs besides ESC)
* publicVariable QGVAR(freezeStarted)
* 
* Example:
* [] spawn EFUNC(serverclock,freeze);
*/
#include "script_component.hpp"

/* PARAMS */

/* VALIDATION */
if (GVAR(truceStarted)) exitWith{};

/* CODE BODY */
// freeze player
player enableSimulation false;

// wait for end of freezeTime
waitUntil {sleep 1; GVAR(truceStarted)};

// gib Spieler frei
player enableSimulation true;
