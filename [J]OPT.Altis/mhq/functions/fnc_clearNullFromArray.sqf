/**
* Author: James
* delete vehicles from array that have become null values
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_clearNullFromArray.sqf;
*
*/
#include "script_component.hpp"

waitUntil {!isNil QGVAR(HQarray)};
for "_i" from 0 to 1 step 0 do
{
    waitUntil {{isNull _x} count GVAR(HQarray) > 0};
    CHHQ_HQarray = CHHQ_HQarray - [objNull];
};