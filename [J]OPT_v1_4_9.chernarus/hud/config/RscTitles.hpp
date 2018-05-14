
#define FONTSIZE (0.022 / (getResolution select 5))  // dynamische Anpassung je nach UI Schriftgröße

// class RscTitles only in description.ext!

// From AIS injury by Pyschobastard (http://www.armaholic.com/page.php?id=24088)
class ais_ProgressBar {
    idd = -1;
    movingEnable = 0;
    objects[] = {};
    duration = 1e+011;
    name = "ais_ProgressBar";
    onload = "_this call opt_addons_fnc_progressBarInit;"; // TODO:

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
        text = "Erst Köpfe reiben und dann zusammen ein kühles Blondes!";
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
            text="\bilder\opt_logo_reco_hd.png";
            sizeEx = 256;
        };
    };
};


class dom_Empty {
    idd = -1;
    duration = 0;
    class controls {};
};


//----------------------------------- BASE CAPTURE DISPLAY -------------------------------------
class DefaultMenu {
    idd = 5000;
    objects[] = {};

    class BackgroundBar: IGUIBack {
        idc = 2200;
        x = safezoneX;
        y = safezoneY + safezoneH - 0.025 * safezoneH;
        w = safezoneW;
        h = 0.025 * safezoneH;
        colorbackground[] = CA_UI_background_2;
    }

    // 1. Feld
    class PlayersDisplay : GUILargeText {
        idc = 5101;
        x = safezoneX + 0/6 * safezoneW;
        y = safezoneY + safezoneH - 0.025 * safezoneH;
        w = 1/6 * 0.9 * safezoneW;
        h = 0.025 * safezoneH;
        sizeEx = FONTSIZE;
        shadow = 1;
        colorText[] = Color_GrayLight;
        text = "Spieler:";
    };	

    // 2. Feld
    class FrameDisplay : GUILargeText {
        idc = 5102;
        x = safezoneX + 1/6 * 0.9 * safezoneW;
        y = safezoneY + safezoneH - 0.025 * safezoneH;
        w = 1/6 * 0.9 * safezoneW;
        h = 0.025 * safezoneH;
        sizeEx = FONTSIZE;
        shadow = 1;
        colorText[] = Color_GrayLight;
        text = "FPS:";
    };	

    // 3. Feld
    class BudgetDisplay : GUILargeText {
        idc = 5103;
        x = safezoneX + 2/6 * 0.9 * safezoneW;
        y = safezoneY + safezoneH - 0.025 * safezoneH;
        w = 1/6 * 0.9 * safezoneW;
        h = 0.025 * safezoneH;
        sizeEx = FONTSIZE;
        shadow = 1;
        colorText[] = Color_GrayLight;
        text = "Budget:";
    };

    // 4. Feld
    class ScoreDisplay : GUILargeText {
        idc = 5104;
        x = safezoneX + 0.1 * safezoneW +  3/6 * 0.9 * safezoneW;
        y = safezoneY + safezoneH - 0.025 * safezoneH;
        w = 1/6 * 0.9 * safezoneW;
        h = 0.025 * safezoneH;
        sizeEx = FONTSIZE;
        colorText[] = Color_GrayLight;
        shadow = 1;
        text = "Punkte:";
    };
    
    // 5. Feld
    class TimerDisplay : GUILargeText {
        idc = 5105;
        x = safezoneX + 0.1 * safezoneW +  4/6 * 0.9 * safezoneW;
        y = safezoneY + safezoneH - 0.025 * safezoneH;
        w = 1/6 * 0.9 * safezoneW;
        h = 0.025 * safezoneH;
        sizeEx = FONTSIZE;
        colorText[] = Color_GrayLight;
        shadow = 1;
        text = "Spielzeit:";
    };		

    // 6. Feld
    class EmptyDisplay : GUILargeText {
        idc = 5106;
        x = safezoneX + 0.1 * safezoneW +  5/6 * 0.9 * safezoneW;
        y = safezoneY + safezoneH - 0.025 * safezoneH;
        w = 1/6 * 0.9 * safezoneW;
        h = 0.025 * safezoneH;
        sizeEx = FONTSIZE;
        colorText[] = Color_GrayLight;
        shadow = 1;
        text = "";
    };	
    
};

//--------------------------------------------------------------------------------------------------
//                                        HUD DISPLAY
//--------------------------------------------------------------------------------------------------
    
class GVAR(rsc_hud): DefaultMenu {
    duration = 15000;
    name = "HudDisplay";
    idd = 4999;			
    onLoad = __EVAL(format["uiNamespace setVariable ['%1' , _this select 0]", QGVAR(display)]);	
    movingEnable = false;
    moving = false;
    enableSimulation = true;
    objects[] = {};

    controls[] = {};
    
    //NB: the order of the listing of controls is important. The first control listed goes on the
    //    bottom, the last goes on top
    // add BackgroundBar to have a nicer background
    controlsBackground[] = {
        BackgroundBar, ScoreDisplay, PlayersDisplay, TimerDisplay, FrameDisplay, BudgetDisplay
    };			
};
