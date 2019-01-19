/**
* Author: James
* condition for teleport action
*
* Arguments:
* add action condition params
*
* Return Value:
* None
*
* Example:
* only called from add action!
*
*/
#include "script_component.hpp"

_target = _this select 0;
_caller = _this select 1;
_veh = _this select 2;

(
    _veh getVariable [QEGVAR(composition,deployed), false] && 
    {!isNil "_veh"} && 
    {alive _veh} && 
    {_caller distance _target < MHQ_TELEPORT_ACTION_DISTANCE} && 
    {vehicle _caller isEqualTo _caller}
)