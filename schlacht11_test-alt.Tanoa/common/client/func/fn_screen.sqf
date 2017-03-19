//scriptname "EW screen.sqf";
/*
	File: screen.sqf
	Author: Karel Moricky
	
	changed by psycho

	Description:
	Screen Effects

	Parameter(s):
	_this select 0: Intensity (0-1)
*/
disableserialization;
_int = _this select 0;

if (isnil {uinamespace getvariable "RscHealthTextures"}) then {uinamespace setvariable ["RscHealthTextures",displaynull]};
if (isnull (uinamespace getvariable "RscHealthTextures")) then {(["HealthPP_blood_hit"] call bis_fnc_rscLayer) cutrsc ["RscHealthTextures","plain"]};
_display = uinamespace getvariable "RscHealthTextures";


_texLower = _display displayctrl 1211;//1013; //1001
_texMiddle = _display displayctrl 1212;
_texUpper = _display displayctrl 1213;


_x = ((0 * safezoneW) + safezoneX) + ((safezoneW - (2.125 * safezoneW * 3/4)) / 2); //textura vycentrovana na støed (pøièítá se polovina místa které zbývá od konce textury k pravému okraji obrazovky)
_y = (-0.0625 * safezoneH) + safezoneY; //levy horni roh o 10% nad obrazovkou
_w = 2.125 * safezoneW * _int;//safezoneW * 3/4;  //sirka o 20% vetsi nez sirka obrazovky (10% presah vlevo, 10% presah vpravo)
_h = 1.125 * safezoneH;

_control = [_texLower,_texMiddle,_texUpper] call tcb_fnc_randomArrayVal;
/*
//--- Select position
_w = safezoneW * _int;
_h = _w / 0.75;
_pos = [((safezoneX - _w/2) + random (safezoneW)),((safezoneY - _h/2) + random (safezoneH)),_w,_h];
*/
//--- Fade out (0s)
_control ctrlsetposition [_x, _y, _w, _h];
_control ctrlsetfade 1;
_control ctrlcommit 0;
//--- Fade in (0.1s)
_control ctrlsetfade 0 + (random 0.4);
_control ctrlcommit 0.1;
waituntil {ctrlcommitted _control};
sleep 3;
//--- Fade out (random 5-13s)
_control ctrlsetfade 1;
_control ctrlcommit (5 + random 7);
waituntil {ctrlcommitted _control};
//--- Reset
if (ctrlfade _control == 0) then {
	_control ctrlsetposition [0,0,0,0];
	_control ctrlcommit 0;
};

