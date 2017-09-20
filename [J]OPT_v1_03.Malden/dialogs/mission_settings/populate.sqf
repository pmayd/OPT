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

disableSerialization;

// Grab access to the controls
_dialog = findDisplay SINKY_DIALOG;
_viewDistanceText = _dialog displayCtrl SINKY_VIEW_DISTANCE_TEXT;
_viewDistance = _dialog displayCtrl SINKY_VIEW_DISTANCE;

// Display the current view distance
_viewDistanceText ctrlSetText format ["Sichtweite (Aktuell: %1)", round(viewDistance)];

if(isNil "group_index_distance") then {group_index_distance = 0};

// Populate the viewdistance setting list box
{_viewDistance lbAdd str(opt_v_distance_list select _forEachIndex)} forEach opt_v_distance_list;
if(lbCurSel _viewDistance < 0) then {
	_viewDistance lbSetCurSel group_index_distance;
} else {
	group_index_distance = lbCurSel _viewDistance;
};
