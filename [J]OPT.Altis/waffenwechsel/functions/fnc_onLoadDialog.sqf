/**
* Funktion Dialog Waffenwechsel
* 
* Author:
* [GNC]Lord-MDB
*
* Arguments:
* None
*
* Return Value:
* None
*
* Server only:
* no
*
* Public:
* no 
*
* Global:
* Yes
*
* Sideeffects:
* yes - Datenübergabe an Log, Budget und CBA Text
*
* Example:
* [] call EFUNC(waffenwechsel,onLoadDialog);
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

//Fahrzeugfeststellung
_veh = vehicle player;
if !(player isEqualTo assignedDriver vehicle player) exitWith {_veh;};

private _vehDisplayName = getText (configFile >> "CfgVehicles" >> (typeof _veh) >> "displayName");
private _vehDisplayIcon = getText (configFile >> "CfgVehicles" >> (typeof _veh) >> "icon");

private _vehType = typeOf _veh;

private _boxArry = [];
private _side = civilian;
private _pylon = [];
private _boxNames = [];
private _loadouts = [];

if (_vehType in (GVAR(vehclasswestWW) + GVAR(vehclasseastWW))) then 
{
    switch (_vehType) do 
	{
        // WEST
        case "OPT4_B_Heli_Light_01_armed_F": 
		{
            _boxArry = GVAR(Pawnee);
            _side = west;
            _pylon = ["pylonleft1", "pylonright1"];
			_loadouts = GVAR(Pawneeloadout);
        };
        case "OPT4_B_Heli_light_03_green_F": 
		{
            _boxArry = GVAR(hellcat1);
            _side = west;
            _pylon = ["pylonleft1", "pylonright1"];
			_loadouts = GVAR(hellcat1loadout);
        }; 
        case "OPT4_B_Heli_Attack_01_F": 
		{
            _boxArry = GVAR(Blackfoot);
            _side = west;
            _pylon = ["pylonleft1","pylonleft3","pylonright1","pylonright3"];
			_loadouts = GVAR(Blackfootloadout);
        };
        case "OPT4_B_MRAP_01_hmg_F": 
		{
            _boxArry = GVAR(HunterHMG);
            _side = west;
            _pylon = [];
			_loadouts = GVAR(HunterHMGloadout);
        };
        case "OPT4_B_MRAP_01_gmg_F": 
		{
            _boxArry = GVAR(HunterGMG);
            _side = west;
            _pylon = [];
			_loadouts = GVAR(HunterGMGloadout);
        };
        case "OPT4_B_MRAP_03_gmg_F": 
		{
            _boxArry = GVAR(StriderGMG);
            _side = west;
            _pylon = [];
			_loadouts = GVAR(StriderGMGloadout);
        };
        case "OPT_B_T_LSV_01_armed_F": 
		{
            _boxArry = GVAR(ProwlerHMG);
            _side = west;
            _pylon = [];
			_loadouts = GVAR(ProwlerHMGloadout);
        };
        case "OPT4_B_LSV_01_AT_F": 
		{
            _boxArry = GVAR(ProwlerAT);
            _side = west;
            _pylon = [];
			_loadouts = GVAR(ProwlerATloadout);
        };
        case "OPT4_B_APC_Tracked_01_rcws_F": 
		{
            _boxArry = GVAR(Panther);
            _side = west;
            _pylon = [];
			_loadouts = GVAR(Pantherloadout);
        };
        case "OPT4_B_APC_Wheeled_01_cannon_F": 
		{
            _boxArry = GVAR(Marshall);
            _side = west;
            _pylon = [];
			_loadouts = GVAR(Marshallloadout);
        };
        case "OPT4_B_APC_tracked_03_cannon_F": 
		{
            _boxArry = GVAR(Mora);
            _side = west;
            _pylon = [];
			_loadouts = GVAR(Moraloadout);
        };
        case "OPT4_B_APC_Tracked_01_AA_F": 
		{
            _boxArry = GVAR(Cheetah);
            _side = west;
            _pylon = [];
			_loadouts = GVAR(Cheetahloadout);
        };
        case "OPT4_B_MBT_01_TUSK_F": 
		{
            _boxArry = GVAR(SlammerUp);
            _side = west;
            _pylon = [];
			_loadouts = GVAR(SlammerUploadout);
        };    
        case "OPT4_B_MBT_01_arty_F": 
		{
            _boxArry = GVAR(Scorcher);
            _side = west;
            _pylon = [];
			_loadouts = GVAR(Scorcherloadout);
        }; 
        
        // EAST
        case "OPT4_O_Heli_Light_02_F": 
		{
            _boxArry = GVAR(Orca);
            _side = east;
            _pylon = ["pylonleft1", "pylonright1"];
			_loadouts = GVAR(Orcaloadout);
        };
        case "OPT4_O_Heli_Attack_02_F": 
		{
            _boxArry = GVAR(Kajman);
            _side = east;
            _pylon = ["pylonleft1","pylonleft2","pylonright1","pylonright2"];
			_loadouts = GVAR(Kajmanloadout);
        };  
        case "OPT4_O_Heli_light_03_green_F": 
		{
            _boxArry = GVAR(hellcat);
            _side = east;
            _pylon = ["pylonleft1","pylonright1"];
			_loadouts = GVAR(hellcatloadout);
        }; 			
        case "OPT4_O_MRAP_02_hmg_F": 
		{
            _boxArry = GVAR(irifHMG);
            _side = east;
            _pylon = [];
			_loadouts = GVAR(irifHMGloadout);
        };
        case "OPT4_O_MRAP_02_gmg_F": 
		{
            _boxArry = GVAR(irifGMG);
            _side = east;
            _pylon = [];
			_loadouts = GVAR(irifGMGloadout);
        };
        case "OPT_O_T_LSV_02_armed_F": 
		{
            _boxArry = GVAR(QuilinHMG);
            _side = east;
            _pylon = [];
			_loadouts = GVAR(QuilinHMGloadout);
        };
        case "OPT4_O_LSV_02_AT_F": 
		{
            _boxArry = GVAR(QuilinAT);
            _side = east;
            _pylon = [];
			_loadouts = GVAR(QuilinATloadout);
        };
        case "OPT4_O_APC_Wheeled_02_rcws_F": 
		{
            _boxArry = GVAR(Marid);
            _side = east;
            _pylon = [];
			_loadouts = GVAR(Maridloadout);
        };
        case "OPT4_O_APC_Wheeled_03_cannon_F": 
		{
            _boxArry = GVAR(Gorgon);
            _side = east;
            _pylon = [];
			_loadouts = GVAR(Gorgonloadout);
        };
        case "OPT4_O_APC_Tracked_02_cannon_F": 
		{
            _boxArry = GVAR(Kamysh);
            _side = east;
            _pylon = [];
			_loadouts = GVAR(Kamyshloadout);
        };
        case "OPT4_O_APC_Tracked_02_AA_F": 
		{
            _boxArry = GVAR(Tigris);
            _side = east;
            _pylon = [];
			_loadouts = GVAR(Tigrisloadout);
        };    
        case "OPT4_O_MBT_02_cannon_F": 
		{
            _boxArry = GVAR(Varsuk);
            _side = east;
            _pylon = [];
			_loadouts = GVAR(Varsukloadout);
        };
        case "OPT4_O_MBT_02_arty_F": 
		{
            _boxArry = GVAR(Sochor);
            _side = east;
            _pylon = [];
			_loadouts = GVAR(Sochorloadout);
        }; 
        case "OPT4_O_T_MBT_02_arty_ghex_F": 
		{
            _boxArry = GVAR(Sochor);
            _side = east;
            _pylon = [];
			_loadouts = GVAR(Sochorloadout);
        }; 
        
        default 
		{
            _boxArry = [];
            _side = civilian;
			_pylon = [];
			_loadouts = [];
        };
    };
};
	
//Schütze aussteigen
(gunner _veh) action ["getout", _veh];
	
//auslesen und filtern
private _waffenMagazinArry  = [];
private _weaponsVeh =[];
private _magazineVeh=[];

_waffenMagazinArry = [_veh] call FUNC(waffenMagazinFilter);	

_weaponsVeh =_waffenMagazinArry select 0;
_magazineVeh = _waffenMagazinArry select 1;
	
//Festellung Bewaffnung
_magazineVehArryNew = [_veh] call FUNC(auslesenMagazine);
       
// Darstellung Magazine
private _magazineVehCount = count _magazineVehArryNew; 

if (_magazineVehCount > 0) then 
{
   private _anzeige = [];
   private _MuniKugel = "\A3\Weapons_F\Data\UI\m_200rnd_65x39_yellow_ca.paa";
   private _MuniRakete = "\A3\Weapons_F_beta\Launchers\titan\Data\UI\gear_titan_missile_atl_CA.paa";

    if (_veh isKindOf "Air") then 
	{
        {
            if (getNumber (configFile >> "cfgMagazines" >> (_x select 0) >> "count") > 30) then 
			{
                _anzeige pushBack _MuniKugel;

            } 
			else 
			{
                _anzeige pushBack _MuniRakete;

            };

        } forEach _magazineVehArryNew;

    } 
	else 
	{
        for "_i" from 1 to (count _magazineVeh) do 
		{
         _anzeige pushBack _MuniKugel;  
         sleep 0.001;
        };  
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

    for "_i" from 1 to _magazineVehCount do 
	{
        //Bild
        call compile format["_MuniBild%1 = _anzeige select (_i - 1);", _i];
        call compile format["ctrlSetText [(10002 + _i), _MuniBild%1];", _i];

        ctrlShow [(10002 + _i), true ];

        //Text    
        call compile format["_Munitext%1 = getText (configFile >> 'cfgMagazines' >> ((_magazineVehArryNew select (_i - 1)) select 0) >> 'displayName')", _i];
        call compile format["ctrlSetText [(10030 + _i), _Munitext%1];", _i];

        ctrlShow [(10030 + _i), true ];
        
        sleep 0.001;
    };        
};
          
ctrlSetText [10000, _vehDisplayName];
ctrlSetText [10002, format["%1", _vehDisplayIcon]];

//Preis vorhandene Bewaffnung
private _bewaffnungpreis = 0;

if (_side isEqualTo civilian) then 
{
    //Box7 füllen
    private _index = lbAdd [10016, format ["Datalink $%1", GVAR(preisDatalink)]];    
    _index = lbAdd [10016, "Leer"];    

    ctrlSetText [10043, "Datalink"];

} 
else 
{

    _bewaffnungpreis = [_side, _magazineVehArryNew] call FUNC(geldVorhandeneBewaffnung);
    
    //Boxen füllen
    private _Rakmag  = _boxArry select 4 select 0;
    private _gunmag = _boxArry select 4 select 1;
    private _draht = _boxArry select 2 select 0;
    private _tarnung = _boxArry select 2 select 1;
    private _datalink = _boxArry select 3 select 0;

    if (_veh isKindOf "Air") then 
	{
        //Box1+2
        private _heli = [];
        if (_side isEqualTo west) then 
		{    
            _heli = GVAR(Gunheliwest);         

        } 
		else 
		{
          _heli = GVAR(Gunhelieast);

        };

        {
            _index = lbAdd 
			[
                10010, 
                format["%1 $%2", _heli select _x select 4, _heli select _x select 3]     
            ];

            _index = lbAdd 
			[
                10011, 
                format["%1 $%2", _heli select _x select 4, _heli select _x select 3]
            ];

        } forEach (_boxArry select 1);     

        _index = lbAdd [10010, "Leer"];    
        _index = lbAdd [10011, "Leer"];    

        ctrlSetText [10037, "Magazin Gun"];
        ctrlSetText [10038, "Magazin Gun"];
        
        //Box3+4
        _heli = [];
        if (_side isEqualTo west) then 
		{    
            _heli = GVAR(Raktenheliwest);
               
        } 
		else 
		{
            _heli = GVAR(Raktenhelieast);

        };    

        {
            _index = lbAdd 
			[
                10012,
                format["%1 $%2", _heli select _x select 4, _heli select _x select 3]
            ];

            _index = lbAdd 
			[
                10013, 
                format["%1 $%2", _heli select _x select 4, _heli select _x select 3]
            ];

        } forEach (_boxArry select 0);

        _index = lbAdd [10012,"Leer"];    
        _index = lbAdd [10013,"Leer"];

        ctrlSetText [10039, "Magazin Raketen"];
        ctrlSetText [10040, "Magazin Raketen"];
                    
        //Box5+6
        if (_Rakmag > 2) then  
		{
            private _heli = [];
            if (_side == west) then 
			{    
                _heli = GVAR(Raktenheliwest);

            } 
			else 
			{
                _heli = GVAR(Raktenhelieast);
               
            };

            {
                _index = lbAdd 
				[
                    10014, 
                    format["%1 $%2", _heli select _x select 4, _heli select _x select 3]
                ];

                _index = lbAdd 
				[
                    10015, 
                    format["%1 $%2", _heli select _x select 4, _heli select _x select 3]
                ];

            } forEach (_boxArry select 0);

            _index = lbAdd [10014,"Leer"];    
            _index = lbAdd [10015,"Leer"];

            ctrlSetText [10041, "Magazin Raketen"];
            ctrlSetText [10042, "Magazin Raketen"];

        };    
    } else {
        //Box1+2
        private _vehSelect = [];
        if (_side isEqualTo west) then 
		{    
            _vehSelect = GVAR(Gunvehwest);

        } 
		else 
		{
            _vehSelect = GVAR(Gunveheast);
                    
        };

        {
            _index = lbAdd 
			[
                10010, 
                format["%1 $%2", _vehSelect select _x select 4,_vehSelect select _x select 3]
            ];

            _index = lbAdd 
			[
                10011, 
                format["%1 $%2", _vehSelect select _x select 4, _vehSelect select _x select 3]
            ];

        } forEach (_boxArry select 1);
        

        _index = lbAdd [10010,"Leer"];    
        _index = lbAdd [10011,"Leer"];

        ctrlSetText [10037, "Magazin Gun"];
        ctrlSetText [10038, "Magazin Gun"];

        //Box3+4
        _vehSelect = []; 
        if (_side == west) then 
		{    
            _vehSelect = GVAR(Gunvehwest);

        } 
		else 
		{
            _vehSelect = GVAR(Gunveheast);

        };

        {
            _index = lbAdd 
			[
                10012, 
                format["%1 $%2", _vehSelect select _x select 4, _vehSelect select _x select 3]
            ];

            _index = lbAdd 
			[
                10013, format["%1 $%2", _vehSelect select _x select 4, _vehSelect select _x select 3]
            ];

        } forEach (_boxArry select 1);

        _index = lbAdd [10012,"Leer"];    
        _index = lbAdd [10013,"Leer"];

        ctrlSetText [10039, "Magazin Gun"];
        ctrlSetText [10040, "Magazin Gun"];


        //Box5            
        if (_draht > 0) then 
		{    
            _index = lbAdd 
			[
                10014, 
                format ["Drahtkäfig $%1", GVAR(preisDrahtkafig)]
            ];

            _index = lbAdd [10014,"Leer"];

            ctrlSetText [10041, "Drahtkäfig"];    
        };

        //Box6            
        if (_tarnung > 0) then 
		{
            _index = lbAdd 
			[
                10015,
				format ["Tarnung $%1", GVAR(preisTarnung)]
            ];

            _index = lbAdd [10015,"Leer"];    

            ctrlSetText [10042, "Tranung"];
        };        
    };
    
    //Box7            
    if (_datalink > 0) then  
	{
        _index = lbAdd 
		[
            10016,
            format ["Datalink $%1", GVAR(preisDatalink)]
        ];  

        _index = lbAdd [10016,"Leer"]; 
           
        ctrlSetText [10043, "Datalink"];
    };
	
    ctrlSetText [10001, format["$:%1", _bewaffnungpreis]];	
};     

// Abfrage Laden Loadouts

if (_vehType in (GVAR(vehclasswestWW) + GVAR(vehclasseastWW))) then 
{
	if (GVAR(WWloadout)) then  
	{ 
		if (_veh isKindOf "Air") then 
		{
			//Gun
			lbSetCurSel [10010, (_loadouts select 1) select 0]; 
			//Raketten
			lbSetCurSel [10012, (_loadouts select 0) select 0]; 
			lbSetCurSel [10013, (_loadouts select 0) select 1]; 
			
			if (count (_loadouts select 0) > 2) then 
			{
				lbSetCurSel [10014, (_loadouts select 0) select 2]; 
				lbSetCurSel [10015, (_loadouts select 0) select 3]; 
			};
			//Datalink	
			lbSetCurSel [10016, (_loadouts select 3) select 0];	
			
		}
		else
		{
			//Gun
			for "_i" from 0 to (count (_loadouts select 1)) do 
			{
				lbSetCurSel [10010+_i, (_loadouts select 1) select _i]; 
				sleep 0.001;
			};
			
			//Datalink	
			lbSetCurSel [10016, (_loadouts select 3) select 0];	
			
		};
	};
};  

//Dynamische Kostenanzeige    
OPTWWbuygo = 0;    
OPTWWlostgo = 0;
private _boxindex = 0;
private _wert = 0;    
private _magazin = "";
private _weapon = "";
private _kontrolle = 0;
private _buyrakmagazine = [];
private _buyrakweapon = [];
private _buygunmagazine = [];
private _buygunweapon = [];
private _buyDraht = false;
private _buyTarnung = false;
private _buyDatalink = false;
private _buykontrolle = [];
private _waffenauswahlarry1 = "";
private _waffenauswahlarry2 = "";

while {((OPTWWbuygo == 0) and (OPTWWlostgo == 0) and dialog)} do 
{
    sleep 0.001;

    _wert = 0;    
    _buyrakmagazine = [];
    _buyrakweapon = [];
    _buygunmagazine = [];
    _buygunweapon = [];
    _buyDraht = false;
    _buyTarnung = false;
    _buyDatalink = false;
    _buykontrolle = [];
        
    if (_side isEqualTo civilian) then 
	{
        if ((lbCurSel 10016) > -1) then 
		{    
            if (lbCurSel 10016 == 0) then 
			{
                _wert = _wert + GVAR(preisDatalink);
                _buyDatalink = true;
            };

        };    

    } 
	else 
	{         
        if (_veh isKindOf "Air") then 
		{
            if (_side isEqualTo west) then 
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
                    if ((lbCurSel 10010) < (count (_boxArry select 1))) then 
					{
                        _boxindex = (_boxArry select 1) select lbCurSel 10010;
                        _wert = _wert +((_waffenauswahlarry1 select _boxindex) select 3);
                        _magazin = ((_waffenauswahlarry1 select _boxindex) select 0);
                        _weapon = ((_waffenauswahlarry1 select _boxindex) select 1);
                
                        _buygunmagazine pushBack _magazin;

                        if (!(_weapon in _buygunweapon)) then 
						{
                            _buygunweapon pushBack _weapon;
                        };

                    };

                };    

                if ((lbCurSel 10011) > -1) then 
				{    
                    if ((lbCurSel 10011) < (count (_boxArry select 1))) then 
					{
                        _boxindex = (_boxArry select 1) select lbCurSel 10011;
                        _wert = _wert + ((_waffenauswahlarry1 select _boxindex) select 3);
                        _magazin = ((_waffenauswahlarry1 select _boxindex) select 0);
                        _weapon = ((_waffenauswahlarry1 select _boxindex) select 1);
                
                        _buygunmagazine pushBack _magazin;

                        if (!(_weapon in _buygunweapon)) then 
						{
                            _buygunweapon pushBack _weapon;
                        };

                    };

                };    

                if ((lbCurSel 10012) > -1) then 
				{    
                    if ((lbCurSel 10012) < (count (_boxArry select 0))) then 
					{
                        _boxindex = (_boxArry select 0) select lbCurSel 10012;
                        _wert = _wert + ((_waffenauswahlarry2 select _boxindex) select 3);
                        _magazin = ((_waffenauswahlarry2 select _boxindex) select 0);
                        _weapon = ((_waffenauswahlarry2 select _boxindex) select 1);
                        _kontrolle = ((_waffenauswahlarry2 select _boxindex) select 5);
                
                        _buyrakmagazine pushBack _magazin;
                        _buyrakweapon pushBack _weapon;
                        _buykontrolle pushBack _kontrolle;                                    
                    };

                };    

                if ((lbCurSel 10013) > -1) then 
				{    
                    if ((lbCurSel 10013) < (count (_boxArry select 0))) then 
					{
                        _boxindex = (_boxArry select 0) select lbCurSel 10013;
                        _wert = _wert + ((_waffenauswahlarry2 select _boxindex) select 3);
                        _magazin = ((_waffenauswahlarry2 select _boxindex) select 0);
                        _weapon = ((_waffenauswahlarry2 select _boxindex) select 1);
                        _kontrolle = ((_waffenauswahlarry2 select _boxindex) select 5);
                                            
                        _buyrakmagazine pushBack _magazin;
                        _buyrakweapon pushBack _weapon;
                        _buykontrolle pushBack _kontrolle;    
                    };

                };

                if ((lbCurSel 10014) > -1) then 
				{    
                    if ((lbCurSel 10014) < (count (_boxArry select 0))) then 
					{
                        _boxindex = (_boxArry select 0) select lbCurSel 10014;
                        _wert = _wert + ((_waffenauswahlarry2 select _boxindex) select 3);
                        _magazin = ((_waffenauswahlarry2 select _boxindex) select 0);
                        _weapon = ((_waffenauswahlarry2 select _boxindex) select 1);
                        _kontrolle = ((_waffenauswahlarry2 select _boxindex) select 5);
                                            
                        _buyrakmagazine pushBack _magazin;
                        _buyrakweapon pushBack _weapon;
                        _buykontrolle pushBack _kontrolle;    
                    };
                    
                };    

                if ((lbCurSel 10015) > -1) then 
				{
                    if ((lbCurSel 10015) < (count (_boxArry select 0))) then 
					{
                        _boxindex = (_boxArry select 0) select lbCurSel 10015;
                        _wert = _wert + ((_waffenauswahlarry2 select _boxindex) select 3);
                        _magazin = ((_waffenauswahlarry2 select _boxindex) select 0);
                        _weapon = ((_waffenauswahlarry2 select _boxindex) select 1);
                        _kontrolle = ((_waffenauswahlarry2 select _boxindex) select 5);
                                                    
                        _buyrakmagazine pushBack _magazin;
                        _buyrakweapon pushBack _weapon;
                        _buykontrolle pushBack _kontrolle;    

                    };

                };

                if ((lbCurSel 10016) > -1) then  
				{    
                    if (lbCurSel 10016 == 0) then 
					{
                        _wert = _wert + GVAR(preisDatalink);
                        _buyDatalink = true;
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
                if ((lbCurSel 10010) < (count (_boxArry select 1))) then 
				{
                    _boxindex = (_boxArry select 1) select lbCurSel 10010;
                    _wert = _wert + ((_waffenauswahlarry1 select _boxindex) select 3);
                    _magazin = ((_waffenauswahlarry1 select _boxindex) select 0);
                    _weapon = ((_waffenauswahlarry1 select _boxindex) select 1);
            
                    _buygunmagazine pushBack _magazin;

                    if (!(_weapon in _buygunweapon)) then 
					{
                        _buygunweapon pushBack _weapon;
                    };

                };

            };    

            if ((lbCurSel 10011) > -1) then 
			{    
                if ((lbCurSel 10011) < (count (_boxArry select 1))) then 
				{
                    _boxindex = (_boxArry select 1) select lbCurSel 10011;
                    _wert = _wert + ((_waffenauswahlarry1 select _boxindex) select 3);
                    _magazin = ((_waffenauswahlarry1 select _boxindex) select 0);
                    _weapon = ((_waffenauswahlarry1 select _boxindex) select 1);
            
                    _buygunmagazine pushBack _magazin;

                    if (!(_weapon in _buygunweapon)) then 
					{
                        _buygunweapon pushBack _weapon;
                    };

                };

            };    

            if ((lbCurSel 10012) > -1) then 
			{    
                if ((lbCurSel 10012) < (count (_boxArry select 1))) then 
				{
                    _boxindex = (_boxArry select 1)select lbCurSel 10012;
                    _wert = _wert + ((_waffenauswahlarry1 select _boxindex) select 3);
                    _magazin = ((_waffenauswahlarry1 select _boxindex) select 0);
                    _weapon = ((_waffenauswahlarry1 select _boxindex) select 1);
            
                    _buygunmagazine pushBack _magazin;

                    if (!(_weapon in _buygunweapon)) then 
					{
                        _buygunweapon pushBack _weapon;
                    };

                };

            };    

            if ((lbCurSel 10013) > -1) then 
			{    
                if ((lbCurSel 10013) < (count (_boxArry select 1))) then 
				{
                    _boxindex = (_boxArry select 1)select lbCurSel 10013;
                    _wert = _wert + ((_waffenauswahlarry1 select _boxindex) select 3);
                    _magazin = ((_waffenauswahlarry1 select _boxindex) select 0);
                    _weapon = ((_waffenauswahlarry1 select _boxindex) select 1);
            
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
                    _wert = _wert + GVAR(preisDrahtkafig);
                    _buyDraht = true;
                };

            };    

            if ((lbCurSel 10015) > -1) then 
			{    
                if ((lbCurSel 10015) == 0) then 
				{
                    _wert = _wert + GVAR(preisTarnung);
                    _buyTarnung = true;
                };

            };

            if ((lbCurSel 10016) > -1) then 
			{    
                if (lbCurSel 10016 == 0) then 
				{
                    _wert = _wert + GVAR(preisDatalink);                            
                    _buyDatalink = true;
                };

            };            
        };
    };        
                                    
    ctrlSetText [10001, format["$:%1", (_bewaffnungpreis -_wert)]];    
};

(gunner _veh) action ["getout", _veh];
        
if (OPTWWbuygo == 1) then 
{
    [
        _veh,
        _side,
        _weaponsVeh,
        _magazineVeh,
        _pylon,
        _buyDatalink,
		_buyDraht,
		_buyTarnung,
        _buygunmagazine,
        _buygunweapon,
        _bewaffnungpreis,
        _vehDisplayName,
        _buyrakmagazine,
        _buykontrolle,
        _wert		
    ] 
	call FUNC(bewaffnen);  
};    
    
if (OPTWWlostgo == 1) then 
{
    if (_side != civilian) then 
	{
        [
            _veh,
            _weaponsVeh,
            _magazineVeh,
            _pylon,
            _bewaffnungpreis,
            _vehDisplayName
        ] 
		call FUNC(entwaffnen);    
    }; 
};
    