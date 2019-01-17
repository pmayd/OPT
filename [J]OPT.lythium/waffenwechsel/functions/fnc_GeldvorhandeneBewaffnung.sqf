/**
* Description:
* Funktion Preis vorhandene Bewaffnung ermitteln
* 
* Author: 
* [GNC]Lord-MDB
*
* Arguments:
* 0: <SIDE> _side
* 1: <ARRAY> _magazineVehArryNew
* 
* Return Value:
* <NUMBER> _bewaffnungPreis
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
* [west, [...]] call EFUNC(waffenwechsel,geldVorhandeneBewaffnung);
*/
#include "script_component.hpp"

/* PARAMS */
params 
[
    "_side",
    "_magazineVehArryNew"
];

/* VALIDATIOn */
private _bewaffnungPreis = 0;
if (_side isEqualTo sideUnknown) exitWith {_bewaffnungPreis};

/* CODE BODY */
private _vehiclePool = [];
if (_side isEqualTo west) then 
{    
    _vehiclePool = GVAR(Raktenheliwest) + GVAR(Gunheliwest) + GVAR(Gunvehwest);
               
} 
else 
{    
    _vehiclePool = GVAR(Raktenhelieast)  + GVAR(Gunhelieast) + GVAR(Gunveheast);

};
      
for "_i" from 1 to (count _vehiclePool) do 
{
    {
        private _magazineName = _vehiclePool select (_i - 1) select 0;
        // prüfe alle ausgewählten Magazine und vergleiche mit gewähltem Fahrzeug aus Pool
        // wenn Magazine gefunden, addiere Preis
        if (_magazineName isEqualTo (_x select 0)) then {                            
            private _magazinePrice = _vehiclePool select (_i - 1) select 2;
            _bewaffnungPreis = _bewaffnungPreis + (_magazinePrice * (_x select 1));
        };

    } forEach _magazineVehArryNew;                
    sleep 0.001;
};

_bewaffnungPreis