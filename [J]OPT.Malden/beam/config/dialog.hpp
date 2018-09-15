class DialogBeam
{
    idd = 444001;
    onload = QUOTE([] spawn FUNC(onLoadDialog););
    movingEnable = true;
    controlsBackground[] = {BACKGROUND3};


  class BACKGROUND3 : RSCText
  {
     colorBackground[] = {0.2,0.2,0.2,0.5};
     text = ;
     x = 0.15;
     y = 0.15;
     w = 0.7;
     h = 0.7;
  };

  objects[] = { };
  controls[] = { Name0,box1,buttonwm,buttonwp};

  class Name0 : RSCText
  {
        style = ST_CENTER;
        sizeEx = 0.06;
        colorText[] = {1.0,1.0,1.0,1};
         x = 0.25;
        y = 0.00;
         w = 0.5;
         h = 0.15;
        text = "Ortswahl";
        default = true;
  };
  class box1 : RSCListBox
  {
        idc = 10002;
        sizeEx = 0.04;
        rowHeight = 0.023;
        colorText[] = {1.0, 1.0, 1.0, 1};
        colorBackground[] = {0, 0, 0, 0.7};
        x = 0.2;
         y = 0.2;
         w = 0.60;
         h = 0.5;
        default = true;
  };
 class buttonwm : RSCButton
  {
        idc = 10004;
        style = ST_CENTER;
        sizeEx = 0.03;
        x = 0.2;
         y = 0.72;
         w = 0.1;
         h = 0.05;
        text = "OK";
        action = QUOTE([lbCurSel 10002] spawn FUNC(beam););
        default = true;
  };
 class buttonwp : RSCButton
  {
        idc = 10006;
        style = ST_CENTER;
        sizeEx = 0.03;
        x = 0.33;
         y = 0.72;
         w = 0.1;
         h = 0.05;
        text = "Abbrechen";
        action = "closeDialog 0";
        default = true;
  };
};

