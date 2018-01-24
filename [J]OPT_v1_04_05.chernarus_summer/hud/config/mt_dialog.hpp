#define COLOR_BUTTON_BACKGROUND {0,0,0,0.7}
#define COLOR_BUTTON_ACTIVE {0.2,0.8,0.2,0.7}
#define COLOR_LISTBOX_BACKGROUND {0,0,0,0.85}

class maintainer_dialog
{
	idd = 10000;
	movingenable = false;
	onLoad = "[] spawn opt_fnc_maintainerVecList";
	
	class controlsBackground 
	{
		class mt_frame: RscText
		{
			x = 0.350469 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.299062 * safezoneW;
			h = 0.473 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
	};

	class controls 
	{
		
		class mt_button_spectator: RscButton_OPT
		{
			idc = 10002;
			text = "Spectator";
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = COLOR_BUTTON_BACKGROUND;
			colorBackgroundActive[] = COLOR_BUTTON_ACTIVE;
			colorActive[] = COLOR_BUTTON_ACTIVE;
			tooltip = "Spectator Modus";
			action = "closeDialog 0; [] spawn opt_fnc_spectating;";
		};
		
		class mt_button_startSM3: RscButton_OPT
		{
			idc = 10003;
			text = "Start SM3";
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = COLOR_BUTTON_BACKGROUND;
			colorBackgroundActive[] = COLOR_BUTTON_ACTIVE;
			colorActive[] = COLOR_BUTTON_ACTIVE;
			tooltip = "Sidemission 3 starten";
			action = "['SM3start'] call opt_fnc_maintainerActions";
		};

		class mt_button_nodamage: RscButton_OPT
		{
			idc = 10004;
			text = "no damage";
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = COLOR_BUTTON_BACKGROUND;
			colorBackgroundActive[] = COLOR_BUTTON_ACTIVE;
			colorActive[] = COLOR_BUTTON_ACTIVE;
			tooltip = "kein Schaden";
			action = "['nodamage'] call opt_fnc_maintainerActions";
		};

		class mt_button_teleport: RscButton_OPT
		{
			idc = 10005;
			text = "Teleport";
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = COLOR_BUTTON_BACKGROUND;
			colorBackgroundActive[] = COLOR_BUTTON_ACTIVE;
			colorActive[] = COLOR_BUTTON_ACTIVE;
			tooltip = "Teleportieren";
			action = "['teleport'] call opt_fnc_maintainerActions";
		};

		class mt_button_bombe: RscButton_OPT
		{
			idc = 10006;
			text = "Bombe";
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = COLOR_BUTTON_BACKGROUND;
			colorBackgroundActive[] = COLOR_BUTTON_ACTIVE;
			colorActive[] = COLOR_BUTTON_ACTIVE;
			tooltip = "GBU platzieren";
			action = "['bombe'] call opt_fnc_maintainerActions";
		};

		class mt_button_winner: RscButton_OPT
		{
			idc = 10007;
			text = "Sieger";
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = COLOR_BUTTON_BACKGROUND;
			colorBackgroundActive[] = COLOR_BUTTON_ACTIVE;
			colorActive[] = COLOR_BUTTON_ACTIVE;
			tooltip = "Sieg NATO, Sieg CSAT oder Unentschieden";
			action = "['mt_win_dialog'] call opt_fnc_maintainerActions";
		};

		class mt_button_startMission: RscButton_OPT
		{
			idc = 10008;
			text = "Start";
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = COLOR_BUTTON_BACKGROUND;
			colorBackgroundActive[] = COLOR_BUTTON_ACTIVE;
			colorActive[] = COLOR_BUTTON_ACTIVE;
			tooltip = "Mission starten";
			action = "['startMission'] call opt_fnc_maintainerActions";
		};

		class mt_button_bestellen: RscButton_OPT
		{
			idc = 10009;
			text = "Bestellen";
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.226875 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = COLOR_BUTTON_BACKGROUND;
			colorBackgroundActive[] = COLOR_BUTTON_ACTIVE;
			colorActive[] = COLOR_BUTTON_ACTIVE;
			tooltip = "Ausgewaehltes Fahrzeug bestellen";
			action = "[] call opt_fnc_maintainerOrderVehicle";
		};

		class mt_button_schliessen: RscButton_OPT
		{
			idc = 10010;
			text = "Schliessen";
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = COLOR_BUTTON_BACKGROUND;
			colorBackgroundActive[] = {1,0,0,0.7};
			colorActive[] = COLOR_BUTTON_ACTIVE;
			tooltip = "Dialog schliessen";
			action = "closeDialog 0";
		};

		class mt_box_fahrzeugliste: RscListBox_OPT
		{
			idc = 10100;
			text = "Fahrzeugliste";
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.226875 * safezoneW;
			h = 0.407 * safezoneH;
			colorBackground[] = COLOR_LISTBOX_BACKGROUND;
			onLBDblClick = "[] call opt_fnc_maintainerOrderVehicle";
		};
	};
};



class maintainer_win_dialog
{
	idd = 30000;
	movingenable = false;
	
	class controlsBackground 
	{
		class mt_win_frame: RscText
		{
			idc = 30001;
			x = 0.448437 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.242 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
	};

	class controls 
	{
		class mt_win_NATO: RscButton_OPT
		{
			idc = 30002;
			text = "Sieg NATO";
			x = 0.45259 * safezoneW + safezoneX;
			y = 0.3878 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0.2,0.6};
			colorBackgroundActive[] = {0,0,0.2,1};
			colorActive[] = COLOR_BUTTON_ACTIVE;
			action = "['winNATO'] call opt_fnc_maintainerActions";
		};
		
		class mt_win_CSAT: RscButton_OPT
		{
			idc = 30003;
			text = "Sieg CSAT";
			x = 0.453594 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.2,0,0,0.6};
			colorBackgroundActive[] = {0.2,0,0,1};
			colorActive[] = COLOR_BUTTON_ACTIVE;
			action = "['winCSAT'] call opt_fnc_maintainerActions";
		};

		class mt_win_unentschieden: RscButton_OPT
		{
			idc = 30004;
			text = "Unentschieden";
			x = 0.453594 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0.2,0.2,0.6};
			colorBackgroundActive[] = {0,0.2,0.2,1};
			colorActive[] = COLOR_BUTTON_ACTIVE;
			action = "['unentschieden'] call opt_fnc_maintainerActions";
		};
		class mt_win_abbrechen: RscButton_OPT
		{
			idc = 30005;
			text = "Abbrechen";
			x = 0.453594 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = COLOR_BUTTON_BACKGROUND;
			colorBackgroundActive[] = {1,0,0,0.7};
			colorActive[] = COLOR_BUTTON_ACTIVE;
			action = "closeDialog 0";
		};
	};
};
