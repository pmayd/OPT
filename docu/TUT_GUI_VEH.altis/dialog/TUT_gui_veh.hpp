#define true 1
#define false 0

class RscTUTVehDialog
{
	idd=1601;
	movingEnable = false;
	enableSimulation = true;
	fadein=0;
	duration = 1e+011;
	fadeout=0;
	onLoad= "";

	controlsBackground[]=
	{
		vehBack,
		vehFrame,
		RscHeaderBack,
		RscVehBack,
		RscVehInfoBack
	};
	controls[]={
		btnCancel,
		btnConfirm,
		RscVehList,
		vehStatText,
		serverTitleText,
		RscPlayerFlagLeft,
		btnLand,
		btnAir,
		btnSea
	};
	objects[]={};
	class vehBack: IGUIBack
{
	idc = 0;
	x = 0 * safezoneW + safezoneX;
	y = 0 * safezoneH + safezoneY;
	w = 1 * safezoneW;
	h = 1 * safezoneH;
	colorBackground[] = {0,0,0,0.5};
};
	class vehFrame: IGUIBack
{
	idc = 1;
	x = 0.25 * safezoneW + safezoneX;
	y = 0.25 * safezoneH + safezoneY;
	w = 0.5 * safezoneW;
	h = 0.5 * safezoneH;
	colorBackground[] = {0.529,0.565,0.49,1};
};
	class RscHeaderBack: IGUIBack
{
	idc = 2;
	x = 0.255 * safezoneW + safezoneX;
	y = 0.2575 * safezoneH + safezoneY;
	w = 0.49 * safezoneW;
	h = 0.05 * safezoneH;
	colorBackground[] = {0.333,0.333,0.333,0.75};
};
	class RscVehBack: IGUIBack
{
	idc = 3;
	x = 0.255 * safezoneW + safezoneX;
	y = 0.3125 * safezoneH + safezoneY;
	w = 0.2425 * safezoneW;
	h = 0.4275 * safezoneH;
	colorBackground[] = {0.333,0.333,0.333,0.75};
};
	class RscVehInfoBack: IGUIBack
{
	idc = 4;
	x = 0.5025 * safezoneW + safezoneX;
	y = 0.355 * safezoneH + safezoneY;
	w = 0.2425 * safezoneW;
	h = 0.34 * safezoneH;
	colorBackground[] = {0.333,0.333,0.333,0.75};
};
class btnCancel: RscShortcutButton
{
	idc = 5;
	text = "Cancel";
	colorBackground[] = {0.4,0.4,0.4,1}; 
	colorBackground2[] = {0.4,0.4,0.4,1}; 
	colorBackgroundFocused[] = {0.4,0.4,0.4,1};
	onButtonClick  = "closeDialog 1601;";
	x = 0.5025 * safezoneW + safezoneX;
	y = 0.7025 * safezoneH + safezoneY;
	w = 0.12 * safezoneW;
	h = 0.0375 * safezoneH;
};

	class btnConfirm: RscShortcutButton
{
	idc = 6;
	text = "Confirm";
    colorBackground[] = {0.4,0.4,0.4,1}; 
	colorBackground2[] = {0.4,0.4,0.4,1}; 
	colorBackgroundFocused[] = {0.4,0.4,0.4,1};
	onButtonClick  = "[] call TUT_gui_VehCreate;";
	x = 0.625 * safezoneW + safezoneX;
	y = 0.7025 * safezoneH + safezoneY;
	w = 0.12 * safezoneW;
	h = 0.0375 * safezoneH;
};
	class RscVehList: RscListBox
{
	idc = 7;
	onLBSelChanged  = "[] spawn TUT_gui_VehInfo;";
	colorText[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.25};
	colorScrollbar[] = {1,0,0,0};
	colorSelect[] = {1,1,1,1};
	colorSelect2[] = {1,1,1,1};
	colorSelectBackground[] = {0,0,0,0.5};
	colorSelectBackground2[] = {0.667,0.714,0.635,1};
	colorBackground[] = {0.667,0.714,0.635,1};
	shadow = 0.75;
	x = 0.26 * safezoneW + safezoneX;
	y = 0.3225 * safezoneH + safezoneY;
	w = 0.2325 * safezoneW;
	h = 0.41 * safezoneH
};
class vehStatText: RscStructuredText
{
	idc = 8;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0.667,0.714,0.635,1};
	shadow = 0.75;
	size = 0.037;
	x = 0.508 * safezoneW + safezoneX;
	y = 0.365 * safezoneH + safezoneY;
	w = 0.2325 * safezoneW;
	h = 0.32 * safezoneH
	onMouseButtonDown = "";
	onMouseButtonUp = "";
	onMouseZChanged = "";
	text = "";
};

class serverTitleText: RscStructuredText
{
	idc = 10;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0};
	shadow = 0.75;
	x = 0.305 * safezoneW + safezoneX;
	y = 0.265 * safezoneH + safezoneY;
	w = 0.435 * safezoneW;
	h = 0.04 * safezoneH;
	onMouseButtonDown = "";
	onMouseButtonUp = "";
	onMouseZChanged = "";
	text = "";
};
class RscPlayerFlagLeft: RscPicture
{
	idc = 11;
	colorBackground[] = {0,0,0,1};
	sizeEx = 0.1;
	text = "";
	x = 0.2575 * safezoneW + safezoneX;
	y = 0.26 * safezoneH + safezoneY;
	w = 0.05 * safezoneW;
	h = 0.045* safezoneH;	
};
	class btnLand: RscShortcutButton
{
	idc = 12;
	text = "Land";
    colorBackground[] = {0.4,0.4,0.4,1}; 
	colorBackground2[] = {0.4,0.4,0.4,1}; 
	colorBackgroundFocused[] = {0.4,0.4,0.4,1};
	onButtonClick  = "[""Car""] call TUT_gui_LoadVeh;";
	x = 0.5025 * safezoneW + safezoneX;
	y = 0.3125 * safezoneH + safezoneY;
	w = 0.0775 * safezoneW;
	h = 0.0375 * safezoneH;
};
	class btnSea: RscShortcutButton
{
	idc = 13;
	text = "Sea";
    colorBackground[] = {0.4,0.4,0.4,1}; 
	colorBackground2[] = {0.4,0.4,0.4,1}; 
	colorBackgroundFocused[] = {0.4,0.4,0.4,1};
	onButtonClick  = "[""Ship""] call TUT_gui_LoadVeh;";
	x = 0.585 * safezoneW + safezoneX;
	y = 0.3125 * safezoneH + safezoneY;
	w = 0.0775* safezoneW;
	h = 0.0375 * safezoneH;
};
	class btnAir: RscShortcutButton
{
	idc = 14;
	text = "Air";
    colorBackground[] = {0.4,0.4,0.4,1}; 
	colorBackground2[] = {0.4,0.4,0.4,1}; 
	colorBackgroundFocused[] = {0.4,0.4,0.4,1};
	onButtonClick  = "[""Air""] call TUT_gui_LoadVeh;";
	x = 0.6675 * safezoneW + safezoneX;
	y = 0.3125 * safezoneH + safezoneY;
	w = 0.0775 * safezoneW;
	h = 0.0375 * safezoneH;
};

};