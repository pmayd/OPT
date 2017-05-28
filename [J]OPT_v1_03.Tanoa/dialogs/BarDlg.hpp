class AME_Core_Progress_BarDlg {
    idd = -1;
    movingEnable = false;
    onLoad = "uiNamespace setVariable ['AME_Core_Progress_ProgressBar', (_this select 0) displayCtrl 1]; uiNamespace setVariable ['AME_Core_Progress_ProgressTitle', (_this select 0) displayCtrl 2];";
    objects[] = {};

    class controlsBackground {
        class Background {
            idc = -1;
            moving = 0;
            font = "TahomaB";
            text = "";
            sizeEx = 0;
            lineSpacing = 0;
            access = 0;
            type = 0;
            style = 0;
            size = 1;
            colorBackground[] = {0, 0, 0, 0.1};
            colorText[] = {0, 0, 0, 0};
            x = "safezoneX";
            y = "safezoneY";
            w = "safezoneW";
            h = "safezoneH";
        };
        class ProgressBar {
            idc = 1;
            moving = 0;
            text = "";
            font = "PuristaMedium";
            sizeEx = "1 / 40 / (getResolution select 5)";
            lineSpacing = 0;
            access = 0;
            type = 0;
            style = 2;
            size = 1;
            colorBackground[] = {1, 0.647, 0, 0.7};
            colorText[] = {1,1,1,1};
            x = "safezoneX + 0.3 * safezoneW";
            y = "safezoneY + 0.2 * safezoneH";
            w = "0";
            h = "0.005 * safezoneH";
        };
        class TitleBar : ProgressBar {
            idc = 2;
            colorBackground[] = {0, 0, 0, 0};
            x = "safezoneX + 0.1 * safezoneW";
            y = "safezoneY + 0.15 * safezoneH";
            w = "0.8 * safezoneW";
            h = "0.05 * safezoneH";
            align = "center";
            valign = "middle";
            shadow = 1;
            shadowColor = "#ff0000";
        };
    };
};