/**
* Author: James
* log all player/clients that have connected since beginning.
* log name, side, and UID
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_writePlayerList.sqf;
*
* Server only:
* yes
*
* Public:
* yes
*/
#include "script_component.hpp"

/* VALIDATIOn */

/* CODE BODY */
private _cat = "Fraktionsübersicht";
GVAR(playerList) apply {
    private _message = format["%1 (%2), PUID %3", _x select 1, _x select 2, _x select 0];
    [_cat, _message] call FUNC(write);

};
