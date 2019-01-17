/**
* Description:
* open waffenwechsel dialog
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
* no
*
* Example:
* [] call EFUNC(waffenwechsel,openDialog);
*/
#include "script_component.hpp"

/* PARAMS */

/* VALIDATION */

/* CODE BODY */
if (!dialog) then 
{
    createdialog QGVAR(Dialog);
};