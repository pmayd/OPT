class GVAR(Dialog)
{
  idd = 444001;
  onload = QUOTE([] spawn FUNC(onLoadDialog););
  movingEnable = true;
  controlsBackground[] = {BACKGROUND3};


  class BACKGROUND3 : RSCText
  {
     colorBackground[] = {0.2,0.2,0.2,0.5};
     text = ;
     x = 0.10;
     y = 0.10;
     w = 0.9;
     h = 0.9;
  };

  objects[] = { };
  controls[] = { Name,Fahrzeugname,Kosten,Bild,MuniBild1,MuniBild2,MuniBild3,MuniBild4,MuniBild5,MuniBild6,boxslot1,boxslot2,boxslot3,boxslot4,boxslot5,boxslot6,boxslot7,buttonok,buttonAB,buttonEW,Munitext1,Munitext2,Munitext3,Munitext4,Munitext5,Munitext6,boxtext1,boxtext2,boxtext3,boxtext4,boxtext5,boxtext6,boxtext7};

  class name : RSCText
  {
        style = ST_CENTER;
        sizeEx = 0.05;
        colorText[] = {1.0,1.0,1.0,1};
         x = 0.5;
        y = 0.00;
         w = 0.5;
         h = 0.15;
        text = "Waffenwechsel";
        default = true;
  };
  class Fahrzeugname : RSCText
  {
        idc = 10000;
        style = ST_CENTER;
        sizeEx = 0.1;
        colorText[] = {1,1,0,1};
         x = 0.2;
        y = 0.1;
         w = 0.8;
         h = 0.1;
        text = "10000";
        default = true;
  };
  class Kosten : RSCText
  {
        idc = 10001;
        style = ST_CENTER;
        sizeEx = 0.04;
        colorText[] = {1,1,0,1};
         x = 0.6;
        y = 0.92;
         w = 0.2;
         h = 0.05;
        text = "10000";
        default = true;
  };
    class Bild : RscPicture
  {
        idc = 10002;
         x = 0.33;
         y = 0.3;
         w = 0.45;
         h = 0.6;
        default = true;
  };
     class MuniBild1 : RscPicture
  {
        idc = 10003;
         x = 0.15;
         y = 0.3;
         w = 0.05;
         h = 0.05;
        default = true;
  };
    class MuniBild2 : RscPicture
  {
        idc = 10004;
         x = 0.15;
         y = 0.35;
         w = 0.05;
         h = 0.05;
        default = true;
  };
    class MuniBild3 : RscPicture
  {
        idc = 10005;
         x = 0.15;
         y = 0.4;
         w = 0.05;
         h = 0.05;
        default = true;
  };
    class MuniBild4 : RscPicture
  {
        idc = 10006;
         x = 0.7;
         y = 0.3;
         w = 0.05;
         h = 0.05;
        default = true;
  };
    class MuniBild5 : RscPicture
  {
        idc = 10007;
         x = 0.7;
         y = 0.35;
         w = 0.05;
         h = 0.05;
        default = true;
  };
    class MuniBild6 : RscPicture
  {
        idc = 10008;
         x = 0.7;
         y = 0.4;
         w = 0.05;
         h = 0.05;
        default = true;
  };  
  class boxslot1 : RscCombo
  {
        idc = 10010;
        sizeEx = 0.03;
        rowHeight = 0.023;
        colorText[] = {1.0, 1.0, 1.0, 1};
        colorBackground[] = {0, 0, 0, 0.7};
        x = 0.15;
         y = 0.6;
         w = 0.25;
         h = 0.05;
        default = true;
  };
  
    class boxslot2 : RscCombo
  {
        idc = 10011;
        sizeEx = 0.03;
        rowHeight = 0.023;
        colorText[] = {1.0, 1.0, 1.0, 1};
        colorBackground[] = {0, 0, 0, 0.7};
        x = 0.15;
         y = 0.7;
         w = 0.25;
         h = 0.05;
        default = true;
  };
  
    class boxslot3 : RscCombo
  {
        idc = 10012;
        sizeEx = 0.03;
        rowHeight = 0.023;
        colorText[] = {1.0, 1.0, 1.0, 1};
        colorBackground[] = {0, 0, 0, 0.7};
        x = 0.15;
         y = 0.8;
         w = 0.25;
         h = 0.05;
        default = true;
  };
  
    class boxslot4 : RscCombo
  {
        idc = 10013;
        sizeEx = 0.03;
        rowHeight = 0.023;
        colorText[] = {1.0, 1.0, 1.0, 1};
        colorBackground[] = {0, 0, 0, 0.7};
        x = 0.7;
         y = 0.6;
         w = 0.25;
         h = 0.05;
        default = true;
  };
  
    class boxslot5 : RscCombo
  {
        idc = 10014;
        sizeEx = 0.03;
        rowHeight = 0.023;
        colorText[] = {1.0, 1.0, 1.0, 1};
        colorBackground[] = {0, 0, 0, 0.7};
        x = 0.7;
         y = 0.7;
         w = 0.25;
         h = 0.05;
        default = true;
  };
  
    class boxslot6 : RscCombo
  {
        idc = 10015;
        sizeEx = 0.03;
        rowHeight = 0.023;
        colorText[] = {1.0, 1.0, 1.0, 1};
        colorBackground[] = {0, 0, 0, 0.7};
        x = 0.7;
         y = 0.8;
         w = 0.25;
         h = 0.05;
        default = true;
  };
      class boxslot7 : RscCombo
  {
        idc = 10016;
        sizeEx = 0.03;
        rowHeight = 0.023;
        colorText[] = {1.0, 1.0, 1.0, 1};
        colorBackground[] = {0, 0, 0, 0.7};
        x = 0.42;
         y = 0.8;
         w = 0.25;
         h = 0.05;
        default = true;
  };
 class buttonok : RSCButton
  {
        idc = 10020;
        style = ST_CENTER;
        sizeEx = 0.03;
        x = 0.2;
         y = 0.92;
         w = 0.1;
         h = 0.05;
        text = "OK";
        action = "OPTWWbuygo=1";
        default = true;
  };
 class buttonAB : RSCButton
  {
        idc = 10021;
        style = ST_CENTER;
        sizeEx = 0.03;
        x = 0.33;
         y = 0.92;
         w = 0.1;
         h = 0.05;
        text = "Abbrechen";
        action = "closeDialog 0";
        default = true;
 };
  class buttonEW : RSCButton
  {
        idc = 10022;
        style = ST_CENTER;
        sizeEx = 0.03;
        x = 0.46;
         y = 0.92;
         w = 0.1;
         h = 0.05;
        text = "Entwaffnen";
        action = "OPTWWlostgo=1";
        default = true;
 };
   class Munitext1 : RSCText
  {
        idc = 10031;
        style = ST_LEFT;
        sizeEx = 0.025;
        colorText[] = {1,1,0,1};
         x = 0.21;
        y = 0.3;
         w = 0.24;
         h = 0.05;
        text = "10000";
        default = true;
  };
    class Munitext2 : RSCText
  {
        idc = 10032;
        style = ST_LEFT;
        sizeEx = 0.025;
        colorText[] = {1,1,0,1};
         x = 0.21;
        y = 0.35;
         w = 0.24;
         h = 0.05;
        text = "10000";
        default = true;
  };
    class Munitext3 : RSCText
  {
        idc = 10033;
        style = ST_LEFT;
        sizeEx = 0.025;
        colorText[] = {1,1,0,1};
         x = 0.21;
        y = 0.4;
         w = 0.24;
         h = 0.05;
        text = "10000";
        default = true;
  };
    class Munitext4 : RSCText
  {
        idc = 10034;
        style = ST_LEFT;
        sizeEx = 0.025;
        colorText[] = {1,1,0,1};
         x = 0.76;
        y = 0.3;
         w = 0.24;
         h = 0.05;
        text = "10000";
        default = true;
  };
    class Munitext5 : RSCText
  {
        idc = 10035;
        style = ST_LEFT;
        sizeEx = 0.025;
        colorText[] = {1,1,0,1};
         x = 0.76;
        y = 0.35;
         w = 0.24;
         h = 0.05;
        text = "10000";
        default = true;
  };
    class Munitext6 : RSCText
  {
        idc = 10036;
        style = ST_LEFT;
        sizeEx = 0.025;
        colorText[] = {1,1,0,1};
         x = 0.76;
        y = 0.4;
         w = 0.24;
         h = 0.05;
        text = "10000";
        default = true;
  };
      class boxtext1 : RSCText
  {
        idc = 10037;
        style = ST_LEFT;
        sizeEx = 0.025;
        colorText[] = {1,1,0,1};
         x = 0.15;
         y = 0.58;
         w = 0.24;
         h = 0.02;
        text = "";
        default = true;
  };
        class boxtext2 : RSCText
  {
        idc = 10038;
        style = ST_LEFT;
        sizeEx = 0.025;
        colorText[] = {1,1,0,1};
        x = 0.15;
         y = 0.68;
         w = 0.24;
         h = 0.02;
        text = "";
        default = true;
  };
        class boxtext3 : RSCText
  {
        idc = 10039;
        style = ST_LEFT;
        sizeEx = 0.025;
        colorText[] = {1,1,0,1};
        x = 0.15;
         y = 0.78;
         w = 0.24;
         h = 0.02;
        text = "";
        default = true;
  };
        class boxtext4 : RSCText
  {
        idc = 10040;
        style = ST_LEFT;
        sizeEx = 0.025;
        colorText[] = {1,1,0,1};
        x = 0.7;
         y = 0.58;
         w = 0.24;
         h = 0.02;
        text = "";
        default = true;
  };
        class boxtext5 : RSCText
  {
        idc = 10041;
        style = ST_LEFT;
        sizeEx = 0.025;
        colorText[] = {1,1,0,1};
        x = 0.7;
         y = 0.68;
         w = 0.24;
         h = 0.02;
        text = "";
        default = true;
  };
        class boxtext6 : RSCText
  {
        idc = 10042;
        style = ST_LEFT;
        sizeEx = 0.025;
        colorText[] = {1,1,0,1};
        x = 0.7;
         y = 0.78;
         w = 0.24;
         h = 0.02;
        text = "";
        default = true;
  };
        class boxtext7 : RSCText
  {
        idc = 10043;
        style = ST_LEFT;
        sizeEx = 0.025;
        colorText[] = {1,1,0,1};
        x = 0.42;
         y = 0.78;
         w = 0.24;
         h = 0.02;
        text = "";
        default = true;
  };

};
