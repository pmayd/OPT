﻿class RscTitles {

	// From AIS injury by Pyschobastard (http://www.armaholic.com/page.php?id=24088)
	class ais_ProgressBar {
		idd = -1;
		movingEnable = 0;
		objects[] = {};
		duration = 1e+011;
		name = "ais_ProgressBar";
		onload = "_this call opt_addons_fnc_progressBarInit;";

		class controlsBackground {
			class mpsf_progressbar_background {
				idc = 0;
				x = "0.298906 * safezoneW + safezoneX";
				y = "0.082 * safezoneH + safezoneY";
				w = "0.407344 * safezoneW";
				h = "0.011 * safezoneH";
				type = 0;
				style = 0;
				shadow = 0;
				colorShadow[] = {0,0,0,0.5};
				font = "PuristaMedium";
				SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
				text = "";
				colorText[] = {1,1,1,1};
				colorBackground[] = {0,0,0,0.7};
				linespacing = 1;
			};
		};
		class controls {
			class mpsf_progressbar_foreground {
				idc = 1;
				x = "0.298906 * safezoneW + safezoneX";
				y = "0.082 * safezoneH + safezoneY";
				w = "0.001 * safezoneW";
				h = "0.011 * safezoneH";
				type = 0;
				style = 0;
				shadow = 0;
				colorShadow[] = {0,0,0,0.5};
				font = "PuristaMedium";
				SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
				text = "";
				colorText[] = {1,1,1,1};
				colorBackground[] = {0.6784, 0.7490, 0.5137, 0.7};
				linespacing = 1;
			};
			class mpsf_progressbar_text {
				idc = 2;
				type = 13;
				style = 0x00;
				colorBackground[] = {0,0,0,0};
				x = "0.298906 * safezoneW + safezoneX";
				y = "0.093 * safezoneH + safezoneY";
				w = "0.407344 * safezoneW";
				h = "0.022 * safezoneH";	
				text = "";
				size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
				colorText[] = {0, 0, 0, 1};
				class Attributes {
					font = "EtelkaMonospaceProBold";
					color = "#FFFFFF";
					align = "left";
					valign = "middle";
					shadow = 1;
					shadowColor = "#000000";
					//size = "2.25";
				};
			};
		};
	};

	class Mission_Title3 {
	  	idd=-1;
	  	movingEnable=0;
	  	duration=4;
	  	fadein=1;
	  	name="Mission_Title3";
	  	controls[] = {Titelt1};
		class Titelt1 : RscStdText {
			font=DEFAULTFONT;
			text = "Auf ein gutes, ehrliches und faires Gefecht!";
			colorText[] = Color_White;
			sizeEx = TextSize_medium;
			x = 0.0;
			y = 0.6;
			w = 1;
			h = 1;
		};
	};

	class mission_Label {
		idd=-1;
		movingEnable=0;
		fadein = 4;
		fadeout = 2;
		duration=25;
		name="mission_Label";
		sizeEx = 256;
		class controls {
			class Picture : RscPicture {
				x = "SafeZoneX + SafeZoneW - 0.33";
				y = "SafeZoneY + SafeZoneH - 0.19";
				w = 0.20; h = 0.20;
				colorText[] = {1,1,1,0.6};
				text="opt_a3_core\bilder\opt4_logo.paa";
				sizeEx = 256;
			};
		};
	};

	
	class dom_Empty {
		idd = -1;
		duration = 0;
		class controls {};
	};
	
	class only_pilots {
	  	idd=-1;
	  	movingEnable=0;
	  	duration=12;
	  	fadein=2;
	  	name="only_pilots";
	  	controls[] = {Titel};
		class Titel : RscStdText {
			text = "Es ist nur Piloten erlaubt zu fliegen!";
			colorText[] = Color_GrayDark;
			sizeEx = TextSize_medium;
			x = -0.8;
			y = -0.75;
			w = 1;
			h = 1;
		};
	};
	class only_crew {
	  	idd=-1;
	  	movingEnable=0;
	  	duration=12;
	  	fadein=2;
	  	name="only_crew";
	  	controls[] = {Titel};
		class Titel : RscStdText {
			text = "Dieser Platz ist Besatzungsmitgliedern vorbehalten!";
			colorText[] = Color_GrayDark;
			sizeEx = TextSize_medium;
			x = -0.8;
			y = -0.75;
			w = 1;
			h = 1;
		};
	};
	class only_qualified {
	  	idd=-1;
	  	movingEnable=0;
	  	duration=12;
	  	fadein=2;
	  	name="only_qualified";
	  	controls[] = {Titel};
		class Titel : RscStdText {
			text = "Dieses Fahrzeug darf nur von Fachpersonal bestellt werden!";
			colorText[] = Color_GrayDark;
			sizeEx = TextSize_medium;
			x = -0.5;
			y = -0.75;
			w = 1;
			h = 1;
		};
	};
	
	class RscDeadQuote {
		onload = "uinamespace setvariable ['tcb_title',_this select 0];";
		idd = 1792;
		movingEnable = false;
		moving = false;
		duration=10e10;
		enableSimulation = true;
		controlsBackground[] = {};
		objects[] = {};
		controls[] = {QuoteStructuredText, HeaderDeath};

		class HeaderDeath {
			idc = -1;
			type = CT_STRUCTURED_TEXT;
			style = ST_LEFT;
			colorBackground[] = {1, 1, 1, 0};
			colorText[] = {1, 0.0, 0.0, 1};
			x = safezoneX + 0.3 * safezoneW;
			y = safezoneY + 0.045 * safezoneW;
			w = 1;
			h = 0.6;
			size = 0.08;
			text = "You are dead.";
			class Attributes {
				font = DEFAULTFONT;
				color = "#CC0000";	// red
				align = "center";
				valign = "middle";
				shadow = false;
				shadowColor = "#ff0000";
				size = "1.6";
			};
		};

		class QuoteStructuredText {
			idc = 1793;
			type = CT_STRUCTURED_TEXT;
			style = ST_LEFT;
			colorBackground[] = { 1, 1, 1, 0 };
			colorText[] = {1,1,1,1};
			//x = 0.1;
			//y = 1.4;
			//x = "SafeZoneX + SafeZoneW - 1.9";
			//y = "SafeZoneY + SafeZoneH - 0.19";
			x = safezoneX + 0.3 * safezoneW;
			y = safezoneY + 0.67 * safezoneW;
			w = 1;
			h = 0.6;
			size = 0.02;
			text = "";
			class Attributes {
				font = DEFAULTFONT;
				color = "#000000";
				align = "center";
				valign = "middle";
				shadow = false;
				shadowColor = "#ff0000";
				size = "1.6";
			};
		};
	};
	
	
	
	//----------------------------------- BASE CAPTURE DISPLAY -------------------------------------
	#define FONTSIZE 0.03
	class DefaultMenu {
		idd = 5000;
		objects[] = {};

		class BackgroundWindowLight:BackgroundWindow {
			colorBackground[] = {0.4,0.4,0.4,1.0};	
		};

		class BackgroundBarLeft: IGUIBack {
			idc = 2201;
			x = safezoneX;
			y = safezoneY + safezoneH - 0.025 * safezoneH;
			w = 0.30 * safezoneW;
			h = 0.025 * safezoneH;
			colorbackground[] = CA_UI_background_2;
		}

		class BackgroundBarRight: IGUIBack {
			idc = 2202;
			x = safezoneX + safezoneW - 0.30 * safezoneW;
			y = safezoneY + safezoneH - 0.025 * safezoneH;
			w = 0.30 * safezoneW;
			h = 0.025 * safezoneH;
			colorbackground[] = CA_UI_background_2;
		}

		// 1. Feld
		class PlayersDisplay : GUILargeText {
			idc = 5101;
			x = safezoneX + 0.02 * safezoneW;
			y = safezoneY + safezoneH - 0.025 * safezoneH;
			w = 0.09 * safezoneW;
			h = 0.025 * safezoneH;
			sizeEx = FONTSIZE;
			shadow = 1;
			colorText[] = Color_WhiteLight;
			text = "#Spieler";
		};	

		// 2. Feld
		class FrameDisplay : GUILargeText {
			idc = 5091;
			x = safezoneX + 0.12 * safezoneW;
			y = safezoneY + safezoneH - 0.025 * safezoneH;
			w = 0.09 * safezoneW;
			h = 0.025 * safezoneH;
			sizeEx = FONTSIZE;
			shadow = 1;
			colorText[] = Color_WhiteLight;
			text = "FPS";
		};	

		// 3. Feld
		class BudgetDisplay : GUILargeText {
			idc = 5092;
			x = safezoneX + 0.22 * safezoneW;
			y = safezoneY + safezoneH - 0.025 * safezoneH;
			w = 0.09 * safezoneW;
			h = 0.025 * safezoneH;
			sizeEx = FONTSIZE;
			shadow = 1;
			colorText[] = Color_WhiteLight;
			text = "Budget";
		};

		// 4. Feld
		class HeadingDisplay : GUILargeText {
			idc = 5102;
			x = safezoneX + safezoneW - 0.28 * safezoneW;
			y = safezoneY + safezoneH - 0.025 * safezoneH;
			w = 0.09 * safezoneW;
			h = 0.025 * safezoneH;
			sizeEx = FONTSIZE;
			shadow = 1;
			text = "Heading";
		};
		
		// 5. Feld
		class TimerDisplay : GUILargeText {
			idc = 5090;
			x = safezoneX + safezoneW - 0.18 * safezoneW;
			y = safezoneY + safezoneH - 0.025 * safezoneH;
			w = 0.09 * safezoneW;
			h = 0.025 * safezoneH;
			sizeEx = FONTSIZE;
			colorText[] = Color_WhiteLight;
			shadow = 1;
			text = "Spielzeit";
		};		
		
	};

	//--------------------------------------------------------------------------------------------------
	//                                        HUD DISPLAY
	//--------------------------------------------------------------------------------------------------
		
	class opt_HudDisplay:DefaultMenu {
		duration = 15000;
		name = "HudDisplay";
		idd = 4999;			
		onLoad = "uiNamespace setVariable ['opt_HudDisplay' , _this select 0];";	
		movingEnable = false;
		moving = false;
		enableSimulation = true;
		objects[] = {};

		controls[] = {};

		
		//NB: the order of the listing of controls is important. The first control listed goes on the
		//    bottom, the last goes on top
		// add BackgroundBar to have a nicer background
		controlsBackground[] = {
			BackgroundBarLeft, BackgroundBarRight, HeadingDisplay,PlayersDisplay,TimerDisplay,FrameDisplay,BudgetDisplay
		};			
	};
};