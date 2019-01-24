/**
* Description:
* Funktion Waffen+Magazine Filtern
* 
* Author: 
* [GNC]Lord-MDB
*
* Arguments:
* 0: <OBJECT> Fahrzeug, dass ausgelesen werden soll
* 
* Return Value:
* <ARRAY> _waffenMagazinArry 
* 
* Server only:
* no
*
* Public:
* no
* 
* Global:
* no
* 
* Sideeffects:
* no
* 
* Example:
* [vehicle] call EFUNC(waffenwechsel,waffenMagazinFilter);
*/
#include "script_component.hpp"

/* PARAMS */
params 
[
    ["_veh", objNull, [objNull], 1]
];

/* VALIDATION */

/* CODE BODY */

private _magazineVeh = magazines _veh;
private _weaponsVeh = weapons _veh;
private _magazineVehArryNew  = [];
private _waffenMagazinArry  = [];

_weaponsVeh deleteAt (_weaponsVeh find "OPT_CMFlareLauncher");
_weaponsVeh deleteAt (_weaponsVeh find "OPT_CMFlareLauncher_Triples");
_weaponsVeh = _weaponsVeh select {_x != ""};

private _magazineVeh = magazines _veh;

private _magazineFilter = 
[
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
    _magazineVeh deleteAt (_magazineVeh find _x);                
} forEach _magazineFilter;

_magazineVeh = _magazineVeh select {_x != ""};

_waffenMagazinArry =[_weaponsVeh,_magazineVeh];

_waffenMagazinArry