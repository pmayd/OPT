/**
* Funktion Magazine auslesen
* 
* Author: [GNC]Lord-MDB
*
* Arguments:
* _veh
* 
* Return Value:
* _magazine
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

params ["_veh"];

private _Magazinveh = magazines _veh;
private _weaponsveh = weapons _veh;

_weaponsveh deleteAt (_weaponsveh find "OPT_CMFlareLauncher");
_weaponsveh deleteAt (_weaponsveh find "OPT_CMFlareLauncher_Triples");
_weaponsveh = _weaponsveh select {_x != ""};

private _Magazinfilter =["96Rnd_CMFlare_Chaff_Magazine","120Rnd_CMFlare_Chaff_Magazine","240Rnd_CMFlare_Chaff_Magazine","60Rnd_CMFlare_Chaff_Magazine",
"192Rnd_CMFlare_Chaff_Magazine","168Rnd_CMFlare_Chaff_Magazine","300Rnd_CMFlare_Chaff_Magazine","OPT_12Rnd_CMFlare_Chaff_Magazine",
"OPT_20Rnd_CMFlare_Chaff_Magazine","OPT_30Rnd_CMFlare_Chaff_Magazine"];

{
_Magazinveh deleteAt (_Magazinveh find _X);                
} forEach _Magazinfilter;

_Magazinveh = _Magazinveh select {_x != ""};

private _Magazinveharry= magazinesAmmo _veh;
private _Magazinvehpylon =[];
private _Magazinvehpylonarry = getPylonMagazines _veh;
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

private _Magazinfilter2 =[["96Rnd_CMFlare_Chaff_Magazine",96],["120Rnd_CMFlare_Chaff_Magazine",120],["240Rnd_CMFlare_Chaff_Magazine",240],["60Rnd_CMFlare_Chaff_Magazine",60],
["192Rnd_CMFlare_Chaff_Magazine",192],["168Rnd_CMFlare_Chaff_Magazine",168],["300Rnd_CMFlare_Chaff_Magazine",300],["OPT_12Rnd_CMFlare_Chaff_Magazine",12],
["OPT_20Rnd_CMFlare_Chaff_Magazine",20],["OPT_30Rnd_CMFlare_Chaff_Magazine",30]];

{
_Magazinveharry deleteAt (_Magazinveharry find _X);                
} forEach _Magazinfilter2;

{
_Magazinveharry deleteAt (_Magazinveharry find _X);                
} forEach _Magazinvehpylon;

_Magazinveharrynew=_Magazinveharry + _Magazinvehpylon;    

_Magazinveharrynew