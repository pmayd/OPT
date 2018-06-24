/**
* Author: James
* remove action with given action ID from unit/object
*
* Arguments:
* 0: <OBJECT> unit or object
* 1: <STRING> action ID to be removed
*
* Return Value:
* None
*
* Example:
* [player, "myID"] call fnc_removeAction.sqf;
*
*/
#include "script_component.hpp"

params [
    ["_obj", objNull, [objNull], 1],
    ["_varName", "", ["s"], 1]
];

if (_obj isEqualTo objNull) exitWith{};

_obj removeAction (_obj getVariable [_varName, -1]);