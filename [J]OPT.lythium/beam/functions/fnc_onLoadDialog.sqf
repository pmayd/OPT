/**
* Description:
* initialize beam dialog and fill listbox with available options
* if component is disabled, only options with level -1 are available
* after mission start, only options with level -1 are available
*
* Author:
* Lord
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
* no - should be called via onLoad from beam dialog
*
* Global:
* no 
*
* Sideeffects:
* fill variable GVAR(box) with options to beam
* fill listbox of beam dialog with all options of GVAR(box)
*
* Example:
* [] call EFUNC(beam,onLoadDialog);
*/
#include "script_component.hpp"

/* PARAMS */

/* VALIDATION */

/* CODE BODY */
disableSerialization;

private _display = findDisplay DIALOG_BEAM_IDD;
private _lb = _display displayCtrl DIALOG_BEAM_LB_IDC;

//Zeitabgelaufen check
private _orte = [];
if (PLAYER_SIDE == east) then 
{ 
    _orte = GVAR(locations_east); 

} 
else 
{ 
    _orte = GVAR(locations_west);

};

// if component is disabled -> only allow locations with level equal -1
GVAR(box) = _orte select {(_x select 2) == -1};
if (GVAR(on)) then 
{
    // nach Waffenruhe nur noch Orte mit -1
    if (!EGVAR(serverclock,missionStarted)) then 
    {
        GVAR(box) append (_orte select {(_x select 2) > 0}); // only locations with level greater 0 (1,2,3 possible)
    };
};

//Boxen mit Orte füllen
{
    private _loc = _x;
    private _lvl = _loc select 2;

    private _index = lbAdd [DIALOG_BEAM_LB_IDC, format["%1", (_loc select 1)]]; // readable name
    _lb lbSetColor [_index, DIALOG_BEAM_LB_COLOR_DEFAULT];
    
    if (_lvl == 1) then 
    { 
        _lb lbSetColor [_index, DIALOG_BEAM_LB_COLOR_LVL_ONE];
    };

    if (_lvl == 2) then 
    { 
        _lb lbSetColor [_index, DIALOG_BEAM_LB_COLOR_LVL_TWO];
    };

} forEach GVAR(box);
