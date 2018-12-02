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

//Fahrzeugfeststellung
private _objekt = ["Air", "Tank", "wheeled_apc", "car"];

// TODO: Fehlerabfrage wenn kein Fahrzeug gefunden!
_pad = (nearestObject [player, 'Land_HelipadCircle_F']);
_veh = (nearestObjects [_pad, _objekt, 10]) select 0;

private _vehDisplayName = getText (configFile >> "CfgVehicles" >> (typeof _veh) >> "displayName");
private _vehDisplayIcon = getText (configFile >> "CfgVehicles" >> (typeof _veh) >> "icon");

private _vehType = typeOf _veh;

private _boxArry = [];
private _side = civilian;
private _pylon = [];
private _boxNames = [];

if (_vehType in (GVAR(vehclasswestWW) + GVAR(vehclasseastWW))) then {
    switch (_vehType) do {
        // WEST
        case "OPT4_B_Heli_Light_01_armed_F": {
            _boxArry = GVAR(Pawnee);
            _side = west;
            _pylon = ["pylonleft1", "pylonright1"];
        };
        case "OPT4_B_Heli_light_03_green_F": {
            _boxArry = GVAR(hellcat1);
            _side = west;
            _pylon = ["pylonleft1", "pylonright1"];
        }; //kallek
        case "OPT4_B_Heli_Attack_01_F": {
            _boxArry = GVAR(Blackfoot);
            _side = west;
            _pylon = ["pylonleft1","pylonleft3","pylonright1","pylonright3"];
        };
        case "OPT4_B_MRAP_01_hmg_F": {
            _boxArry = GVAR(HunterHMG);
            _side = west;
            _pylon = [];
        };
        case "OPT4_B_MRAP_01_gmg_F": {
            _boxArry = GVAR(HunterGMG);
            _side = west;
            _pylon = [];
        };
        case "OPT4_B_MRAP_03_gmg_F": {
            _boxArry = GVAR(StriderGMG);
            _side = west;
            _pylon = [];
        };
        case "OPT_B_T_LSV_01_armed_F": {
            _boxArry = GVAR(ProwlerHMG);
            _side = west;
            _pylon = [];
        };
        case "OPT4_B_LSV_01_AT_F": {
            _boxArry = GVAR(ProwlerAT);
            _side = west;
            _pylon = [];
        };
        case "OPT4_B_APC_Tracked_01_rcws_F": {
            _boxArry = GVAR(Panther);
            _side = west;
            _pylon = [];
        };
        case "OPT4_B_APC_Wheeled_01_cannon_F": {
            _boxArry = GVAR(Marshall);
            _side = west;
            _pylon = [];
        };
        case "OPT4_B_APC_tracked_03_cannon_F": {
            _boxArry = GVAR(Mora);
            _side = west;
            _pylon = [];
        };
        case "OPT4_B_APC_Tracked_01_AA_F": {
            _boxArry = GVAR(Cheetah);
            _side = west;
            _pylon = [];
        };
        case "OPT4_B_MBT_01_TUSK_F": {
            _boxArry = GVAR(SlammerUp);
            _side = west;
            _pylon = [];
        };    
        case "OPT4_B_MBT_01_arty_F": {
            _boxArry = GVAR(Scorcher);
            _side = west;
            _pylon = [];
        }; 
        
        // EAST
        case "OPT4_O_Heli_Light_02_F": {
            _boxArry = GVAR(Orca);
            _side = east;
            _pylon = ["pylonleft1", "pylonright1"];
        };
        case "OPT4_O_Heli_Attack_02_F": {
            _boxArry = GVAR(Kajman);
            _side = east;
            _pylon = ["pylonleft1","pylonleft2","pylonright1","pylonright2"];
        };  
        case "OPT4_O_Heli_light_03_green_F": {
            _boxArry = GVAR(hellcat);
            _side = east;
            _pylon = ["pylonleft1","pylonright1"];
        }; 			
        case "OPT4_O_MRAP_02_hmg_F": {
            _boxArry = GVAR(irifHMG);
            _side = east;
            _pylon = [];
        };
        case "OPT4_O_MRAP_02_gmg_F": {
            _boxArry = GVAR(irifGMG);
            _side = east;
            _pylon = [];
        };
        case "OPT_O_T_LSV_02_armed_F": {
            _boxArry = GVAR(QuilinHMG);
            _side = east;
            _pylon = [];
        };
        case "OPT4_O_LSV_02_AT_F": {
            _boxArry = GVAR(QuilinAT);
            _side = east;
            _pylon = [];
        };
        case "OPT4_O_APC_Wheeled_02_rcws_F": {
            _boxArry = GVAR(Marid);
            _side = east;
            _pylon = [];
        };
        case "OPT4_O_APC_Wheeled_03_cannon_F": {
            _boxArry = GVAR(Gorgon);
            _side = east;
            _pylon = [];
        };
        case "OPT4_O_APC_Tracked_02_cannon_F": {
            _boxArry = GVAR(Kamysh);
            _side = east;
            _pylon = [];
        };
        case "OPT4_O_APC_Tracked_02_AA_F": {
            _boxArry = GVAR(Tigris);
            _side = east;
            _pylon = [];
        };    
        case "OPT4_O_MBT_02_cannon_F": {
            _boxArry = GVAR(Varsuk);
            _side = east;
            _pylon = [];
        };
        case "OPT4_O_MBT_02_arty_F": {
            _boxArry = GVAR(Sochor);
            _side = east;
            _pylon = [];
        }; 
        case "OPT4_O_T_MBT_02_arty_ghex_F": {
            _boxArry = GVAR(Sochor);
            _side = east;
            _pylon = [];
        }; 
        
        default {
            _boxArry = [];
            _side = civilian;
        };
    };
};
	
//Schütze aussteigen
(gunner _veh) action ["getout", _veh];
	
//Festellung Bewaffnung
private _magazineVeh = magazines _veh;
private _weaponsVeh = weapons _veh;
private _magazineVehArryNew  = [];

_magazineVehArryNew = [_veh] call FUNC(auslesenmagazine);

// Darstellung Magazine
private _magazineVehCount = count _magazineVehArryNew; 

if (_magazineVehCount > 0) then {
   private _anzeige = [];
   private _MuniKugel = "\A3\Weapons_F\Data\UI\m_200rnd_65x39_yellow_ca.paa";
   private _MuniRakete = "\A3\Weapons_F_beta\Launchers\titan\Data\UI\gear_titan_missile_atl_CA.paa";

    if (_veh isKindOf "Air") then {
        {
            if (getNumber (configFile >> "cfgMagazines" >> (_x select 0) >> "count") > 30) then {
                _anzeige pushBack _MuniKugel;

            } else {
                _anzeige pushBack _MuniRakete;

            };

        } forEach _magazineVehArryNew;

    } else {
        {
            if (true) then {
                _anzeige pushBack _MuniKugel;
            };
        } forEach _magazineVeh;
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

    for "_i" from 1 to _magazineVehCount do {
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

if (_side isEqualTo civilian) then {
    //Box7 füllen
    private _index = lbAdd [10016, format ["Datalink $%1", GVAR(preisDatalink)]];    
    _index = lbAdd [10016, "Leer"];    

    ctrlSetText [10043, "Datalink"];

} else {
    _bewaffnungpreis = [_side, _magazineVehArryNew] call FUNC(geldVorhandeneBewaffnung);
    
    ctrlSetText [10001, format["$:%1", _bewaffnungpreis]];

    //Boxen füllen
    private _Rakmag  = _boxArry select 4 select 0;
    private _gunmag = _boxArry select 4 select 1;
    private _draht = _boxArry select 2 select 0;
    private _tarnung = _boxArry select 2 select 1;
    private _datalink = _boxArry select 3 select 0;

    if (_veh isKindOf "Air") then {
        //Box1+2
        private _heli = [];
        if (_side isEqualTo west) then {    
            _heli = GVAR(Gunheliwest);         

        } else {
          _heli = GVAR(Gunhelieast);

        };

        {
            _index = lbAdd [
                10010, 
                format["%1 $%2", _heli select _x select 4, _heli select _x select 3]     
            ];

            _index = lbAdd [
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
        if (_side isEqualTo west) then {    
            _heli = GVAR(Raktenheliwest);
               
        } else {
            _heli = GVAR(Raktenhelieast);

        };    

        {
            _index = lbAdd [
                10012,
                format["%1 $%2", _heli select _x select 4, _heli select _x select 3]
            ];

            _index = lbAdd [
                10013, 
                format["%1 $%2", _heli select _x select 4, _heli select _x select 3]
            ];

        } forEach (_boxArry select 0);

        _index = lbAdd [10012,"Leer"];    
        _index = lbAdd [10013,"Leer"];

        ctrlSetText [10039, "Magazin Raketen"];
        ctrlSetText [10040, "Magazin Raketen"];
                    
        //Box5+6
        if (_Rakmag > 2) then  {
            private _heli = [];
            if (_side == west) then {    
                _heli = GVAR(Raktenheliwest);

            } else {
                _heli = GVAR(Raktenhelieast);
               
            };

            {
                _index = lbAdd [
                    10014, 
                    format["%1 $%2", _heli select _x select 4, _heli select _x select 3]
                ];

                _index = lbAdd [
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
        if (_side isEqualTo west) then {    
            _vehSelect = GVAR(Gunvehwest);

        } else {
            _vehSelect = GVAR(Gunveheast);
                    
        };

        {
            _index = lbAdd [
                10010, 
                format["%1 $%2", _vehSelect select _x select 4,_vehSelect select _x select 3]
            ];

            _index = lbAdd [
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
        if (_side == west) then {    
            _vehSelect = GVAR(Gunvehwest);

        } else {
            _vehSelect = GVAR(Gunveheast);

        };

        {
            _index = lbAdd [
                10012, 
                format["%1 $%2", _vehSelect select _x select 4, _vehSelect select _x select 3]
            ];

            _index = lbAdd [
                10013, format["%1 $%2", _vehSelect select _x select 4, _vehSelect select _x select 3]
            ];

        } forEach (_boxArry select 1);

        _index = lbAdd [10012,"Leer"];    
        _index = lbAdd [10013,"Leer"];

        ctrlSetText [10039, "Magazin Gun"];
        ctrlSetText [10040, "Magazin Gun"];


        //Box5            
        if (_draht > 0) then {    
            _index = lbAdd [10014, format ["Drahtkäfig $%1", GVAR(preisDrahtkafig)]];
            _index = lbAdd [10014,"Leer"];
            ctrlSetText [10041, "Drahtkäfig"];    
        };

        //Box6            
        if (_tarnung > 0) then {
            _index = lbAdd [10015,format ["Tarnung $%1", GVAR(preisTarnung)]];
            _index = lbAdd [10015,"Leer"];    
            ctrlSetText [10042, "Tranung"];
        };        
    };
    
    //Box7            
    if (_datalink > 0) then  {
        _index = lbAdd [10016,format ["Datalink $%1", GVAR(preisDatalink)]];    
        _index = lbAdd [10016,"Leer"];    
        ctrlSetText [10043, "Datalink"];
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

while {((OPTWWbuygo == 0) and (OPTWWlostgo == 0) and dialog)} do {
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
        
    if (_side isEqualTo civilian) then {
        if ((lbCurSel 10016) > -1) then {    
            if (lbCurSel 10016 == 0) then {
                _wert = _wert + GVAR(preisDatalink);
                _buyDatalink = true;
            };

        };    

    } else {         
        if (_veh isKindOf "Air") then {
            if (_side isEqualTo west) then {    
                _waffenauswahlarry1 = GVAR(Gunheliwest);
                _waffenauswahlarry2 = GVAR(Raktenheliwest);
                }
            else {    
                _waffenauswahlarry1 = GVAR(Gunhelieast);
                _waffenauswahlarry2 = GVAR(Raktenhelieast);
            };

                if ((lbCurSel 10010) > -1) then {    
                    if ((lbCurSel 10010) < (count (_boxArry select 1))) then {
                        _boxindex = (_boxArry select 1) select lbCurSel 10010;
                        _wert = _wert +((_waffenauswahlarry1 select _boxindex) select 3);
                        _magazin = ((_waffenauswahlarry1 select _boxindex) select 0);
                        _weapon = ((_waffenauswahlarry1 select _boxindex) select 1);
                
                        _buygunmagazine pushBack _magazin;

                        if (!(_weapon in _buygunweapon)) then {
                            _buygunweapon pushBack _weapon;
                        };

                    };

                };    

                if ((lbCurSel 10011) > -1) then {    
                    if ((lbCurSel 10011) < (count (_boxArry select 1))) then {
                        _boxindex = (_boxArry select 1) select lbCurSel 10011;
                        _wert = _wert + ((_waffenauswahlarry1 select _boxindex) select 3);
                        _magazin = ((_waffenauswahlarry1 select _boxindex) select 0);
                        _weapon = ((_waffenauswahlarry1 select _boxindex) select 1);
                
                        _buygunmagazine pushBack _magazin;

                        if (!(_weapon in _buygunweapon)) then {
                            _buygunweapon pushBack _weapon;
                        };

                    };

                };    

                if ((lbCurSel 10012) > -1) then {    
                    if ((lbCurSel 10012) < (count (_boxArry select 0))) then {
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

                if ((lbCurSel 10013) > -1) then {    
                    if ((lbCurSel 10013) < (count (_boxArry select 0))) then {
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

                if ((lbCurSel 10014) > -1) then {    
                    if ((lbCurSel 10014) < (count (_boxArry select 0))) then {
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

                if ((lbCurSel 10015) > -1) then {
                    if ((lbCurSel 10015) < (count (_boxArry select 0))) then {
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

                if ((lbCurSel 10016) > -1) then  {    
                    if (lbCurSel 10016 == 0) then {
                        _wert = _wert + GVAR(preisDatalink);
                        _buyDatalink = true;
                    };

                }; 

        } else {
            if (_side == west) then {    
                _waffenauswahlarry1 = GVAR(Gunvehwest);                           

            } else {    
                _waffenauswahlarry1 = GVAR(Gunveheast);

            };       

            if ((lbCurSel 10010) > -1) then {    
                if ((lbCurSel 10010) < (count (_boxArry select 1))) then {
                    _boxindex = (_boxArry select 1) select lbCurSel 10010;
                    _wert = _wert + ((_waffenauswahlarry1 select _boxindex) select 3);
                    _magazin = ((_waffenauswahlarry1 select _boxindex) select 0);
                    _weapon = ((_waffenauswahlarry1 select _boxindex) select 1);
            
                    _buygunmagazine pushBack _magazin;

                    if (!(_weapon in _buygunweapon)) then {
                        _buygunweapon pushBack _weapon;
                    };

                };

            };    

            if ((lbCurSel 10011) > -1) then {    
                if ((lbCurSel 10011) < (count (_boxArry select 1))) then {
                    _boxindex = (_boxArry select 1) select lbCurSel 10011;
                    _wert = _wert + ((_waffenauswahlarry1 select _boxindex) select 3);
                    _magazin = ((_waffenauswahlarry1 select _boxindex) select 0);
                    _weapon = ((_waffenauswahlarry1 select _boxindex) select 1);
            
                    _buygunmagazine pushBack _magazin;

                    if (!(_weapon in _buygunweapon)) then {
                        _buygunweapon pushBack _weapon;
                    };

                };

            };    

            if ((lbCurSel 10012) > -1) then {    
                if ((lbCurSel 10012) < (count (_boxArry select 1))) then {
                    _boxindex = (_boxArry select 1)select lbCurSel 10012;
                    _wert = _wert + ((_waffenauswahlarry1 select _boxindex) select 3);
                    _magazin = ((_waffenauswahlarry1 select _boxindex) select 0);
                    _weapon = ((_waffenauswahlarry1 select _boxindex) select 1);
            
                    _buygunmagazine pushBack _magazin;

                    if (!(_weapon in _buygunweapon)) then {
                        _buygunweapon pushBack _weapon;
                    };

                };

            };    

            if ((lbCurSel 10013) > -1) then {    
                if ((lbCurSel 10013) < (count (_boxArry select 1))) then {
                    _boxindex = (_boxArry select 1)select lbCurSel 10013;
                    _wert = _wert + ((_waffenauswahlarry1 select _boxindex) select 3);
                    _magazin = ((_waffenauswahlarry1 select _boxindex) select 0);
                    _weapon = ((_waffenauswahlarry1 select _boxindex) select 1);
            
                    _buygunmagazine pushBack _magazin;

                    if (!(_weapon in _buygunweapon)) then {
                        _buygunweapon pushBack _weapon;
                    };

                };

            };

            if ((lbCurSel 10014) > -1) then {    
                if ((lbCurSel 10014) == 0) then {
                    _wert = _wert + GVAR(preisDrahtkafig);
                    _buyDraht = true;
                };

            };    

            if ((lbCurSel 10015) > -1) then {    
                if ((lbCurSel 10015) == 0) then {
                    _wert = _wert + GVAR(preisTarnung);
                    _buyTarnung = true;
                };

            };

            if ((lbCurSel 10016) > -1) then {    
                if (lbCurSel 10016 == 0) then {
                    _wert = _wert + GVAR(preisDatalink);                            
                    _buyDatalink = true;
                };

            };            
        };
    };        
                                    
    ctrlSetText [10001, format["$:%1", (_bewaffnungpreis -_wert)]];    
};

(gunner _veh) action ["getout", _veh];
        
if (OPTWWbuygo == 1) then {
    [
        _veh,
        _side,
        _weaponsVeh,
        _magazineVeh,
        _pylon,
        _buyDatalink,
        _buygunmagazine,
        _buygunweapon,
        _bewaffnungpreis,
        _vehDisplayName,
        _buyrakmagazine,
        _buykontrolle
    ] call FUNC(bewaffnen);  
};    
    
if (OPTWWlostgo == 1) then {
    if (_side != civilian) then {
        [
            _veh,
            _weaponsVeh,
            _magazineVeh,
            _pylon,
            _bewaffnungpreis,
            _vehDisplayName
        ] call FUNC(entwaffnen);    
    }; 
};
    