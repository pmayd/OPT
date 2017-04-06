#define SINKY_DIALOG 2001
#define SINKY_VIEW_DISTANCE_TEXT 2002
#define SINKY_VIEW_DISTANCE 2003
#define SINKY_GRASS_SETTING 2004

class MissionSettings {

	idd = SINKY_DIALOG;
	movingEnable = true;
	enableSimulation = true;
	onLoad = "[] execVM 'dialogs\mission_settings\populate.sqf'";
	
	class controlsBackground {
		class XD_BackGround : psy_BackGround_small {};
		class XD_BackGround_Header : psy_BackGround_Header_small {};
		class XD_MainCaption : psy_MainCaption_Header_small {
			text = "Mission Display Settings";
		};
		class exit_cross : psy_exit_cross_picture_small {};
	};
	
	class controls {
		class xcross_button : psy_exit_cross_button_small {};
	
		class ViewDistanceTitle : RscText {
			idc = SINKY_VIEW_DISTANCE_TEXT;
			text = "";
			sizeEx = 0.02;
			x = 0.33; y = 0.18;
			w = 0.3; h = 0.05;
		};
		class ViewDistanceSelection : UIComboBox {
			idc = SINKY_VIEW_DISTANCE;
			x = 0.59; y = 0.195;
			w = 0.12; h = 0.023;
		};
		class GrassSelectionTitle : RscText {
			idc = -1;
			text = " Desired Grass Setting: ";
			sizeEx = 0.02;
			x = 0.33; y = 0.23;
			w = 0.3; h = 0.05;
		};
		class GrassSelection : UIComboBox {
			idc = SINKY_GRASS_SETTING;
			x = 0.59; y = 0.245;
			w = 0.12; h = 0.023;
		};
		class AcceptButton : RscIGUIShortcutButton {
			text = "Accept";
			onButtonClick = "[] execVM 'dialogs\mission_settings\apply_settings.sqf';";
			x = 0.59; y = 0.345;
			default = true;
		};
	};
};