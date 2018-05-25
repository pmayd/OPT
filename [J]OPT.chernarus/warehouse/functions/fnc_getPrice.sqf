/**
* Author: James
* read sell price of object from vehicle setup arrays
* price depends on player side
*
* Arguments:
* 0: <STRING> class name to look up
*
* Return Value:
* 0: <NUMBER> sell price
*
* Example:
* ["classname"] call fnc_getPrice.sqf;
*
*/
#include "script_component.hpp"

params [
    ["_class", "", [""], [1]]
];

if (_class isEqualTo "") exitWith {0};

private _unitCost = 0;
private _index = (GVAR(all) apply {toLower (_x select 0)}) find (toLower _class);

if (_index != -1) then {
    private _friendOrEnemy = 2; // default is own side
    if (
        ((GVAR(allNato) apply {toLower (_x select 0)} find (toLower _class) != -1) and PLAYER_SIDE == east) 
        or 
        ((GVAR(allCsat) apply {toLower (_x select 0)} find (toLower _class) != -1) and PLAYER_SIDE == west)
    ) then {
        _friendOrEnemy = 3;
    };

    _unitCost = (GVAR(all) select _index) select _friendOrEnemy;
    if (typeName _unitCost != "SCALAR") then {
        _unitCost = 0;
    };

};

_unitCost