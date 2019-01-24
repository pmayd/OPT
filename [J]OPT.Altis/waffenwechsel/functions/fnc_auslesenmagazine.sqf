/**
* Description:
* Funktion Magazine auslesen
* 
* Author: 
* [GNC]Lord-MDB
*
* Arguments:
* 0: <OBJECT> Fahrzeug, dass ausgelesen werden soll
* 
* Return Value:
* <ARRAY> _magazineVehArryNew
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
* [vehicle] call EFUNC(waffenwechsel,auslesenMagazine);
*/
#include "script_component.hpp"

/* PARAMS */
params 
[
    ["_veh", objNull, [objNull], 1]
];

/* VALIDATION */

if (_veh isEqualTo objNull) exitWith{[]};

/* CODE BODY */

private _magazineVehArry = magazinesAmmo _veh;
private _magazineVehPylon = [];
private _magazineVehPylonArry = getPylonMagazines _veh;
_magazineVehPylonArry = _magazineVehPylonArry select {_x != ""};

if (count _magazineVehPylonArry > 0) then 
{
    if (count _magazineVehPylonArry > 4) then 
	{
        _magazineVehPylonArry resize 4
    };

    for "_i" from 1 to (count _magazineVehPylonArry) do 
	{
        _magazineVehPylon pushBack [_magazineVehPylonArry select (_i - 1), _veh ammoOnPylon (_pylon select (_i - 1))];
        //systemchat format ["MP:%1 I:%2 MN:%3 AP:%4",_magazineVehPylon,_i,(_magazineVehPylonArry select _i-1),(_veh ammoOnPylon (_pylon select _i-1))];
        sleep 0.001;
    };    
};   
    
//kontrolle Bewaffnung Auslesung
private _magazineFilter2 = 
[
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

private _magazineVehArryNew  = [];
_magazineVehArryNew = _magazineVehArry + _magazineVehPylon;   

//systemchat format ["MAV:%1 MP:%2",_magazineVehArry,_magazineVehPylon];
   
_magazineVehArryNew