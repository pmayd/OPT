/*
 * Author:      Sinky
 * Date:        1st February 2011
 * Last Edited: 1st February 2011
 * Version:     1.0
 
 
 changed by psychobastard
 */
#define SINKY_DIALOG 2001
#define SINKY_VIEW_DISTANCE_TEXT 2002
#define SINKY_VIEW_DISTANCE 2003
#define SINKY_GRASS_SETTING 2004

disableSerialization;

// Grab access to the controls
_dialog = findDisplay SINKY_DIALOG;
_viewDistanceText = _dialog displayCtrl SINKY_VIEW_DISTANCE_TEXT;
_viewDistance = _dialog displayCtrl SINKY_VIEW_DISTANCE;
_grassSetting = _dialog displayCtrl SINKY_GRASS_SETTING;

// Display the current view distance
_viewDistanceText ctrlSetText format [" View Distance ( Current: %1 )", round(viewDistance)];


tcb_gras_list = ["None","Low","Medium","High","Full"];

if(isNil "group_index_grass") then {group_index_grass = 0};
if(isNil "group_index_distance") then {group_index_distance = 0};



// Populate the viewdistance setting list box
{_viewDistance lbAdd str(tcb_v_distance_list select _forEachIndex)} forEach tcb_v_distance_list;
if(lbCurSel _viewDistance < 0) then {
	_viewDistance lbSetCurSel group_index_distance;
} else {
	group_index_distance = lbCurSel _viewDistance;
};

// Populate the grass setting list box
{_grassSetting lbAdd (tcb_gras_list select _forEachIndex)} forEach tcb_gras_list;
if(lbCurSel _grassSetting < 0) then {
	_grassSetting lbSetCurSel group_index_grass;
} else {
	group_index_grass = lbCurSel _grassSetting;
};