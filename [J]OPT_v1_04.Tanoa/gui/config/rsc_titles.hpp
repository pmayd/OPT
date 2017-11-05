
// class RscTitles only in description.ext!
class APP(message_1) {
    idd = IDD_MSG_MESSAGE_1;
    x = GUI_MSG_X;
    y = GUI_MSG_Y;
    w = GUI_MSG_W;
    h = GUI_MSG_H;
    fade = 1;
    duration = 15;
    onLoad = QUOTE(with missionnameSpace do {disableSerialization; GVAR(msg_cur) - [_this select 0];GVAR(msg_cur) pushBack (_this select 0);};);
    class controls {
        class background : RSC(BaseText) {
            idc = IDC_MSG_background;
            x = GUI_MSG_X;
            y = GUI_MSG_Y;
            w = GUI_MSG_W;
            h = GUI_MSG_H;
            colorBackground[] = COLOR_MSG_BACKGROUND;
            text = "";
        };
        class stripe : RSC(BaseText) {
            idc = IDC_MSG_stripe;
            x = GUI_MSG_X;
            y = GUI_MSG_Y;
            w = GUI_MSG_COL;
            h = GUI_MSG_HEAD + GUI_MSG_TEXT;
            colorBackground[] = {RAL6018, 1};
            text = "";
        };
        class header : RSC(BaseStructuredText) {
            idc = IDC_MSG_header;
            x = GUI_MSG_X + GUI_MSG_COL;
            y = GUI_MSG_Y;
            w = GUI_MSG_W;
            h = GUI_MSG_HEAD;
            text = "ERROR: No Header";
            size = GUI_MSG_TEXTSIZE;
            shadow = 0;
            colorBackground[] = {0, 0, 0, 0};
            colorText[] = {0.8156862, 0.8156862, 0.8156862, 1};
            class Attributes : Attributes {
                shadow = 0;
                font = FONT_BOLD;
                align = "left";
                valign = "top";
            };
        };
        class content : RSC(BaseStructuredText) {
            idc = IDC_MSG_content;
            x = GUI_MSG_X + GUI_MSG_COL;
            y = (GUI_MSG_Y + GUI_MSG_HEAD);
            w = GUI_MSG_W;
            h = GUI_MSG_TEXT;
            text = "ERROR: No Text";
            shadow = 0;
            colorBackground[] = {0, 0, 0, 0};
            colorText[] = {0.8156862, 0.8156862, 0.8156862, 1};
            size = GUI_MSG_TEXTSIZE*0.65;
            class Attributes : Attributes {
                shadow = 0;
                font = FONT_THIN;
            };
        };
    };
};
class APP(message_2) : APP(message_1) {idd = IDD_MSG_MESSAGE_2;};
class APP(message_3) : APP(message_1) {idd = IDD_MSG_MESSAGE_3;};
class APP(message_4) : APP(message_1) {idd = IDD_MSG_MESSAGE_4;};
class APP(message_5) : APP(message_1) {idd = IDD_MSG_MESSAGE_5;};
class APP(message_6) : APP(message_1) {idd = IDD_MSG_MESSAGE_6;};
class APP(message_7) : APP(message_1) {idd = IDD_MSG_MESSAGE_7;};
class APP(message_8) : APP(message_1) {idd = IDD_MSG_MESSAGE_8;};
class APP(message_9) : APP(message_1) {idd = IDD_MSG_MESSAGE_9;};
