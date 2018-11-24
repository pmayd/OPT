/**
* Funktion Dialog Waffenwechsel
* 
* Author: [GNC]Lord-MDB
*
* Arguments:
* keine
* 
* Return Value:
* keine
* 
* Server only:
* nein
*
* Public:
* nein
* 
* Global:
* nein
* 
* Sideeffects:
* keine
* 
* Example:
* 
* 
* 
*
*/
#include "script_component.hpp"

disableSerialization;

//Init Dialogfelder
private _pad = nil;
private _veh = 0;
ctrlShow [10003, false ];
ctrlShow [10004, false ];
ctrlShow [10005, false ];
ctrlShow [10006, false ];
ctrlShow [10007, false ];
ctrlShow [10008, false ];

ctrlShow [10031, false ];
ctrlShow [10032, false ];
ctrlShow [10033, false ];
ctrlShow [10034, false ];
ctrlShow [10035, false ];
ctrlShow [10036, false ];
ctrlSetText [10001, "$:0"];

//Fahrzeugfestllung
private _Objket = ["Air","Tank","wheeled_apc","car"];
    
_pad = (nearestObject [player, 'Land_HelipadCircle_F']);
_veh = (nearestObjects[_pad,_Objket,10]) select 0;

private _Fname = getText (configFile >> "CfgVehicles" >> (typeof _veh) >> "displayName");
private _FBild = getText (configFile >> "CfgVehicles" >> (typeof _veh) >> "icon");

private _typveh="";

{
    if ((typeof _veh) == _x) then {_typveh = _x};

} forEach GVAR(vehclasswestWW);
    
{
    if ((typeof _veh) == _x) then {_typveh = _x};

} forEach GVAR(vehclasseastWW);

private _boxarry=[];
private _side=civilian;
private _pylon=[];
private _Boxnamen =[];

if (_typveh in (GVAR(vehclasswestWW)+GVAR(vehclasseastWW))) then 
    {
        switch (_typveh) do 
        {
            case "OPT4_B_Heli_Light_01_armed_F": {_boxarry = GVAR(Pawnee);_side=west;_pylon=["pylonleft1","pylonright1"];};
            case "OPT4_B_Heli_light_03_green_F": {_boxarry = GVAR(hellcat1);_side=west;_pylon=["pylonleft1","pylonright1"];}; //kallek
			case "OPT4_B_Heli_Attack_01_F": {_boxarry = GVAR(Blackfoot);_side=west;_pylon=["pylonleft1","pylonleft3","pylonright1","pylonright3"];};
            case "OPT4_B_MRAP_01_hmg_F": {_boxarry = GVAR(HunterHMG);_side=west;_pylon=[];};
            case "OPT4_B_MRAP_01_gmg_F": {_boxarry = GVAR(HunterGMG);_side=west;_pylon=[];};
			case "OPT4_B_MRAP_03_gmg_F": {_boxarry = GVAR(StriderGMG);_side=west;_pylon=[];};
            case "OPT_B_T_LSV_01_armed_F": {_boxarry = GVAR(ProwlerHMG);_side=west;_pylon=[];};
            case "OPT4_B_LSV_01_AT_F": {_boxarry = GVAR(ProwlerAT);_side=west;_pylon=[];};
            case "OPT4_B_APC_Tracked_01_rcws_F": {_boxarry = GVAR(Panther);_side=west;_pylon=[];};
            case "OPT4_B_APC_Wheeled_01_cannon_F": {_boxarry = GVAR(Marshall);_side=west;_pylon=[];};
            case "OPT4_B_APC_tracked_03_cannon_F": {_boxarry = GVAR(Mora);_side=west;_pylon=[];};
            case "OPT4_B_APC_Tracked_01_AA_F": {_boxarry = GVAR(Cheetah);_side=west;_pylon=[];};
            case "OPT4_B_MBT_01_TUSK_F": {_boxarry = GVAR(SlammerUp);_side=west;_pylon=[];};    
            
            case "OPT4_O_Heli_Light_02_F": {_boxarry = GVAR(Orca);_side=east;_pylon=["pylonleft1","pylonright1"];};
            case "OPT4_O_Heli_Attack_02_F": {_boxarry = GVAR(Kajman);_side=east;_pylon=["pylonleft1","pylonleft2","pylonright1","pylonright2"];};  
            case "OPT4_O_Heli_light_03_green_F": {_boxarry = GVAR(hellcat);_side=east;_pylon=["pylonleft1","pylonright1"];}; 			
            case "OPT4_O_MRAP_02_hmg_F": {_boxarry = GVAR(irifHMG);_side=east;_pylon=[];};
            case "OPT4_O_MRAP_02_gmg_F": {_boxarry = GVAR(irifGMG);_side=east;_pylon=[];};
			case "OPT_O_T_LSV_02_armed_F": {_boxarry = GVAR(QuilinHMG);_side=east;_pylon=[];};
            case "OPT4_O_LSV_02_AT_F": {_boxarry = GVAR(QuilinAT);_side=east;_pylon=[];};
            case "OPT4_O_APC_Wheeled_02_rcws_F": {_boxarry = GVAR(Marid);_side=east;_pylon=[];};
            case "OPT4_O_APC_Wheeled_03_cannon_F": {_boxarry = GVAR(Gorgon);_side=east;_pylon=[];};
            case "OPT4_O_APC_Tracked_02_cannon_F": {_boxarry = GVAR(Kamysh);_side=east;_pylon=[];};
            case "OPT4_O_APC_Tracked_02_AA_F": {_boxarry = GVAR(Tigris);_side=east;_pylon=[];};    
            case "OPT4_O_MBT_02_cannon_F": {_boxarry = GVAR(Varsuk);_side=east;_pylon=[];};
			case "OPT4_B_MBT_01_arty_F": {_boxarry = GVAR(Scorcher);_side=west;_pylon=[];}; 
			case "OPT4_O_MBT_02_arty_F": {_boxarry = GVAR(Sochor);_side=east;_pylon=[];}; 
			case "OPT4_O_T_MBT_02_arty_ghex_F": {_boxarry = GVAR(Sochor);_side=east;_pylon=[];}; 
            
            default {_boxarry = [];_side=civilian;};
        };
    }
else
    {
    _boxarry = [];_side=civilian;
    };
	
//Schütze aussteigen
(gunner _veh) action ["getout",_veh];
	
//Festellung Bewaffnung
private _Magazinveh = magazines _veh;
private _weaponsveh = weapons _veh;
private _Magazinveharrynew =[];

_Magazinveharrynew = [_veh] call FUNC(auslesenmagazine);

// Darstellung Magazine
private _anzahlMagazinveh = count _Magazinveharrynew; 

if (_anzahlMagazinveh > 0) then 
{
   private _anzeige=[];
   private _MuniKugel = "\A3\Weapons_F\Data\UI\m_200rnd_65x39_yellow_ca.paa";
   private _MuniRakete = "\A3\Weapons_F_beta\Launchers\titan\Data\UI\gear_titan_missile_atl_CA.paa";

    if (_veh isKindOf "Air") then 
    {
        {
            if (getNumber (configFile >> "cfgMagazines" >> (_x select 0) >> "count") > 30) then {_anzeige pushBack _MuniKugel;} else {_anzeige pushBack _MuniRakete;};
        } forEach _Magazinveharrynew;
    }
    else 
    {
        {if (true) then {_anzeige pushBack _MuniKugel;};} forEach _Magazinveh;
    };
	
    private _Munitext1 = "";
    private _Munitext2 = "";
    private _Munitext3 = "";
    private _Munitext4 = "";
    private _Munitext5 = "";
    private _Munitext6 = "";
	
	private _MuniBild1 = "";
    private _MuniBild2 = "";
    private _MuniBild3 = "";
    private _MuniBild4 = "";
    private _MuniBild5 = "";
    private _MuniBild6 = "";

    for "_i" from 1 to _anzahlMagazinveh do
            {
            //Bild
                call compile format["_MuniBild%1 =_anzeige select _i-1;",_i];
                call compile format["ctrlSetText [(10002+_i), _MuniBild%1];",_i];
                ctrlShow [(10002+_i), true ];
            //Text    
                call compile format["_Munitext%1 =getText (configFile >> 'cfgMagazines' >> ((_Magazinveharrynew select (_i-1)) select 0) >> 'displayName')",_i];
                call compile format["ctrlSetText [(10030+_i), _Munitext%1];",_i];
                ctrlShow [(10030+_i), true ];
                
                sleep 0.001;
            };        
};
          
ctrlSetText [10000, _Fname];
ctrlSetText [10002, format["%1",_FBild]];

//Preis vorhandene Bewaffnung
private _bewaffnungpreis=0;

if (_side == civilian) then 
    {
    //Box7 füllen
    private _index = lbAdd [10016,format ["Datalink $%1",GVAR(PreisDatalink)]];    
    _index = lbAdd [10016,"Leer"];    
    ctrlSetText [10043, "Datalink"];
    }
else
    {
    _bewaffnungpreis = [_side,_Magazinveharrynew] call FUNC(GeldvorhandeneBewaffnung);
    
    ctrlSetText [10001, format["$:%1",_bewaffnungpreis]];

    //Boxen füllen
    private _Rakmag=((_boxarry Select 4) Select 0);
    private _gunmag=((_boxarry Select 4) Select 1);
    private _draht=((_boxarry Select 2) Select 0);
    private _tranung=((_boxarry Select 2) Select 1);
    private _datalink=((_boxarry Select 3) Select 0);

        if (_veh isKindOf "Air") then 
        {
            //Box1+2
            if (_side == west) then 
                    {    
                        {
                        _index = lbAdd [10010, format["%1 $%2",((GVAR(Gunheliwest) Select _x) Select 4),((GVAR(Gunheliwest) Select _x) Select 3)]];
                        } forEach (_boxarry Select 1);
                        {
                        _index = lbAdd [10011, format["%1 $%2",((GVAR(Gunheliwest) Select _x) Select 4),((GVAR(Gunheliwest) Select _x) Select 3)]];
                        } forEach (_boxarry Select 1);
                        _index = lbAdd [10010,"Leer"];    
                        _index = lbAdd [10011,"Leer"];    
                        ctrlSetText [10037, "Magazin Gun"];
                        ctrlSetText [10038, "Magazin Gun"];
                    }
            else
                    {
                        {
                        _index = lbAdd [10010, format["%1 $%2",((GVAR(Gunhelieast) Select _x) Select 4),((GVAR(Gunhelieast) Select _x) Select 3)]];
                        } forEach (_boxarry Select 1);
                        {
                        _index = lbAdd [10011, format["%1 $%2",((GVAR(Gunhelieast) Select _x) Select 4),((GVAR(Gunhelieast) Select _x) Select 3)]];
                        } forEach (_boxarry Select 1);
                        _index = lbAdd [10010,"Leer"];    
                        _index = lbAdd [10011,"Leer"];
                        ctrlSetText [10037, "Magazin Gun"];
                        ctrlSetText [10038, "Magazin Gun"];
                        
                    };
        
            //Box3+4
            if (_side == west) then 
                    {    
                        {
                        _index = lbAdd [10012, format["%1 $%2",((GVAR(Raktenheliwest) Select _x) Select 4),((GVAR(Raktenheliwest) Select _x) Select 3)]];
                        } forEach (_boxarry Select 0);
                        {
                        _index = lbAdd [10013, format["%1 $%2",((GVAR(Raktenheliwest) Select _x) Select 4),((GVAR(Raktenheliwest) Select _x) Select 3)]];
                        } forEach (_boxarry Select 0);
                        _index = lbAdd [10012,"Leer"];    
                        _index = lbAdd [10013,"Leer"];
                        ctrlSetText [10039, "Magazin Raketen"];
                        ctrlSetText [10040, "Magazin Raketen"];
                    }
                else
                    {
                        {
                        _index = lbAdd [10012, format["%1 $%2",((GVAR(Raktenhelieast) Select _x) Select 4),((GVAR(Raktenhelieast) Select _x) Select 3)]];
                        } forEach (_boxarry Select 0);
                        {
                        _index = lbAdd [10013, format["%1 $%2",((GVAR(Raktenhelieast) Select _x) Select 4),((GVAR(Raktenhelieast) Select _x) Select 3)]];
                        } forEach (_boxarry Select 0);
                        _index = lbAdd [10012,"Leer"];    
                        _index = lbAdd [10013,"Leer"];
                        ctrlSetText [10039, "Magazin Raketen"];
                        ctrlSetText [10040, "Magazin Raketen"];
                    };    
                    
            //Box5+6
            if (_Rakmag > 2) then 
            {
                if (_side == west) then 
                    {    
                        {
                        _index = lbAdd [10014, format["%1 $%2",((GVAR(Raktenheliwest) Select _x) Select 4),((GVAR(Raktenheliwest) Select _x) Select 3)]];
                        } forEach (_boxarry Select 0);
                        {
                        _index = lbAdd [10015, format["%1 $%2",((GVAR(Raktenheliwest) Select _x) Select 4),((GVAR(Raktenheliwest) Select _x) Select 3)]];
                        } forEach (_boxarry Select 0);
                        _index = lbAdd [10014,"Leer"];    
                        _index = lbAdd [10015,"Leer"];
                        ctrlSetText [10041, "Magazin Raketen"];
                        ctrlSetText [10042, "Magazin Raketen"];
                    }
                else
                    {
                        {
                        _index = lbAdd [10014, format["%1 $%2",((GVAR(Raktenhelieast) Select _x) Select 4),((GVAR(Raktenhelieast) Select _x) Select 3)]];
                        } forEach (_boxarry Select 0);
                        {
                        _index = lbAdd [10015, format["%1 $%2",((GVAR(Raktenhelieast) Select _x) Select 4),((GVAR(Raktenhelieast) Select _x) Select 3)]];
                        } forEach (_boxarry Select 0);
                        _index = lbAdd [10014,"Leer"];    
                        _index = lbAdd [10015,"Leer"];
                        ctrlSetText [10041, "Magazin Raketen"];
                        ctrlSetText [10042, "Magazin Raketen"];
                    };
            };    
        }
        else    
        {
            //Box1+2
            if (_side == west) then 
                    {    
                        {
                        _index = lbAdd [10010, format["%1 $%2",((GVAR(Gunvehwest) Select _x) Select 4),((GVAR(Gunvehwest) Select _x) Select 3)]];
                        } forEach (_boxarry Select 1);
                        {
                        _index = lbAdd [10011, format["%1 $%2",((GVAR(Gunvehwest) Select _x) Select 4),((GVAR(Gunvehwest) Select _x) Select 3)]];
                        } forEach (_boxarry Select 1);
                        _index = lbAdd [10010,"Leer"];    
                        _index = lbAdd [10011,"Leer"];
                        ctrlSetText [10037, "Magazin Gun"];
                        ctrlSetText [10038, "Magazin Gun"];
                    }
            else
                    {
                        {
                        _index = lbAdd [10010, format["%1 $%2",((GVAR(Gunveheast) Select _x) Select 4),((GVAR(Gunveheast) Select _x) Select 3)]];
                        } forEach (_boxarry Select 1);
                        {
                        _index = lbAdd [10011, format["%1 $%2",((GVAR(Gunveheast) Select _x) Select 4),((GVAR(Gunveheast) Select _x) Select 3)]];
                        } forEach (_boxarry Select 1);
                        _index = lbAdd [10010,"Leer"];    
                        _index = lbAdd [10011,"Leer"];
                        ctrlSetText [10037, "Magazin Gun"];
                        ctrlSetText [10038, "Magazin Gun"];
                        
                    };
            //Box3+4
            if (_side == west) then 
                    {    
                        {
                        _index = lbAdd [10012, format["%1 $%2",((GVAR(Gunvehwest) Select _x) Select 4),((GVAR(Gunvehwest) Select _x) Select 3)]];
                        } forEach (_boxarry Select 1);
                        {
                        _index = lbAdd [10013, format["%1 $%2",((GVAR(Gunvehwest) Select _x) Select 4),((GVAR(Gunvehwest) Select _x) Select 3)]];
                        } forEach (_boxarry Select 1);
                        _index = lbAdd [10012,"Leer"];    
                        _index = lbAdd [10013,"Leer"];
                        ctrlSetText [10039, "Magazin Gun"];
                        ctrlSetText [10040, "Magazin Gun"];
                    }
            else
                    {
                        {
                        _index = lbAdd [10012, format["%1 $%2",((GVAR(Gunveheast) Select _x) Select 4),((GVAR(Gunveheast) Select _x) Select 3)]];
                        } forEach (_boxarry Select 1);
                        {
                        _index = lbAdd [10013, format["%1 $%2",((GVAR(Gunveheast) Select _x) Select 4),((GVAR(Gunveheast) Select _x) Select 3)]];
                        } forEach (_boxarry Select 1);
                        _index = lbAdd [10012,"Leer"];    
                        _index = lbAdd [10013,"Leer"];
                        ctrlSetText [10039, "Magazin Gun"];
                        ctrlSetText [10040, "Magazin Gun"];
                        
                    };
            //Box5            
            if (_draht > 0) then 
            {    
            _index = lbAdd [10014, format ["Drahtkäfig $%1",GVAR(PreisDrahtkafig)]];
            _index = lbAdd [10014,"Leer"];
            ctrlSetText [10041, "Drahtkäfig"];    
            };
            //Box6            
            if (_tranung > 0) then 
            {
            _index = lbAdd [10015,format ["Tarnung $%1",GVAR(PreisTranung)]];
            _index = lbAdd [10015,"Leer"];    
            ctrlSetText [10042, "Tranung"];
            };        
        };
    
        //Box7            
        if (_datalink > 0) then 
        {
        _index = lbAdd [10016,format ["Datalink $%1",GVAR(PreisDatalink)]];    
        _index = lbAdd [10016,"Leer"];    
        ctrlSetText [10043, "Datalink"];
        };    
    };        
    
//Dynamische Kostenanzeige    
OPTWWbuygo=0;    
OPTWWlostgo=0;
private _boxindex =0;
private _wert=0;    
private _magazin="";
private _weapon="";
private _kontrolle =0;
private _buyrakmagazine=[];
private _buyrakweapon=[];
private _buygunmagazine=[];
private _buygunweapon=[];
private _buyDraht=false;
private _buyTarnung=false;
private _buyDatalink=false;
private _buykontrolle = [];
private _waffenauswahlarry1="";
private _waffenauswahlarry2="";

while {((OPTWWbuygo == 0) and (OPTWWlostgo == 0) and dialog)} do
    {
    sleep 0.001;
        _wert=0;    
        _buyrakmagazine=[];
        _buyrakweapon=[];
        _buygunmagazine=[];
        _buygunweapon=[];
        _buyDraht=false;
        _buyTarnung=false;
        _buyDatalink=false;
        _buykontrolle = [];
        
        if (_side == civilian) then 
            {
                if ((lbCurSel 10016) > -1) then 
                    {    
                        if (lbCurSel 10016 == 0) then 
                            {
                                _wert = _wert + GVAR(PreisDatalink);
                                _buyDatalink=true;
                            };
                    };    
            }
        else
            {         
            if (_veh isKindOf "Air") then 
                    {
                        if (_side == west) then 
                            {    
                            _waffenauswahlarry1 = GVAR(Gunheliwest);
                            _waffenauswahlarry2 = GVAR(Raktenheliwest);
                            }
                        else
                            {    
                            _waffenauswahlarry1 = GVAR(Gunhelieast);
                            _waffenauswahlarry2 = GVAR(Raktenhelieast);
                            };
                         if ((lbCurSel 10010) > -1) then 
                                 {    
                                if ((lbCurSel 10010) < (count (_boxarry Select 1))) then 
                                    {
                                    _boxindex = (_boxarry Select 1) Select lbCurSel 10010;
                                    _wert = _wert +((_waffenauswahlarry1 Select _boxindex) Select 3);
                                    _magazin = ((_waffenauswahlarry1 Select _boxindex) Select 0);
                                    _weapon = ((_waffenauswahlarry1 Select _boxindex) Select 1);
                            
                                    _buygunmagazine pushBack _magazin;
                                    if (!(_weapon in _buygunweapon)) then 
                                        {
                                        _buygunweapon pushBack _weapon;
                                        };
                                    };
                                };    
                            if ((lbCurSel 10011) > -1) then 
                                {    
                                if ((lbCurSel 10011) < (count (_boxarry Select 1))) then 
                                    {
                                    _boxindex = (_boxarry Select 1) Select lbCurSel 10011;
                                    _wert = _wert +((_waffenauswahlarry1 Select _boxindex) Select 3);
                                    _magazin = ((_waffenauswahlarry1 Select _boxindex) Select 0);
                                    _weapon = ((_waffenauswahlarry1 Select _boxindex) Select 1);
                            
                                    _buygunmagazine pushBack _magazin;
                                    if (!(_weapon in _buygunweapon)) then 
                                        {
                                        _buygunweapon pushBack _weapon;
                                        };
                                    };
                                };    
                            if ((lbCurSel 10012) > -1) then 
                                {    
                                if ((lbCurSel 10012) < (count (_boxarry Select 0))) then 
                                    {
                                    _boxindex = (_boxarry Select 0) Select lbCurSel 10012;
                                    _wert = _wert +((_waffenauswahlarry2 Select _boxindex) Select 3);
                                    _magazin = ((_waffenauswahlarry2 Select _boxindex) Select 0);
                                    _weapon = ((_waffenauswahlarry2 Select _boxindex) Select 1);
                                    _kontrolle = ((_waffenauswahlarry2 Select _boxindex) Select 5);
                            
                                    _buyrakmagazine pushBack _magazin;
                                    _buyrakweapon pushBack _weapon;
                                    _buykontrolle pushBack _kontrolle;                                    
                                    };
                                };    
                            if ((lbCurSel 10013) > -1) then 
                                {    
                                if ((lbCurSel 10013) < (count (_boxarry Select 0))) then 
                                    {
                                    _boxindex = (_boxarry Select 0) Select lbCurSel 10013;
                                    _wert = _wert +((_waffenauswahlarry2 Select _boxindex) Select 3);
                                    _magazin = ((_waffenauswahlarry2 Select _boxindex) Select 0);
                                    _weapon = ((_waffenauswahlarry2 Select _boxindex) Select 1);
                                    _kontrolle = ((_waffenauswahlarry2 Select _boxindex) Select 5);
                                                        
                                    _buyrakmagazine pushBack _magazin;
                                    _buyrakweapon pushBack _weapon;
                                    _buykontrolle pushBack _kontrolle;    
                                    };
                                };
                            if ((lbCurSel 10014) > -1) then 
                                {    
                                if ((lbCurSel 10014) < (count (_boxarry Select 0))) then 
                                    {
                                    _boxindex = (_boxarry Select 0) Select lbCurSel 10014;
                                    _wert = _wert +((_waffenauswahlarry2 Select _boxindex) Select 3);
                                    _magazin = ((_waffenauswahlarry2 Select _boxindex) Select 0);
                                    _weapon = ((_waffenauswahlarry2 Select _boxindex) Select 1);
                                    _kontrolle = ((_waffenauswahlarry2 Select _boxindex) Select 5);
                                                        
                                    _buyrakmagazine pushBack _magazin;
                                    _buyrakweapon pushBack _weapon;
                                    _buykontrolle pushBack _kontrolle;    
                                    };
                                };    
                            if ((lbCurSel 10015) > -1) then 
                                {    
                                if ((lbCurSel 10015) < (count (_boxarry Select 0))) then 
                                    {
                                    _boxindex = (_boxarry Select 0) Select lbCurSel 10015;
                                    _wert = _wert +((_waffenauswahlarry2 Select _boxindex) Select 3);
                                    _magazin = ((_waffenauswahlarry2 Select _boxindex) Select 0);
                                    _weapon = ((_waffenauswahlarry2 Select _boxindex) Select 1);
                                    _kontrolle = ((_waffenauswahlarry2 Select _boxindex) Select 5);
                                                                
                                    _buyrakmagazine pushBack _magazin;
                                    _buyrakweapon pushBack _weapon;
                                    _buykontrolle pushBack _kontrolle;    
                                    };
                                };
                            if ((lbCurSel 10016) > -1) then 
                                {    
                                if (lbCurSel 10016 == 0) then 
                                    {
                                    _wert = _wert + GVAR(PreisDatalink);
                                    _buyDatalink=true;
                                    };
                                };            
                    }
                 else
                    {
                        if (_side == west) then 
                            {    
                            _waffenauswahlarry1 = GVAR(Gunvehwest);                           
                            }
                        else
                            {    
                            _waffenauswahlarry1 = GVAR(Gunveheast);
                            };       
        
                            if ((lbCurSel 10010) > -1) then 
                                {    
                                if ((lbCurSel 10010) < (count (_boxarry Select 1))) then 
                                    {
                                    _boxindex = (_boxarry Select 1) Select lbCurSel 10010;
                                    _wert = _wert +((_waffenauswahlarry1 Select _boxindex) Select 3);
                                    _magazin = ((_waffenauswahlarry1 Select _boxindex) Select 0);
                                    _weapon = ((_waffenauswahlarry1 Select _boxindex) Select 1);
                            
                                    _buygunmagazine pushBack _magazin;
                                    if (!(_weapon in _buygunweapon)) then 
                                        {
                                        _buygunweapon pushBack _weapon;
                                        };
                                    };
                                };    
                            if ((lbCurSel 10011) > -1) then 
                                {    
                                if ((lbCurSel 10011) < (count (_boxarry Select 1))) then 
                                    {
                                    _boxindex = (_boxarry Select 1) Select lbCurSel 10011;
                                    _wert = _wert +((_waffenauswahlarry1 Select _boxindex) Select 3);
                                    _magazin = ((_waffenauswahlarry1 Select _boxindex) Select 0);
                                    _weapon = ((_waffenauswahlarry1 Select _boxindex) Select 1);
                            
                                    _buygunmagazine pushBack _magazin;
                                    if (!(_weapon in _buygunweapon)) then 
                                        {
                                        _buygunweapon pushBack _weapon;
                                        };
                                    };
                                };    
                            if ((lbCurSel 10012) > -1) then 
                                {    
                                if ((lbCurSel 10012) < (count (_boxarry Select 1))) then 
                                    {
                                    _boxindex = (_boxarry Select 1) Select lbCurSel 10012;
                                    _wert = _wert +((_waffenauswahlarry1 Select _boxindex) Select 3);
                                    _magazin = ((_waffenauswahlarry1 Select _boxindex) Select 0);
                                    _weapon = ((_waffenauswahlarry1 Select _boxindex) Select 1);
                            
                                    _buygunmagazine pushBack _magazin;
                                    if (!(_weapon in _buygunweapon)) then 
                                        {
                                        _buygunweapon pushBack _weapon;
                                        };
                                    };
                                };    
                            if ((lbCurSel 10013) > -1) then 
                                {    
                                if ((lbCurSel 10013) < (count (_boxarry Select 1))) then 
                                    {
                                    _boxindex = (_boxarry Select 1) Select lbCurSel 10013;
                                    _wert = _wert +((_waffenauswahlarry1 Select _boxindex) Select 3);
                                    _magazin = ((_waffenauswahlarry1 Select _boxindex) Select 0);
                                    _weapon = ((_waffenauswahlarry1 Select _boxindex) Select 1);
                            
                                    _buygunmagazine pushBack _magazin;
                                    if (!(_weapon in _buygunweapon)) then 
                                        {
                                        _buygunweapon pushBack _weapon;
                                        };
                                    };
                                };
                            if ((lbCurSel 10014) > -1) then 
                                {    
                                if ((lbCurSel 10014) == 0) then 
                                    {
                                    _wert = _wert + GVAR(PreisDrahtkafig);
                                    _buyDraht=true;
                                    };
                                };    
                            if ((lbCurSel 10015) > -1) then 
                                {    
                                if ((lbCurSel 10015) == 0) then 
                                    {
                                    _wert = _wert + GVAR(PreisTranung);
                                    _buyTarnung=true;
                                    };
                                };
                            if ((lbCurSel 10016) > -1) then 
                                {    
                                if (lbCurSel 10016 == 0) then 
                                    {
                                    _wert = _wert + GVAR(PreisDatalink);                            
                                    _buyDatalink=true;
                                    };
                                };            
                    };
             };        
                                    
ctrlSetText [10001, format["$:%1",(_bewaffnungpreis -_wert)]];    
};

(gunner _veh) action ["getout",_veh];
        
if (OPTWWbuygo == 1) then 
    {
    [_veh,_side,_weaponsveh,_Magazinveh,_pylon,_buyDatalink,_buygunmagazine,_buygunweapon,_bewaffnungpreis,_Fname,_buyrakmagazine,_buykontrolle] call FUNC(bewaffnen);  
    };    
    
if (OPTWWlostgo == 1) then 
    {
    if (_side == civilian) then 
        {    
        }
    else
        {
        [_veh,_weaponsveh,_Magazinveh,_pylon,_bewaffnungpreis,_Fname] call FUNC(entwaffnen);    
        }; 
    };
    