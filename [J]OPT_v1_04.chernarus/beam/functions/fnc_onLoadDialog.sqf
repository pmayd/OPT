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
#define IDD_DLG_BEAM 444001
#define IDC_CTRL_LIST_BOX 10002
disableSerialization;

waitUntil {!isNull (findDisplay IDD_DLG_BEAM)};

private _display = findDisplay IDD_DLG_BEAM;
private _lb = _display displayCtrl IDC_CTRL_LIST_BOX;

//Zeitabgelaufen check
if (GVARMAIN(missionStarted)) exitWith { 
	closeDialog 0;

	[QEGVAR(gui,message), ["Beamsystem", "Das System steht nur während der Waffenruhe zur Verfügung!", "red"]] call CBA_fnc_localEvent;
};

private _orte = [];
if (PLAYER_SIDE == east) then { 
	_orte = GVAR(locations_east); 

} else { 
	_orte = GVAR(locations_west);

};
		
GVAR(box) = _orte select {(_x select 2) > 0}; // only locations with level greater 0 (0,1,2,3 possible)

//Boxen mit Orte füllen
{
	private _loc = _x;
	private _lvl = _loc select 2;

	private _index = lbAdd [IDC_CTRL_LIST_BOX, format["%1", (_loc select 1)]]; // readable name
	_lb lbSetColor [_index, [0, 1, 0, 1]];

	if (_lvl == 1) then { 
		_lb lbSetColor [_index, [1, 0.5, 0.5, 1]];
	};

	if (_lvl == 2) then { 
		_lb lbSetColor [_index, [1, 1,0, 1]];
	};

} forEach GVAR(box);

		 
