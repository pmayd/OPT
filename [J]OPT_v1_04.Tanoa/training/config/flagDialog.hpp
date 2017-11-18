

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by [3.JgKp]James, v1.063, #Qageca)
////////////////////////////////////////////////////////
/* GRID MACROS */
#define GUI_GRID_X	(0)
#define GUI_GRID_Y	(0)
#define GUI_GRID_W	(0.025)
#define GUI_GRID_H	(0.04)
#define GUI_GRID_WAbs	(1)
#define GUI_GRID_HAbs	(1)

class GVAR(dlg_flag)
{

    idd = 21000;
	movingenable = true;
	onLoad = QUOTE([_this select 0] call FUNC(initFlagDialog));

    class controlsBackground
	{ 

        class IGUIBack_2200: IGUIBack
        {
            idc = 2200;
            x = 11 * GUI_GRID_W + GUI_GRID_X;
            y = 0 * GUI_GRID_H + GUI_GRID_Y;
            w = 20 * GUI_GRID_W;
            h = 13.5 * GUI_GRID_H;
            colorBackground[] = {0,0,0,0.6};
        };
        class RscFrame_1800: RscFrame
        {
            idc = 1800;
            text = "Flaggen verschieben"; //--- ToDo: Localize;
            x = 11 * GUI_GRID_W + GUI_GRID_X;
            y = -0.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 20 * GUI_GRID_W;
            h = 14 * GUI_GRID_H;
            sizeEx = 1 * GUI_GRID_H;
        };
        class RscPicture_1200: RscPicture
        {
            idc = 1200;
            text = "\A3\Data_F\Flags\Flag_nato_CO.paa";
            x = 13 * GUI_GRID_W + GUI_GRID_X;
            y = 1.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 6 * GUI_GRID_W;
            h = 4 * GUI_GRID_H;
        };
        class RscPicture_1201: RscPicture
        {
            idc = 1201;
            text = "\A3\Data_F\Flags\Flag_CSAT_CO.paa";
            x = 23 * GUI_GRID_W + GUI_GRID_X;
            y = 1.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 6 * GUI_GRID_W;
            h = 4 * GUI_GRID_H;
        };

    };
    
    class controls
	{
        class NATO_RscText_1000: RscText
        {
            idc = 1000;
            text = "X:"; //--- ToDo: Localize;
            x = 12.5 * GUI_GRID_W + GUI_GRID_X;
            y = 7.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 1.5 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
        };
        class NATO_RscEdit_1400: RscEdit
        {
            idc = 1400;
            x = 14.5 * GUI_GRID_W + GUI_GRID_X;
            y = 7.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 4.5 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
        };       
        class NATO_RscText_1001: RscText
        {
            idc = 1001;
            text = "Y:"; //--- ToDo: Localize;
            x = 12.5 * GUI_GRID_W + GUI_GRID_X;
            y = 9.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 1.5 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
        };
        class NATO_RscEdit_1401: RscEdit
        {
            idc = 1401;
            x = 14.5 * GUI_GRID_W + GUI_GRID_X;
            y = 9.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 4.5 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
        };
        class CSAT_RscText_1002: RscText
        {
            idc = 1002;
            text = "X:"; //--- ToDo: Localize;
            x = 22.5 * GUI_GRID_W + GUI_GRID_X;
            y = 7.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 1.5 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
        };
        class CSAT_RscEdit_1402: RscEdit
        {
            idc = 1402;
            x = 24.5 * GUI_GRID_W + GUI_GRID_X;
            y = 7.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 4.5 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
        };
        class CSAT_RscText_1003: RscText
        {
            idc = 1003;
            text = "Y:"; //--- ToDo: Localize;
            x = 22.5 * GUI_GRID_W + GUI_GRID_X;
            y = 9.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 1.5 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
        };
        class CSAT_RscEdit_1403: RscEdit
        {
            idc = 1403;
            x = 24.5 * GUI_GRID_W + GUI_GRID_X;
            y = 9.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 4.5 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
        };
        class RscButton_1600: RscButton
        {
            idc = 1600;
            style = ST_CENTER + ST_VCENTER;
            text = "Übernehmen"; //--- ToDo: Localize;
            x = 16.5 * GUI_GRID_W + GUI_GRID_X;
            y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 8 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
            sizeEx = (0.023 / (getResolution select 5));
            action = QUOTE([] call FUNC(setFlag););
        };
    };
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
