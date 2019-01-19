/**
* Description:
* initialize all ACE dragging settings for a given object 
* settings are taken from setupCargoSpaceAndSize.sqf
* if an object is not recognized, then it is not draggable or carriable
*
* Author:
* James
*
* Arguments:
* 0: <TYPE> object to be initialized
*
* Return Value:
* <BOOLEAN> true - initialization successful, false - otherwise
*
* Server only:
* no
*
* Public:
* yes
*
* Global:
* no - ace_dragging_fnc_setDraggable and ace_dragging_fnc_setCarryable seem to be local commands
*
* Sideeffects:
* change ACE behavior via ace_dragging_fnc_setDraggable and ace_dragging_fnc_setCarryable
* change offset of crates when dragged or carried according to setupCargoSpaceAndSize.sqf
* Example:
* [ammobox] call EFUNC(cargo,initDragging);
*/
#include "script_component.hpp"

/* PARAMS */
params 
[
   ["_item", objNull, [objNull], [1]]
];

/* VALIDATION */
if (_item isEqualTo objNull) exitWith{false};

/* CODE BODY */
private _type = typeOf _item;

// set drag and carry flags
private _index = (GVAR(canBeDragged) apply {toLower (_x select 0)}) find toLower _type;
if (_index != -1) then 
{
    (GVAR(canBeDragged) select _index) params 
    [
        "_class", 
        ["_offset", [0, 4, 0.2]], 
        ["_dir", 0]
    ];

    [_item, true, _offset, _dir] call ace_dragging_fnc_setDraggable; // only local?

} 
else 
{
    [_item, false] call ace_dragging_fnc_setDraggable;

};

_index = (GVAR(canBeCarried) apply {toLower (_x select 0)}) find toLower _type;
if (_index != -1) then 
{
    (GVAR(canBeCarried) select _index) params 
    [
        "_class", 
        ["_offset", [0, 3, 0.2]], 
        ["_dir", 0]
    ];
    
    [_item, true, _offset, _dir] call ace_dragging_fnc_setCarryable; // only local?

} 
else 
{
    [_item, false] call ace_dragging_fnc_setCarryable;

};

true