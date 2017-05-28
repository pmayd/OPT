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
			text = "Anzeigeeinstellungen";
		};
		class exit_cross : psy_exit_cross_picture_small {};
	};
	
	class controls {
		class xcross_button : psy_exit_cross_button_small {};
	
		class ViewDistanceTitle : RscText {
			idc = SINKY_VIEW_DISTANCE_TEXT;
			text = "";
			sizeEx = 0.035;
			x = 0.2; y = 0.19;
			w = 0.35; h = 0.05;
		};
		class ViewDistanceSelection : UIComboBox {
			idc = SINKY_VIEW_DISTANCE;
			sizeEx = 0.028;
			x = 0.55; y = 0.195;
			w = 0.15; h = 0.04;
		};
		class AcceptButton : RscIGUIShortcutButton {
			text = "Übernehmen";
			onButtonClick = "[] execVM 'dialogs\mission_settings\apply_settings.sqf';";
			x = 0.55; y = 0.345;
			w = 0.15; h = 0.04;
			default = true;
		};
	};
};