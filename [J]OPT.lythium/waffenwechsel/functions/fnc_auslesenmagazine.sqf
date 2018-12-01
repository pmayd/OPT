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
*/
#include "script_component.hpp"
/* PARAMS */
params [
    "_veh"
];

/* VALIDATION */

/* CODE BODY */
private _magazineVeh = magazines _veh;
private _weaponsVeh = weapons _veh;

_weaponsVeh deleteAt (_weaponsVeh find "OPT_CMFlareLauncher");
_weaponsVeh deleteAt (_weaponsVeh find "OPT_CMFlareLauncher_Triples");
_weaponsVeh = _weaponsVeh select {_x != ""};

private _magazineFilter = [
    "96Rnd_CMFlare_Chaff_Magazine",
    "120Rnd_CMFlare_Chaff_Magazine",
    "240Rnd_CMFlare_Chaff_Magazine",
    "60Rnd_CMFlare_Chaff_Magazine",
    "192Rnd_CMFlare_Chaff_Magazine",
    "168Rnd_CMFlare_Chaff_Magazine",
    "300Rnd_CMFlare_Chaff_Magazine",
    "OPT_12Rnd_CMFlare_Chaff_Magazine",
    "OPT_20Rnd_CMFlare_Chaff_Magazine",
    "OPT_30Rnd_CMFlare_Chaff_Magazine"
];

{
    _magazineVeh deleteAt (_magazineVeh find _X);                
} forEach _magazineFilter;

_magazineVeh = _magazineVeh select {_x != ""};

private _magazineVehArry = magazinesAmmo _veh;
private _magazineVehPylon = [];
private _magazineVehPylonArry = getPylonMagazines _veh;
_magazineVehPylonArry = _magazineVehPylonArry select {_x != ""};

if (count _magazineVehPylonArry > 0) then {
    if (count _magazineVehPylonArry > 4) then {
        _magazineVehPylonArry resize 4
    };

    for "_i" from 1 to (count _magazineVehPylonArry) do {
        _magazineVehPylon pushBack [_magazineVehPylonArry select (_i - 1), _veh ammoOnPylon (_pylon select (_i - 1))];
        //systemchat format ["MP:%1 I:%2 MN:%3 AP:%4",_magazineVehPylon,_i,(_magazineVehPylonArry select _i-1),(_veh ammoOnPylon (_pylon select _i-1))];
        sleep 0.001;
    };    
};    
    
//kontrolle Bewaffnung Auslesung

private _magazineFilter2 = [
    ["96Rnd_CMFlare_Chaff_Magazine", 96],
    ["120Rnd_CMFlare_Chaff_Magazine", 120],
    ["240Rnd_CMFlare_Chaff_Magazine", 240],
    ["60Rnd_CMFlare_Chaff_Magazine", 60],
    ["192Rnd_CMFlare_Chaff_Magazine", 192],
    ["168Rnd_CMFlare_Chaff_Magazine", 168],
    ["300Rnd_CMFlare_Chaff_Magazine", 300],
    ["OPT_12Rnd_CMFlare_Chaff_Magazine", 12],
    ["OPT_20Rnd_CMFlare_Chaff_Magazine", 20],
    ["OPT_30Rnd_CMFlare_Chaff_Magazine", 30]
];

{
    _magazineVehArry deleteAt (_magazineVehArry find _x);                
} forEach _magazineFilter2;

{
    _magazineVehArry deleteAt (_magazineVehArry find _x);                
} forEach _magazineVehPylon;

_magazineVehArryNew = _magazineVehArry + _magazineVehPylon;    

_magazineVehArryNew