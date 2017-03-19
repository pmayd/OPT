#define COLOR_BUTTON_BACKGROUND {0,0,0,0.7}
#define COLOR_BUTTON_ACTIVE {0.2,0.8,0.2,0.7}
#define COLOR_LISTBOX_BACKGROUND {0,0,0,0.85}


class opt_vehicleorder_dialog
{
	idd = 20000;
	movingenable = false;
	
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
	};

	class controls
	{
		class order_box_fahrzeugliste: RscListBox_OPT
		{
			idc = 20100;
			text = "Fahrzeugliste";
			x = 0.381406 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.234875 * safezoneW;
			h = 0.507 * safezoneH;
			colorBackground[] = COLOR_LISTBOX_BACKGROUND;
			onLBDblClick = "[] call opt_fnc_sendVehicleOrder";
		};
		class order_box_preisliste: RscListBox_OPT
		{
			idc = 20101;
			text = "Preis";
			x = 0.621406 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.08575 * safezoneW;
			h = 0.507 * safezoneH;
			colorBackground[] = COLOR_LISTBOX_BACKGROUND;
			onLBDblClick = "[] call opt_fnc_sendVehicleOrder";
		};
		class order_budget: RscText_Header
		{
			idc = 20102;
			colorText[] = Color_Green;
			text = "Budget";
			x = 0.572 * safezoneW + safezoneX;
			y = 0.798 * safezoneH + safezoneY;
			w = 0.2515625 * safezoneW;
			h = 0.033 * safezoneH;
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
			action = "[] call opt_fnc_sendVehicleOrder";
		};
		class order_button_schliessen: RscButton_OPT
		{
			idc = 20002;
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
		};
	};
};