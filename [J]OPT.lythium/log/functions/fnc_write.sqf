/**
* Author: James
* write log message into Server RPT, using a specific format defined by macro LOG_MESSAGE
*
* Arguments:
* 0: <STRING> category of log
* 1: <STRING> actual log message
*
* Example:
* ["REVIVE", "Jemand wurde wiederbelebt"] call opt_log_fnc_write;
* The message can be built using format
*
* Server only:
* yes
*
* Public:
* yes
*/
#include "script_component.hpp"

/* VALIDATIOn */

/* PARAMS */ 
params [
    ["_category", "", [""], 1],
    ["_message", "", [""], 1]
];

/* VALIDATION */
if (_category isEqualTo "" or _message isEqualTo "") exitWith{};

/* CODE BODY */
private _timestamp = [serverTime - EGVAR(serverclock,startTime)] call CBA_fnc_formatElapsedTime;

diag_log LOG_MESSAGE(_category,_timestamp,_message);