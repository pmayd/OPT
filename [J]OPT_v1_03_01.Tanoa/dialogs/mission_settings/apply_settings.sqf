/*
 * Author:      Sinky
 * Date:        1st February 2011
 * Last Edited: 3rd February 2011
 * Version:     1.0
 
 changed by psycho
 */
#define SINKY_DIALOG 2001
#define SINKY_VIEW_DISTANCE_TEXT 2002
#define SINKY_VIEW_DISTANCE 2003
#define SINKY_GRASS_SETTING 2004

disableSerialization;
_dialog = findDisplay SINKY_DIALOG;
_viewDistanceText = _dialog displayCtrl SINKY_VIEW_DISTANCE_TEXT;
_viewDistance = _dialog displayCtrl SINKY_VIEW_DISTANCE;

// Get the view distance selection and calculate
_selectedViewDistance = lbCurSel _viewDistance;
group_index_distance = lbCurSel _viewDistance;

if (_selectedViewDistance >= 0) then {
	_selectedViewDistance = lbText [SINKY_VIEW_DISTANCE, _selectedViewDistance];
	setViewDistance (parseNumber _selectedViewDistance);
	"Sichtweite wurde geändert" call tcb_fnc_GlobalChat;
	_viewDistanceText ctrlSetText format ["Sichtweite (Aktuell: %1)", round(viewDistance)];
};
	
//closeDialog 0;