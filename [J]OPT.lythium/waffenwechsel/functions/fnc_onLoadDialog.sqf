#include "script_component.hpp"

private ["_pad","_veh","_fcDialog","_Fahrzeugbild","_Fahrzeugname","_Fbild","_Magazinveh","_weaponsveh","_Magazinfilter","_Magazinfilter2","_Magazinvehpylon","_Magazinvehpylonarry","_anzahlMagazinveh","_MuniKugel","_MuniRakete","_bild","_MuniBild1","_MuniBild2","_MuniBild3","_MuniBild4","_MuniBild5","_MuniBild6","_Fname","_Objket","_typveh","_boxarry","_anzahlboxarry","_side","_bewaffnungpreis","_Magazinveharry","_Magazinveharrynew","_draht","_tranung","_datalink","_pylon","_Boxnamen","_wert","_magazin","_weapon","_kontrolle","_buykontrolle","_buyrakmagazine","_buyrakweapon","_buygunmagazine","_buygunweapon","_buyDraht","_buyTarnung","_buyDatalink"];

disableSerialization;

_pad = nil;
_veh = 0;
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
_Objket = ["Air","Tank","wheeled_apc","car"];
    
_pad = (nearestObject [player, 'Land_HelipadCircle_F']);
_veh = (nearestObjects[_pad,_Objket,10]) select 0;

_Fname = getText (configFile >> "CfgVehicles" >> (typeof _veh) >> "displayName");
_FBild = getText (configFile >> "CfgVehicles" >> (typeof _veh) >> "icon");

_typveh="";
{
    if ((typeof _veh) == _x) then {_typveh = _x};

} forEach GVAR(vehclasswestWW);
    
{
    if ((typeof _veh) == _x) then {_typveh = _x};

} forEach GVAR(vehclasseastWW);

_boxarry=[];
_side=civilian;
_pylon=[];
_Boxnamen =[];

if (_typveh in (GVAR(vehclasswestWW)+GVAR(vehclasseastWW))) then 
    {
        switch (_typveh) do 
        {
            case "OPT_B_Heli_Light_01_armed_F_un": {_boxarry = GVAR(Pawnee);_side=west;_pylon=["pylonleft1","pylonright1"];};
            case "OPT_B_Heli_Attack_01_F_un": {_boxarry = GVAR(Blackfoot);_side=west;_pylon=["pylonleft1","pylonleft3","pylonright1","pylonright3"];};
            case "OPT_B_MRAP_01_hmg_F_un": {_boxarry = GVAR(HunterHMG);_side=west;_pylon=[];};
            case "OPT_B_MRAP_01_gmg_F_un": {_boxarry = GVAR(HunterGMG);_side=west;_pylon=[];};
            case "OPT_B_T_LSV_01_armed_F_un": {_boxarry = GVAR(ProwlerHMG);_side=west;_pylon=[];};
            case "OPT_B_T_LSV_01_AT_F_un": {_boxarry = GVAR(ProwlerAT);_side=west;_pylon=[];};
            case "OPT_B_APC_Tracked_01_rcws_F_un": {_boxarry = GVAR(Panther);_side=west;_pylon=[];};
            case "OPT_B_APC_Wheeled_01_cannon_F_un": {_boxarry = GVAR(Marshall);_side=west;_pylon=[];};
            case "OPT_B_APC_tracked_03_cannon_F_un": {_boxarry = GVAR(Mora);_side=west;_pylon=[];};
            case "OPT_B_APC_Tracked_01_AA_F_un": {_boxarry = GVAR(Cheetah);_side=west;_pylon=[];};
            case "OPT_B_MBT_01_TUSK_F_un": {_boxarry = GVAR(SlammerUp);_side=west;_pylon=[];};    
            
            case "OPT_O_Heli_Light_02_F_un": {_boxarry = GVAR(Orca);_side=east;_pylon=["pylonleft1","pylonright1"];};
            case "OPT_O_Heli_Light_03_F_un": {_boxarry = GVAR(hellcat);_side=east;_pylon=["pylonleft1","pylonright1"];};
            case "OPT_O_Heli_Attack_02_F_un": {_boxarry = GVAR(Kajman);_side=east;_pylon=["pylonleft1","pylonleft2","pylonright1","pylonright2"];};    
            case "OPT_O_MRAP_02_hmg_F_un": {_boxarry = GVAR(irifHMG);_side=east;_pylon=[];};
            case "OPT_O_MRAP_02_gmg_F_un": {_boxarry = GVAR(irifGMG);_side=east;_pylon=[];};
            case "OPT_O_T_LSV_02_armed_F_un": {_boxarry = GVAR(QuilinHMG);_side=east;_pylon=[];};
            case "OPT_O_T_LSV_02_AT_F_un": {_boxarry = GVAR(QuilinAT);_side=east;_pylon=[];};
            case "OPT_O_APC_Wheeled_02_rcws_F_un": {_boxarry = GVAR(Marid);_side=east;_pylon=[];};
            case "OPT_O_APC_Wheeled_03_cannon_F_un": {_boxarry = GVAR(Gorgon);_side=east;_pylon=[];};
            case "OPT_O_APC_Tracked_02_cannon_F_un": {_boxarry = GVAR(Kamysh);_side=east;_pylon=[];};
            case "OPT_O_APC_Tracked_02_AA_F_un": {_boxarry = GVAR(Tigris);_side=east;_pylon=[];};    
            case "OPT_O_MBT_02_cannon_F_un": {_boxarry = GVAR(Varsuk);_side=east;_pylon=[];};
            
            default {_boxarry = [];_side=civilian;};
        };
    }
else
    {
    _boxarry = [];_side=civilian;
    };

//Festellung Bewaffnung

_Magazinveh = magazines _veh;
_weaponsveh = weapons _veh;

_weaponsveh deleteAt (_weaponsveh find "OPT_CMFlareLauncher");
_weaponsveh deleteAt (_weaponsveh find "OPT_CMFlareLauncher_Triples");
_weaponsveh = _weaponsveh select {_x != ""};

_Magazinfilter =["96Rnd_CMFlare_Chaff_Magazine","120Rnd_CMFlare_Chaff_Magazine","240Rnd_CMFlare_Chaff_Magazine","60Rnd_CMFlare_Chaff_Magazine",
"192Rnd_CMFlare_Chaff_Magazine","168Rnd_CMFlare_Chaff_Magazine","300Rnd_CMFlare_Chaff_Magazine","OPT_12Rnd_CMFlare_Chaff_Magazine",
"OPT_20Rnd_CMFlare_Chaff_Magazine","OPT_30Rnd_CMFlare_Chaff_Magazine"];

{
_Magazinveh deleteAt (_Magazinveh find _X);                
} forEach _Magazinfilter;


_Magazinveh = _Magazinveh select {_x != ""};


_Magazinveharry= magazinesAmmo _veh;
_Magazinvehpylon =[];
_Magazinvehpylonarry = getPylonMagazines _veh;
_Magazinvehpylonarry = _Magazinvehpylonarry select {_x != ""};

if ((count _Magazinvehpylonarry) > 0) then 
    {
    if ((count _Magazinvehpylonarry) > 4) then {_Magazinvehpylonarry resize 4};
    for "_i" from 1 to count _Magazinvehpylonarry do
        {
        _Magazinvehpylon pushBack [(_Magazinvehpylonarry select _i-1),(_veh ammoOnPylon (_pylon select _i-1))];
        //systemchat format ["MP:%1 I:%2 MN:%3 AP:%4",_Magazinvehpylon,_i,(_Magazinvehpylonarry select _i-1),(_veh ammoOnPylon (_pylon select _i-1))];
        sleep 0.001;
        };    
    };    
    

//kontrolle Bewaffnung Auslesung

_Magazinfilter2 =[["96Rnd_CMFlare_Chaff_Magazine",96],["120Rnd_CMFlare_Chaff_Magazine",120],["240Rnd_CMFlare_Chaff_Magazine",240],["60Rnd_CMFlare_Chaff_Magazine",60],
["192Rnd_CMFlare_Chaff_Magazine",192],["168Rnd_CMFlare_Chaff_Magazine",168],["300Rnd_CMFlare_Chaff_Magazine",300],["OPT_12Rnd_CMFlare_Chaff_Magazine",12],
["OPT_20Rnd_CMFlare_Chaff_Magazine",20],["OPT_30Rnd_CMFlare_Chaff_Magazine",30]];

{
_Magazinveharry deleteAt (_Magazinveharry find _X);                
} forEach _Magazinfilter2;

{
_Magazinveharry deleteAt (_Magazinveharry find _X);                
} forEach _Magazinvehpylon;

_Magazinveharrynew=_Magazinveharry + _Magazinvehpylon;    

_anzahlMagazinveh = count _Magazinveharrynew;        
if (_anzahlMagazinveh > 0) then 
{
    _anzeige=[];
    _MuniKugel = "\A3\Weapons_F\Data\UI\m_200rnd_65x39_yellow_ca.paa";
    _MuniRakete = "\A3\Weapons_F_beta\Launchers\titan\Data\UI\gear_titan_missile_atl_CA.paa";

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

    //systemchat format ["M:%1 M1:%2 M3:%3",_Magazinveh,(magazines _veh),(getPylonMagazines _veh)];

    _Munitext1 = "";
    _Munitext2 = "";
    _Munitext3 = "";
    _Munitext4 = "";
    _Munitext5 = "";
    _Munitext6 = "";

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

//systemchat format ["V:%1 Mva:%2 MV:%3",typeof _veh,_Magazinveharrynew,_Magazinveh];

_bewaffnungpreis=0;
if (_side == civilian) then 
    {
    //Box7 füllen
    _index = lbAdd [10016,format ["Datalink $%1",GVAR(PreisDatalink)]];    
    _index = lbAdd [10016,"Leer"];    
    ctrlSetText [10043, "Datalink"];
    }
else
    {
    if (_side == west) then 
            {    
                for "_i" from 1 to count GVAR(Raktenheliwest) do
                {
                    {
                        if (((GVAR(Raktenheliwest) Select _i-1) Select 0) == (_x Select 0)) then 
                                {                            
                                _bewaffnungpreis = _bewaffnungpreis + (((GVAR(Raktenheliwest) Select _i-1) Select 2) * (_x Select 1));
                                };

                    } forEach _Magazinveharrynew;                
                sleep 0.001;
                };
                for "_i" from 1 to count GVAR(Gunheliwest) do
                {
                    {
                        if (((GVAR(Gunheliwest) Select _i-1) Select 0) == (_x Select 0)) then 
                                {                            
                                _bewaffnungpreis = _bewaffnungpreis + (((GVAR(Gunheliwest) Select _i-1) Select 2) * (_x Select 1));
                                };

                    } forEach _Magazinveharrynew;                
                sleep 0.001;
                };
                for "_i" from 1 to count GVAR(Gunvehwest) do
                {
                    {
                        if (((GVAR(Gunvehwest) Select _i-1) Select 0) == (_x Select 0)) then 
                                {                            
                                _bewaffnungpreis = _bewaffnungpreis + (((GVAR(Gunvehwest) Select _i-1) Select 2) * (_x Select 1));
                                };

                    } forEach _Magazinveharrynew;                
                sleep 0.001;
                };    
            }
        else
            {    
                for "_i" from 1 to count GVAR(Raktenhelieast) do
                {
                    {
                        if (((GVAR(Raktenhelieast) Select _i-1) Select 0) == (_x Select 0)) then 
                                {                            
                                _bewaffnungpreis = _bewaffnungpreis + (((GVAR(Raktenhelieast) Select _i-1) Select 2) * (_x Select 1));
                                };

                    } forEach _Magazinveharrynew;                
                sleep 0.001;
                };
                for "_i" from 1 to count GVAR(Gunhelieast) do
                {
                    {
                        if (((GVAR(Gunhelieast) Select _i-1) Select 0) == (_x Select 0)) then 
                                {                            
                                _bewaffnungpreis = _bewaffnungpreis + (((GVAR(Gunhelieast) Select _i-1) Select 2) * (_x Select 1));
                                };

                    } forEach _Magazinveharrynew;                
                sleep 0.001;
                };
                for "_i" from 1 to count GVAR(Gunveheast) do
                {
                    {
                        if (((GVAR(Gunveheast) Select _i-1) Select 0) == (_x Select 0)) then 
                                {                            
                                _bewaffnungpreis = _bewaffnungpreis + (((GVAR(Gunveheast) Select _i-1) Select 2) * (_x Select 1));
                                };

                    } forEach _Magazinveharrynew;                
                sleep 0.001;
                };
            };
    
        ctrlSetText [10001, format["$:%1",_bewaffnungpreis]];
            
        //Boxen füllen

        _Rakmag=((_boxarry Select 4) Select 0);
        _gunmag=((_boxarry Select 4) Select 1);
        _draht=((_boxarry Select 2) Select 0);
        _tranung=((_boxarry Select 2) Select 1);
        _datalink=((_boxarry Select 3) Select 0);

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
_boxindex =0;
_wert=0;    
_magazin="";
_weapon="";
_kontrolle =0;
_buyrakmagazine=[];
_buyrakweapon=[];
_buygunmagazine=[];
_buygunweapon=[];
_buyDraht=false;
_buyTarnung=false;
_buyDatalink=false;
_buykontrolle = [];

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
                            if ((lbCurSel 10010) > -1) then 
                                {    
                                if ((lbCurSel 10010) < (count (_boxarry Select 1))) then 
                                    {
                                    _boxindex = (_boxarry Select 1) Select lbCurSel 10010;
                                    _wert = _wert +((GVAR(Gunheliwest) Select _boxindex) Select 3);
                                    _magazin = ((GVAR(Gunheliwest) Select _boxindex) Select 0);
                                    _weapon = ((GVAR(Gunheliwest) Select _boxindex) Select 1);
                            
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
                                    _wert = _wert +((GVAR(Gunheliwest) Select _boxindex) Select 3);
                                    _magazin = ((GVAR(Gunheliwest) Select _boxindex) Select 0);
                                    _weapon = ((GVAR(Gunheliwest) Select _boxindex) Select 1);
                            
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
                                    _wert = _wert +((GVAR(Raktenheliwest) Select _boxindex) Select 3);
                                    _magazin = ((GVAR(Raktenheliwest) Select _boxindex) Select 0);
                                    _weapon = ((GVAR(Raktenheliwest) Select _boxindex) Select 1);
                                    _kontrolle = ((GVAR(Raktenheliwest) Select _boxindex) Select 5);
                            
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
                                    _wert = _wert +((GVAR(Raktenheliwest) Select _boxindex) Select 3);
                                    _magazin = ((GVAR(Raktenheliwest) Select _boxindex) Select 0);
                                    _weapon = ((GVAR(Raktenheliwest) Select _boxindex) Select 1);
                                    _kontrolle = ((GVAR(Raktenheliwest) Select _boxindex) Select 5);
                                                        
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
                                    _wert = _wert +((GVAR(Raktenheliwest) Select _boxindex) Select 3);
                                    _magazin = ((GVAR(Raktenheliwest) Select _boxindex) Select 0);
                                    _weapon = ((GVAR(Raktenheliwest) Select _boxindex) Select 1);
                                    _kontrolle = ((GVAR(Raktenheliwest) Select _boxindex) Select 5);
                                                        
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
                                    _wert = _wert +((GVAR(Raktenheliwest) Select _boxindex) Select 3);
                                    _magazin = ((GVAR(Raktenheliwest) Select _boxindex) Select 0);
                                    _weapon = ((GVAR(Raktenheliwest) Select _boxindex) Select 1);
                                    _kontrolle = ((GVAR(Raktenheliwest) Select _boxindex) Select 5);
                                                                
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
                            if ((lbCurSel 10010) > -1) then 
                                {    
                                if ((lbCurSel 10010) < (count (_boxarry Select 1))) then 
                                    {
                                    _boxindex = (_boxarry Select 1) Select lbCurSel 10010;
                                    _wert = _wert +((GVAR(Gunhelieast) Select _boxindex) Select 3);
                                    _magazin = ((GVAR(Gunhelieast) Select _boxindex) Select 0);
                                    _weapon = ((GVAR(Gunhelieast) Select _boxindex) Select 1);
                                                                
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
                                    _wert = _wert +((GVAR(Gunhelieast) Select _boxindex) Select 3);
                                    _magazin = ((GVAR(Gunhelieast) Select _boxindex) Select 0);
                                    _weapon = ((GVAR(Gunhelieast) Select _boxindex) Select 1);
                            
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
                                    _wert = _wert +((GVAR(Raktenhelieast) Select _boxindex) Select 3);
                                    _magazin = ((GVAR(Raktenhelieast) Select _boxindex) Select 0);
                                    _weapon = ((GVAR(Raktenhelieast) Select _boxindex) Select 1);
                                    _kontrolle = ((GVAR(Raktenhelieast) Select _boxindex) Select 5);
                                                                
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
                                    _wert = _wert +((GVAR(Raktenhelieast) Select _boxindex) Select 3);
                                    _magazin = ((GVAR(Raktenhelieast) Select _boxindex) Select 0);
                                    _weapon = ((GVAR(Raktenhelieast) Select _boxindex) Select 1);
                                    _kontrolle = ((GVAR(Raktenhelieast) Select _boxindex) Select 5);
                                    
                            
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
                                    _wert = _wert +((GVAR(Raktenhelieast) Select _boxindex) Select 3);
                                    _magazin = ((GVAR(Raktenhelieast) Select _boxindex) Select 0);
                                    _weapon = ((GVAR(Raktenhelieast) Select _boxindex) Select 1);
                                    _kontrolle = ((GVAR(Raktenhelieast) Select _boxindex) Select 5);
                                    
                            
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
                                    _wert = _wert +((GVAR(Raktenhelieast) Select _boxindex) Select 3);
                                    _magazin = ((GVAR(Raktenhelieast) Select _boxindex) Select 0);
                                    _weapon = ((GVAR(Raktenhelieast) Select _boxindex) Select 1);
                                    _kontrolle = ((GVAR(Raktenhelieast) Select _boxindex) Select 5);
                                    
                            
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
                            };    
                        }
                    else
                        {
                        if (_side == west) then 
                            {        
                            if ((lbCurSel 10010) > -1) then 
                                {    
                                if ((lbCurSel 10010) < (count (_boxarry Select 1))) then 
                                    {
                                    _boxindex = (_boxarry Select 1) Select lbCurSel 10010;
                                    _wert = _wert +((GVAR(Gunvehwest) Select _boxindex) Select 3);
                                    _magazin = ((GVAR(Gunvehwest) Select _boxindex) Select 0);
                                    _weapon = ((GVAR(Gunvehwest) Select _boxindex) Select 1);
                            
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
                                    _wert = _wert +((GVAR(Gunvehwest) Select _boxindex) Select 3);
                                    _magazin = ((GVAR(Gunvehwest) Select _boxindex) Select 0);
                                    _weapon = ((GVAR(Gunvehwest) Select _boxindex) Select 1);
                            
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
                                    _wert = _wert +((GVAR(Gunvehwest) Select _boxindex) Select 3);
                                    _magazin = ((GVAR(Gunvehwest) Select _boxindex) Select 0);
                                    _weapon = ((GVAR(Gunvehwest) Select _boxindex) Select 1);
                            
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
                                    _wert = _wert +((GVAR(Gunvehwest) Select _boxindex) Select 3);
                                    _magazin = ((GVAR(Gunvehwest) Select _boxindex) Select 0);
                                    _weapon = ((GVAR(Gunvehwest) Select _boxindex) Select 1);
                            
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
                            }
                        else    
                            {        
                            if ((lbCurSel 10010) > -1) then 
                                {    
                                if ((lbCurSel 10010) < (count (_boxarry Select 1))) then 
                                    {
                                    _boxindex = (_boxarry Select 1) Select lbCurSel 10010;
                                    _wert = _wert +((GVAR(Gunveheast) Select _boxindex) Select 3);
                                    _magazin = ((GVAR(Gunveheast) Select _boxindex) Select 0);
                                    _weapon = ((GVAR(Gunveheast) Select _boxindex) Select 1);
                            
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
                                    _wert = _wert +((GVAR(Gunveheast) Select _boxindex) Select 3);
                                    _magazin = ((GVAR(Gunveheast) Select _boxindex) Select 0);
                                    _weapon = ((GVAR(Gunveheast) Select _boxindex) Select 1);
                            
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
                                    _wert = _wert +((GVAR(Gunveheast) Select _boxindex) Select 3);
                                    _magazin = ((GVAR(Gunveheast) Select _boxindex) Select 0);
                                    _weapon = ((GVAR(Gunveheast) Select _boxindex) Select 1);
                            
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
                                    _wert = _wert +((GVAR(Gunveheast) Select _boxindex) Select 3);
                                    _magazin = ((GVAR(Gunveheast) Select _boxindex) Select 0);
                                    _weapon = ((GVAR(Gunveheast) Select _boxindex) Select 1);
                            
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
            };        
ctrlSetText [10001, format["$:%1",(_bewaffnungpreis -_wert)]];    
};
        
if (OPTWWbuygo == 1) then 
    {
    if (_side == civilian) then 
        {    
        if (_buyDatalink) then 
            {
            _veh setVehicleReportOwnPosition true;
            _veh setVehicleReportRemoteTargets true;
            _veh setVehicleReceiveRemoteTargets true;                    

            [PLAYER_NAME, PLAYER_SIDE, typeOf _veh, _wert, "-", "weapons"] call EFUNC(common,updateBudget);
            
            private _txt = format["%1 ausgerüstet für %2 €.", typeOf _veh, _wert];
            ["Ausrüsten", _txt, "green"] call EFUNC(gui,message);
                                
            };    
        closeDialog 0;
        }
    else
        {
        {_veh removeWeapon _x} forEach _weaponsveh;    
        {_veh removeMagazine _x} forEach _Magazinveh;    
        
        for "_i" from 1 to count _pylon do
            {
            _veh setPylonLoadOut [(_Pylon Select _i-1),""];     
            sleep 0.001;
            };    

        if (_veh isKindOf "Air") then 
            {    
                if ((count _buygunmagazine) > 0) then 
                    {    
                    if ((_veh isKindOf "OPT_B_Heli_Attack_01_F_un") or (_veh isKindOf "OPT_O_Heli_Attack_02_F_un")) then 
                            {
                            {_veh addMagazineTurret [_x,[0]]} forEach _buygunmagazine;
                            {_veh addWeaponTurret [_x,[0]]} forEach _buygunweapon;                             
                            }
                        else
                            {    
                            {_veh addMagazine _x} forEach _buygunmagazine;
                            {_veh addWeapon _x} forEach _buygunweapon;    
                            };
                    };    
                
                
                if ((count _buyrakmagazine) > 0) then 
                    {
                        for "_i" from 1 to count _buyrakmagazine do
                        {
                        if ((_veh isKindOf "OPT_B_Heli_Attack_01_F_un") or (_veh isKindOf "OPT_O_Heli_Attack_02_F_un")) then 
                            {
                            if ((_buykontrolle Select _i-1) == 0) then 
                                {                            
                                _veh setPylonLoadOut [(_Pylon Select _i-1),(_buyrakmagazine Select _i-1),true,[0]];                                 
                                }
                            else
                                {
                                _veh setPylonLoadOut [(_Pylon Select _i-1),(_buyrakmagazine Select _i-1)];     
                                };
                            }    
                        else
                            {    
                            _veh setPylonLoadOut [(_Pylon Select _i-1),(_buyrakmagazine Select _i-1)];     
                            };
                        sleep 0.001;
                        };    
                    };
            }
        else    
            {
                if ((count _buygunmagazine) > 0) then 
                    {                
                    {_veh addMagazine _x} forEach _buygunmagazine;
                    {_veh addWeapon _x} forEach _buygunweapon;
                    };
                if (_buyDraht) then 
                    {
                    _veh animateSource ["showSLATHull",1];
                    _veh animateSource ["showSLATTurret",1];
                    };
                if (_buyTarnung) then 
                    {
                    _veh animateSource ["showCamonetPlates1",1];
                    _veh animateSource ["showCamonetPlates2",1];
                    _veh animateSource ["showCamonetHull",1];
                    _veh animateSource ["showCamonetCannon",1];
                    _veh animateSource ["showCamonetTurret",1];
                    };    
            };
        if (_buyDatalink) then 
            {
            _veh setVehicleReportOwnPosition true;
            _veh setVehicleReportRemoteTargets true;
            _veh setVehicleReceiveRemoteTargets true;
            };    
        
        
        if ((_bewaffnungpreis - _wert) > 0) then 
            {                
                [PLAYER_NAME, PLAYER_SIDE, typeOf _veh, (_bewaffnungpreis - _wert), "+", "weapons"] call EFUNC(common,updateBudget);
                
                private _txt = format["%1 ausgerüstet, Gutschrift %2 €.", _Fname, (_bewaffnungpreis - _wert)];
                ["Ausrüsten", _txt, "green"] call EFUNC(gui,message);
            
                [[[name player,_wert,_txt] call FUNC(cbatext)]] remoteExecCall ["", playerSide, false];
            }
        else    
            {
                [PLAYER_NAME, PLAYER_SIDE, typeOf _veh, ((_bewaffnungpreis - _wert) * (-1)), "-", "weapons"] call EFUNC(common,updateBudget);
                
                private _txt = format["%1 ausgerüstet für %2 €.", _Fname, (_bewaffnungpreis - _wert)];
                ["Ausrüsten", _txt, "green"] call EFUNC(gui,message);
                            
                [[[name player,_wert,_txt] call FUNC(cbatext)]] remoteExecCall ["", playerSide, false];
            };    
        
        closeDialog 0;
        };
    };    
    
if (OPTWWlostgo == 1) then 
    {
    if (_side == civilian) then 
        {    
        }
    else
        {
            {_veh removeWeapon _x} forEach _weaponsveh;    
            {_veh removeMagazine _x} forEach _Magazinveh;

            for "_i" from 1 to count _pylon do
                {
                _veh setPylonLoadOut [(_Pylon Select _i-1),""];     
                sleep 0.001;
                };    
            
            [PLAYER_NAME, PLAYER_SIDE, typeOf _veh, _bewaffnungpreis, "+", "weapons"] call EFUNC(common,updateBudget);            
            
            private _txt = format["%1 entwaffnet für %2 €.", _Fname, _bewaffnungpreis];
            ["Entwaffnen", _txt, "green"] call EFUNC(gui,message);
        };
    closeDialog 0;    
    };
    