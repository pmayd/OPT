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
_grassSetting = _dialog displayCtrl SINKY_GRASS_SETTING;


// Get the view distance selection and calculate
_selectedViewDistance = lbCurSel _viewDistance;
group_index_distance = lbCurSel _viewDistance;

if (_selectedViewDistance >= 0) then {
	_selectedViewDistance = lbText [SINKY_VIEW_DISTANCE, _selectedViewDistance];
	setViewDistance (parseNumber _selectedViewDistance);
	"Viewdistance was changed" call tcb_fnc_GlobalChat;
	_viewDistanceText ctrlSetText format [" View Distance ( Current: %1 )", round(viewDistance)];
};
	
// Get the grass selection and calculate
_selectedGrass = lbCurSel _grassSetting;
group_index_grass = lbCurSel _grassSetting;

if (_selectedGrass >= 0) then {
	_selectedGrass = lbText[SINKY_GRASS_SETTING, _selectedGrass];
	_num = switch (_selectedGrass) do {
		case "None": {50};
		case "Low": {25};
		case "Medium": {12.5};
		case "High": {6.25};
		case "Full": {3.125};
	};
	setTerrainGrid _num;
	"Graslayer was changed" call tcb_fnc_GlobalChat;
};

//closeDialog 0;