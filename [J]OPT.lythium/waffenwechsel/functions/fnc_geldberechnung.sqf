/**
* Description:
* description
*
* Author:
* James
*
* Arguments:
* None
*
* Return Value:
* None
*
* Server only:
* yes
*
* Public:
* yes
*
* Global:
* yes
*
* Sideeffects:
* yes
*
* Example:
* [parameter] call EFUNC(fnc_geldberechnung.sqf);
*/
#include "script_component.hpp"

/* PARAMS */

/* VALIDATION */

/* CODE BODY */
private _bewaffnungpreis = 0;
private _vehiclePool = [];

if (_side == civilian) then {
    //Box7 füllen
    private _index = lbAdd [10016, format ["Datalink $%1", GVAR(preisDatalink)]];    
    _index = lbAdd [10016, "Leer"];    
    ctrlSetText [10043, "Datalink"];

} else {

    if (_side == west) then {    
        _vehiclePool = GVAR(Raktenheliwest) + GVAR(Gunheliwest) + GVAR(Gunvehwest);
       
    } else { 
        _vehiclePool = GVAR(Raktenhelieast) + GVAR(Gunhelieast) + GVAR(Gunveheast);

    };
};

for "_i" from 1 to (count _vehiclePool) do {
    {
        private _magazineName = _vehiclePool select (_i - 1) select 0;
        private _magazinePrice = _vehiclePool select (_i - 1) select 2;

        if (_magazineName isEqualTo (_x select 0)) then {                            
            _bewaffnungpreis = _bewaffnungpreis + (_magazinePrice * (_x select 1));
        };

    } forEach _magazineVehArryNew;   

    sleep 0.001;
};