
/**
* Description:
* add given unit to the list of editable objects for curators
*
* Author:
* James
*
* Arguments:
* 0: <OBJECT> unit to add to list
*
* Return Value:
* None
*
* Server only:
* yes - addCuratorEditableObjects has to be called on server
*
* Public:
* yes
*
* Global:
* no - only server effect
*
* Sideeffects:
* add unit to list of editable objects for listed curators
*
* Example:
* [player] call EFUNC(common,addToCurator);
*/
#include "script_component.hpp"

/* PARAMS */
params
[
   ["_unit", objNull, [objNull], 1]
];

/* VALIDATION */
if (_unit isEqualTo objNull) exitWith{};

/* CODE BODY */
[zeus_ziv1, zeus_ziv2, zeus_ziv3] apply {
    if !(_unit isEqualTo _x) then
    {
        _x addCuratorEditableObjects [[_unit], false];
    };

};