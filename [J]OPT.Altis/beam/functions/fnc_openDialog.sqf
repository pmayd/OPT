/**
* Description:
* wrapper function to open beam dialog
* triggered via action menu or CBA key
*
* Author:
* James
*
* Arguments:
* None
*
* Return Value:
* None
*
* Server only:
* no
*
* Public:
* yes
*
* Global:
* no 
*
* Sideeffects:
* yes - opens the beam dialog
*
* Example:
* [] call EFUNC(beam,openDialog);
*/
#include "script_component.hpp"

/* PARAMS */

/* VALIDATION */

/* CODE BODY */

private _cond = (
    !dialog and 
    !(player getVariable ["ace_dragging_isDragging", false]) and 
    !(player getVariable ["ace_dragging_isCarrying", false])
);

if (_cond) then 
{
    createDialog "DialogBeam";
};
