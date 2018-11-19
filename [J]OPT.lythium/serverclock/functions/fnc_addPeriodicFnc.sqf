/**
* Description:
* add a function to the list of functions that will be called
* each minute by the server clock manager
* 
* Author: 
* James
*
* Arguments:
* 0: <STRING> function name to call
*
* Return Value:
* None
*
* Server only:
* yes - only server changes GVAR(periodicFncs)
*
* Public:
* yes
*
* Global:
* no - effects are local on server
*
* Sideeffects:
* add function name to GVAR(periodicFncs)
* 
* Example:
* ["opt_sectorcontrol_fnc_calcPoints"] call EFUNC(serverclock,addPeriodicFnc);
*/
#include "script_component.hpp"

/* PARAMS */
params [
    ["_fncName", "", ["s"], 1]
];

/* VALIDATION */
if (_fncName isEqualTo "") exitWith{};

/* CODE BODY */
GVAR(periodicFncs) pushBack _fncName;

