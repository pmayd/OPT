/**
* Author: Lord
* initialize beam dialog and wait for user input
*
* Arguments:
* 0: <DIALOG> dialog/display
*
* Return Value:
* None
*
* Example:
* [] call fnc_onLoadDialog.sqf;
*
*/
#include "script_component.hpp"

disableSerialization;

private _display = findDisplay IDD_DLG_BEAM;
private _lb = _display displayCtrl IDC_CTRL_LIST_BOX;

//Zeitabgelaufen check
private _orte = [];
if (PLAYER_SIDE == east) then { 
    _orte = GVAR(locations_east); 

} else { 
    _orte = GVAR(locations_west);

};

// if component is disabled -> only allow locations with level equal -1
GVAR(box) = _orte select {(_x select 2) == -1};
if (GVAR(on)) then {
    // nach Waffenruhe nur noch Orte mit -1
    if (!GVARMAIN(missionStarted)) then {
        GVAR(box) append (_orte select {(_x select 2) > 0}); // only locations with level greater 0 (1,2,3 possible)
    };
};

//Boxen mit Orte füllen
{
    private _loc = _x;
    private _lvl = _loc select 2;

    private _index = lbAdd [IDC_CTRL_LIST_BOX, format["%1", (_loc select 1)]]; // readable name
    _lb lbSetColor [_index, LB_COLOR_DEFAULT];

    if (_lvl == 1) then { 
        _lb lbSetColor [_index, LB_COLOR_LVL_ONE];
    };

    if (_lvl == 2) then { 
        _lb lbSetColor [_index, LB_COLOR_LVL_TWO];
    };

} forEach GVAR(box);
