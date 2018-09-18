/**
* Author: James
* read stored data from server. If empty, create new hash.
*
* Arguments:
* None
*
* Return Value:
* 0: <HASH> CBA Hash read from server or newly created
*
* Example:
* [] call opt_persistence_fnc_getHash.sqf;
*
* Server only:
* yes
*
* Public:
* yes
*/
#include "script_component.hpp"

/* PARAMS */

/* VALIDATION */

/* CODE BODY */
private _hash = [QGVAR(hash), nil] call EFUNC(database,getVar);

if (!isNil "_hash") then {
    GVAR(hash) = _hash;
} else {
    GVAR(hash) = HASHCREATE;
};

