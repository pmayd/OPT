/* #Jevuwa
$[
    1.063,
    ["orderDialog",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
    [-2200,"",[2,"",["0 * GUI_GRID_W + GUI_GRID_X","0 * GUI_GRID_H + GUI_GRID_Y","40 * GUI_GRID_W","25 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
    [-1800,"",[2,"Bestellsystem",["0 * GUI_GRID_W + GUI_GRID_X","-0.83 * GUI_GRID_H + GUI_GRID_Y","40 * GUI_GRID_W","26 * GUI_GRID_H"],[1,1,1,1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","1.5"],[]],
    [1200,"",[2,"#(argb,8,8,3)color(1,1,1,1)",["1 * GUI_GRID_W + GUI_GRID_X","1 * GUI_GRID_H + GUI_GRID_Y","8 * GUI_GRID_W","3.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
    [1801,"",[2,"",["1 * GUI_GRID_W + GUI_GRID_X","5 * GUI_GRID_H + GUI_GRID_Y","38 * GUI_GRID_W","18 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
    [1500,"",[2,"",["1 * GUI_GRID_W + GUI_GRID_X","6.5 * GUI_GRID_H + GUI_GRID_Y","22 * GUI_GRID_W","16.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
    [1000,"",[2,"Budget: ",["10 * GUI_GRID_W + GUI_GRID_X","1 * GUI_GRID_H + GUI_GRID_Y","29 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
    [1600,"",[2,"Bestellen",["1.03 * GUI_GRID_W + GUI_GRID_X","23.23 * GUI_GRID_H + GUI_GRID_Y","7.5 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
    [1601,"",[2,"Verkaufen",["9.8 * GUI_GRID_W + GUI_GRID_X","23.2 * GUI_GRID_H + GUI_GRID_Y","7 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
    [1400,"",[2,"Suchzeile...",["1 * GUI_GRID_W + GUI_GRID_X","5 * GUI_GRID_H + GUI_GRID_Y","38 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
    [1001,"",[2,"Infobereich...",["23 * GUI_GRID_W + GUI_GRID_X","6.5 * GUI_GRID_H + GUI_GRID_Y","16 * GUI_GRID_W","16.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
    [1602,"",[2,"SchlieÃŸen",["32 * GUI_GRID_W + GUI_GRID_X","23.2 * GUI_GRID_H + GUI_GRID_Y","7 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/

/* GRID MACROS */
#define GUI_GRID_X    (0)
#define GUI_GRID_Y    (0)
#define GUI_GRID_W    (0.025)
#define GUI_GRID_H    (0.04)
#define GUI_GRID_WAbs    (1)
#define GUI_GRID_HAbs    (1)

#define COLOR_CONTROL_BG {0,0,0,0.7}
#define COLOR_BUTTON_BACKGROUND {0,0,0,0.7}
#define COLOR_BUTTON_ACTIVE {0.2,0.8,0.2,0.7}
#define COLOR_LISTBOX_BACKGROUND {0,0,0,0.85}
#define FONTSIZE GUI_GRID_H  // dynamische Anpassung je nach UI Schriftgröße

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by [3.JgKp]James, v1.063, #Jevuwa)
////////////////////////////////////////////////////////
class GVAR(dlg_order)
{
    idd = 20000;
    movingenable = false;
    onLoad = __EVAL(format["uiNamespace setVariable ['%1', _this select 0]", QGVAR(orderDialog)]);
    
    class controlsBackground
    {
        class IGUIBack_Main: IGUIBack
        {
            idc = 2200;
            x = 0 * GUI_GRID_W + GUI_GRID_X;
            y = 0 * GUI_GRID_H + GUI_GRID_Y;
            w = 40 * GUI_GRID_W;
            h = 25.1 * GUI_GRID_H;
        };
        class RscFrame_Main: RscFrame
        {
            idc = 1800;
            text = "Bestellsystem"; //--- ToDo: Localize;
            x = 0 * GUI_GRID_W + GUI_GRID_X;
            y = -0.83 * GUI_GRID_H + GUI_GRID_Y;
            w = 40 * GUI_GRID_W;
            h = 26 * GUI_GRID_H;
            colorText[] = {1,1,1,1};
            sizeEx = 1.5 * FONTSIZE;
        };
        class RscPictureFlag: RscPicture
        {
            idc = 20002;
            text = "#(argb,8,8,3)color(1,1,1,1)";
            x = 1 * GUI_GRID_W + GUI_GRID_X;
            y = 1 * GUI_GRID_H + GUI_GRID_Y;
            w = 8 * GUI_GRID_W;
            h = 3.5 * GUI_GRID_H;
        };
        class RscFrame_Vehicle: RscFrame
        {
            idc = 1801;
            x = 1 * GUI_GRID_W + GUI_GRID_X;
            y = 5 * GUI_GRID_H + GUI_GRID_Y;
            w = 38 * GUI_GRID_W;
            h = 18 * GUI_GRID_H;
        };
    };

    class controls {
        class RscTextBudget: RscText
        {
            idc = 20102;
            text = "Budget: "; //--- ToDo: Localize;
            x = 10 * GUI_GRID_W + GUI_GRID_X;
            y = 1 * GUI_GRID_H + GUI_GRID_Y;
            w = 29 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
            colorBackground[] = COLOR_CONTROL_BG;
            sizeEx = FONTSIZE;
        };
        /* gelöscht aufgrund der Probleme mit Kauf und Verkaufpad
        class RscEditSearch: RscEdit
        {
            idc = 1400;
            text = "Suchtext..."; //--- ToDo: Localize;
            x = 1 * GUI_GRID_W + GUI_GRID_X;
            y = 5 * GUI_GRID_H + GUI_GRID_Y;
            w = 38 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
            colorBackground[] = COLOR_CONTROL_BG;
            onMouseButtonDblClick = "(_this select 0) ctrlSetText '';[] call opt_warehouse_fnc_filterVehicleList;";
            onKeyUp = QUOTE([] call FUNC(filterVehicleList););
            tooltip="Doppelklick löscht Zeile. Sucht nach Fahrzeugen mit dem Suchtext im Namen.";
            sizeEx = FONTSIZE;
        };
        */
        class RscListboxVehicleList: RscListBox_OPT
        {
            idc = 20100;
            x = 1 * GUI_GRID_W + GUI_GRID_X;
            y = 6.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 23 * GUI_GRID_W;
            h = 16.5 * GUI_GRID_H;
            onLBSelChanged =  QUOTE([] call FUNC(showVehicleInfo););
            sizeEx = FONTSIZE;
            colorBackground[] = COLOR_CONTROL_BG;
            rowHeight = 0.06;

        };
        class RscTextVehicleInfo: RscStructuredText
        {
            idc = 20101;
            text = "Infobereich..."; //--- ToDo: Localize;
            x = 24 * GUI_GRID_W + GUI_GRID_X;
            y = 6.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 15 * GUI_GRID_W;
            h = 16.5 * GUI_GRID_H;
            sizeEx = FONTSIZE;
            colorBackground[] = COLOR_CONTROL_BG;
        };
        class RscButtonBuy: RscButton
        {
            idc = 20002;
            text = "Bestellen"; //--- ToDo: Localize;
            x = 1.03 * GUI_GRID_W + GUI_GRID_X;
            y = 23.23 * GUI_GRID_H + GUI_GRID_Y;
            w = 7.5 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
            tooltip = "Ausgewähltes Fahrzeug bestellen";
            action = QUOTE([] call FUNC(sendVehicleOrder););
            sizeEx = FONTSIZE;
        };
        class RscButtonSell: RscButton
        {
            idc = 20004;
            text = "Verkaufen"; //--- ToDo: Localize;
            x = 1.03 * GUI_GRID_W + GUI_GRID_X;
            y = 23.23 * GUI_GRID_H + GUI_GRID_Y;
            w = 7.5 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
            tooltip = "Verkaufe Fahrzeug auf dem Bestell-Pad";
            action = QUOTE([] call FUNC(sellVehicle););
            sizeEx = FONTSIZE;
        };
         class RscButtonClear: RscButton
        {
            idc = 20005;
            text = "Räumen"; //--- ToDo: Localize;
            x = 9 * GUI_GRID_W + GUI_GRID_X;
            y = 23.23 * GUI_GRID_H + GUI_GRID_Y;
            w = 7.5 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
            tooltip = "Löscht alle Fahrzeuge um das Bestell-Pad (kein Verkauf!)";
            action = QUOTE([] call FUNC(deleteVehicle););
            sizeEx = FONTSIZE;
            colorBackground[] = Color_DarkRed;
        };
        class RscButtonCancel: RscButton
        {
            idc = 20003;
            text = "Schließen"; //--- ToDo: Localize;
            x = 32 * GUI_GRID_W + GUI_GRID_X;
            y = 23.2 * GUI_GRID_H + GUI_GRID_Y;
            w = 7 * GUI_GRID_W;
            h = 1.5 * GUI_GRID_H;
            tooltip = "Dialog schliessen";
            action = "closeDialog 0";
            sizeEx = FONTSIZE;
        };
    };
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
