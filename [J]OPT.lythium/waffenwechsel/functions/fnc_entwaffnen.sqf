/**
* Funktion Entwaffnen
* 
* Author: [GNC]Lord-MDB
*
* Arguments:
* _veh,_weaponsVeh,_magazineVeh,_pylon,_bewaffnungpreis,_vehDisplayName
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
*/
#include "script_component.hpp"

/* PARAMS */
params [
    "_veh",
    "_weaponsVeh",
    "_magazineVeh",
    "_pylon",
    "_bewaffnungpreis",
    "_vehDisplayName"
];

/* VALIDATION */

/* CODE BODY */
{
    _veh removeWeapon _x;
} forEach _weaponsVeh;    

{
    _veh removeMagazine _x;
} forEach _magazineVeh;

for "_i" from 1 to (count _pylon) do {
    _veh setPylonLoadOut [_pylon select (_i - 1), ""];     
    sleep 0.001;
};    

[PLAYER_NAME, PLAYER_SIDE, typeOf _veh, _bewaffnungpreis, "+", "weapons"] call EFUNC(common,updateBudget);            

private _txt = format["%1 entwaffnet für %2 €.", _vehDisplayName, _bewaffnungpreis];
["Entwaffnen", _txt, "green"] call EFUNC(gui,message);

closeDialog 0;   