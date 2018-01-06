
class RSC(BaseStructuredText) {
    type = 13;
    style = "0x00";
    colorBackground[] = COLOR_BACKGROUND;
    size = TEXT_SIZE_MEDIUM;
    text = "";
    class Attributes {
        font = FONT_DEFAULT;
        color = "#000000";
        align = "left";
        valign = "middle";
        shadow = 0;
        shadowColor = "#ff0000";
        size = 1;
    };
};


class RSC(BaseText) {
    idc = -1;
    type = 0;
    style = "0x00";
    x = 0;
    y = 0;
    w = 0;
    h = 0;
    sizeEx = TEXT_SIZE_MEDIUM;
    shadow = 0;
    colorShadow[] = COLOR_DISABLED;
    text = "";
    font = FONT_DEFAULT;
    colorText[] = COLOR_FONT;
    colorBackground[] = COLOR_BACKGROUND;
    tooltipColorText[] = COLOR_FONT;
    tooltipColorBox[] = COLOR_BACKGROUND;
    tooltipColorShade[] = COLOR_BACKGROUND;
    access = 0;
};
