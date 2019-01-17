/**
* Author: James
* depending on player side, return correct radar container
*
* Arguments:
* None
*
* Return Value:
* 0: <OBJECT> radar container

* Example:
* [] call fnc_getRadar.sqf;
*
*/
#include "script_component.hpp"

private _container = objNull;
switch (PLAYER_SIDE) do
{
    case west:
    {
        _container = GVAR(containerWest);
    };
    case east:
    {
        _container = GVAR(containerEast);
    };
    default {};
};

_container