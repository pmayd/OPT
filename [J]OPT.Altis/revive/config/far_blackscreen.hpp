    class far_blackscreen {

        idd = 5651;
        movingEnable = false;
        controls[]= {
            "OuterBackground", "Skull", "GREUH_WoundedLabel"
        };

        class OuterBackground {
            idc = -1;
            type =  CT_STATIC;
            style = ST_LEFT;
            colorText[] = Color_Black;
            colorBackground[] = Color_Black;
            font = DEFAULTFONT;
            sizeEx = 0.023;
            x = -3; y = -3;
            w = 9;  h = 9;
            text = "";
        };

        class Skull {
            idc = -1;
            type =  CT_STATIC;
            style = ST_PICTURE;
            colorText[] = {1,1,1,0.15};
            colorBackground[] = Color_NoColor;
            font = DEFAULTFONT;
            sizeEx = 0.1 * safezoneH;
            x = 0.3 * safezoneW + safezoneX;
            w = 0.4 * safezoneW;
            y = 0.2 * safezoneH + safezoneY;
            h = 0.6 * safezoneH;
            text = "revive\rsc\skull.paa";
        };

        class GREUH_WoundedLabel {
            idc = -1;
            type =  CT_STATIC;
            style = ST_CENTER;
            colorText[] = Color_White;
            colorBackground[] = Color_NoColor;
            font = DEFAULTFONT;
            sizeEx = 0.07 * safezoneH;
            shadow = 1;
            x = 0.3 * safezoneW + safezoneX; y= 0.25 * safezoneH + safezoneY;
            w = 0.4 * safezoneW; h = 0.07 * safezoneH;
            text = "Sie sind verwundet.";
        };
    };

    class GreuhButton {
        idc = -1;
        type = CT_BUTTON;
        style = ST_CENTER;
        default = false;
        font = DEFAULTFONT;
        sizeEx = 0.018 * safezoneH;
        colorText[] = { 0, 0, 0, 1 };
        colorFocused[] = { 1, 1, 1, 1 };
        colorDisabled[] = { 0.2, 0.2, 0.2, 0.7 };
        colorBackground[] = { 0.8, 0.8, 0.8, 0.8 };
        colorBackgroundDisabled[] = { 0.5, 0.5, 0.5, 0.5 };
        colorBackgroundActive[] = { 1, 1, 1, 1 };
        offsetX = 0.003;
        offsetY = 0.003;
        offsetPressedX = 0.002;
        offsetPressedY = 0.002;
        colorShadow[] = { 0, 0, 0, 0.5 };
        colorBorder[] = { 0, 0, 0, 1 };
        borderSize = 0;
        soundEnter[] = { "", 0, 1 };  // no sound
        soundPush[] = {"\a3\Ui_f\data\Sound\CfgIngameUI\hintExpand", 0.891251, 1};
        soundClick[] = { "", 0, 1 };  // no sound
        soundEscape[] = { "", 0, 1 };  // no sound
        x = 0.45 * safezoneW + safezoneX; y= 0.8 * safezoneH + safezoneY;
        w = 0.1 * safezoneW; h = 0.04 * safezoneH;
        text = "";
        action = "";
        shadow = 1;
    };

    class GREUH_respawn {
        idd = 5566;
        movingEnable = false;
        controlsBackground[] = {"GREUH_BleedoutBar_BG"};
        controls[] = {"GREUH_BleedoutBar","GREUH_BleedoutBar_F","GREUH_Respawn","GREUH_ReviveLabel","GREUH_WoundedLabel", "GREUH_MedicNearLabel"};
        objects[] = {};

        class GREUH_Respawn : GreuhButton {
            idc = 5566;
            x = 0.43 * safezoneW + safezoneX;
            y= 0.75 * safezoneH + safezoneY;
            w = 0.14 * safezoneW; h = 0.04 * safezoneH;
            text = "Respawn";
            action = QUOTE([] call FUNC(closeDialog));// setVar only local at this point to kill the dialogs on local machine!
        };

        class GREUH_ReviveLabel {
            idc = 5567;
            type =  CT_STATIC;
            style = ST_CENTER;
            colorText[] = Color_White;
            colorBackground[] = Color_NoColor;
            font = DEFAULTFONT;
            sizeEx = 0.018 * safezoneH;
            shadow = 1;
            x = 0.4 * safezoneW + safezoneX;
            y= 0.7 * safezoneH + safezoneY;
            w = 0.2 * safezoneW;
            h = 0.025 * safezoneH;
            text = "";
        };

        class GREUH_MedicNearLabel {
            idc = 5568;
            type =  CT_STATIC;
            style = ST_CENTER;
            colorText[] = Color_White;
            colorBackground[] = Color_NoColor;
            font = DEFAULTFONT;
            sizeEx = 0.023 * safezoneH;
            shadow = 1;
            x = 0.4 * safezoneW + safezoneX;
            y= 0.8 * safezoneH + safezoneY;
            w = 0.2 * safezoneW;
            h = 0.04 * safezoneH;
            text = "Keine Sanitäter in Reichweite";
        };

        class GREUH_WoundedLabel {
            idc = 4567;
            type =  CT_STATIC;
            style = ST_CENTER;
            colorText[] = Color_White;
            colorBackground[] = Color_NoColor;
            font = DEFAULTFONT;
            sizeEx = 0.07 * safezoneH;
            shadow = 1;
            x = 0.3 * safezoneW + safezoneX; y= 0.25 * safezoneH + safezoneY;
            w = 0.4 * safezoneW; h = 0.07 * safezoneH;
            text = "Sie sind verwundet.";
        };

        class GREUH_BleedoutBar {
            idc = 6699;
            type =  CT_STATIC;
            style = ST_SINGLE;
            colorText[] = Color_White;
            colorBackground[] = Color_Bleedout;
            font = DEFAULTFONT;
            sizeEx = 0.023;
            x = (0.4 * safezoneW + safezoneX); y= (0.7 * safezoneH + safezoneY);
            w = (0.2 * safezoneW); h = (0.03 * safezoneH);
            text = "";
        };
        class GREUH_BleedoutBar_BG : GREUH_BleedoutBar {
            idc = -1;
            colorBackground[] = Color_Black_Alpha;
            x = (0.4 * safezoneW + safezoneX) - 0.005; y= (0.7 * safezoneH + safezoneY) - 0.005;
            w = (0.2 * safezoneW) + 0.01; h = (0.03 * safezoneH) + 0.01;
        };
        class GREUH_BleedoutBar_F : GREUH_BleedoutBar {
            idc = 6698;
            colorText[] = Color_White;
            style = ST_FRAME;
            x = (0.4 * safezoneW + safezoneX) - 0.005; y= (0.7 * safezoneH + safezoneY) - 0.005;
            w = (0.2 * safezoneW) + 0.01; h = (0.03 * safezoneH) + 0.01;
        };
    };