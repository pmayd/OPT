
#define COLOR_BUTTON_BACKGROUND {0,0,0,0.7}
#define COLOR_BUTTON_ACTIVE {0.2,0.8,0.2,0.7}
#define COLOR_LISTBOX_BACKGROUND {0,0,0,0.85}
#define FONTSIZE (0.022 / (getResolution select 5))  // dynamische Anpassung je nach UI Schriftgröße


class GVAR(dlg_order)
{
	idd = 20000;
	movingenable = false;
	onLoad = __EVAL(format["uiNamespace setVariable ['%1', _this select 0]", QGVAR(orderDialog)]);
	
	class controlsBackground
	{

		class order_frame: RscText
		{
			idc = 20001;
			x = 0.371094 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.3475 * safezoneW;
			h = 0.584 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
        class player_flag: RscPicture
		{
			idc = 20002;
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.26 * safezoneH + safezoneY;
			w = 0.06 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
	};

	class controls
	{
		class order_box_fahrzeugliste: RscListBox_OPT
		{
			idc = 20100;
			text = "Fahrzeugliste";
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.32 * safezoneH + safezoneY;
			w = 0.22 * safezoneW;
			h = 0.467 * safezoneH;
			colorBackground[] = COLOR_LISTBOX_BACKGROUND;
			onLBSelChanged =  __EVAL(format["[] call %1", QFUNC(showVehicleInfo)]);
            sizeEx = FONTSIZE;
		};
		class order_box_fahrzeuginfo: RscStructuredText
		{
			idc = 20101;
			text = "Fahrzeuginfo";
			x = 0.60 * safezoneW + safezoneX;
			y = 0.32 * safezoneH + safezoneY;
			w = 0.1 * safezoneW;
			h = 0.467 * safezoneH;
			colorBackground[] = COLOR_LISTBOX_BACKGROUND;
            sizeEx = FONTSIZE * 0.8;
		};
		class order_budget: RscText_Header
		{
			idc = 20102;
			colorText[] = Color_Green;
			text = "Budget";
			x = 0.600 * safezoneW + safezoneX;
			y = 0.798 * safezoneH + safezoneY;
			w = 0.2515625 * safezoneW;
			h = 0.033 * safezoneH;
            sizeEx = FONTSIZE;
		};
		class order_button_bestellen: RscButton_OPT
		{
			idc = 20002;
			text = "Bestellen";
			x = 0.385 * safezoneW + safezoneX;
			y = 0.798 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = COLOR_BUTTON_BACKGROUND;
			colorBackgroundActive[] = COLOR_BUTTON_ACTIVE;
			colorActive[] = COLOR_BUTTON_ACTIVE;
			tooltip = "Ausgewähltes Fahrzeug bestellen";
			action = __EVAL(format["[] call %1", QFUNC(sendVehicleOrder)]);
            sizeEx = FONTSIZE;
		};
		class order_button_schliessen: RscButton_OPT
		{
			idc = 20003;
			text = "Schliessen";
			x = 0.452 * safezoneW + safezoneX;
			y = 0.798 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = COLOR_BUTTON_BACKGROUND;
			colorBackgroundActive[] = {1,0,0,0.7};
			colorActive[] = {1,0,0,0.7};
			tooltip = "Dialog schliessen";
			action = "closeDialog 0";
            sizeEx = FONTSIZE;
		};
		#ifdef __ORDER_CAN_SELL__
		class order_button_verkaufen: RscButton_OPT
		{
			idc = 20004;
			text = "Verkaufen";
			x = 0.519 * safezoneW + safezoneX;
			y = 0.798 * safezoneH + safezoneY;
			w = 0.0515625 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = COLOR_BUTTON_BACKGROUND;
			colorBackgroundActive[] = {1,0,0,0.7};
			colorActive[] = {1,0,0,0.7};
			tooltip = "Verkaufe Fahrzeug auf dem Bestell-Pad";
			action = __EVAL(format["[] call %1", QFUNC(sellVehicle)]); // TODO:
            sizeEx = FONTSIZE;
		};
		#endif
	};
};