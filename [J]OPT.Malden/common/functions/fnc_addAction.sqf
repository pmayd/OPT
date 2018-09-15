/**
* Author: James
* add action entry to unit and store id via setVariable
*
* Arguments:
* 0: <OBJECT> unit or vehicle
* 1: <ARRAY> arguments for addAction command
* 2: <STRING> Name of ID that is stored with unit/object
*
* Return Value:
* None
*
* Example:
* [player, [...], "myID"] call fnc_addAction.sqf;
*
* Server only:
* no
*
* Public:
* yes
*
* Global:
* no
*/
#include "script_component.hpp"

/* PARAMS */
params [
    ["_obj", objNull, [objNull], 1],
    ["_args", [], [[]]],
    ["_varName", "", ["s"], 1]
];

/* VALIDATION */
if (_obj isEqualTo objNull or _args isEqualTo []) exitWith{};

/* CODE BODY */

private _id = _obj addAction _args;
// make id of add action entry available through object var
if !(_varName isEqualTo "") then {
    _obj setVariable [_varName, _id];
};
