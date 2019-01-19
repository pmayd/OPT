/**
* Description:
* Funktion Entwaffnen
* 
* Author: 
* [GNC]Lord-MDB
*
* Arguments:
* 0: <OBJECT> _veh
* 1: <ARRAY> _weaponsVeh
* 2: <ARRAY> _magazineVeh
* 3: <ARRAY> _pylon
* 4: <NUMBER> _bewaffnungPreis
* 5: <STRING> _vehDisplayName
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
* no
* 
* Sideeffects:
* no
* 
* Example:
* 
*/
#include "script_component.hpp"

/* PARAMS */
params 
[
    "_veh",
    "_weaponsVeh",
    "_magazineVeh",
    "_pylon",
    "_bewaffnungPreis",
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

for "_i" from 1 to (count _pylon) do 
{
    _veh setPylonLoadOut [_pylon select (_i - 1), ""];     
    sleep 0.001;
};    

[PLAYER_NAME, PLAYER_SIDE, typeOf _veh, _bewaffnungPreis, "+", "weapons"] call EFUNC(common,updateBudget);            

private _txt = format["%1 entwaffnet für %2 €.", _vehDisplayName, _bewaffnungPreis];
["Entwaffnen", _txt, "green"] call EFUNC(gui,message);

closeDialog 0;   