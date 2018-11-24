/**
* Funktion Entwaffnen
* 
* Author: [GNC]Lord-MDB
*
* Arguments:
* _veh,_weaponsveh,_Magazinveh,_pylon,_bewaffnungpreis,_Fname
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

params ["_veh","_weaponsveh","_Magazinveh","_pylon","_bewaffnungpreis","_Fname"];


            {_veh removeWeapon _x} forEach _weaponsveh;    
            {_veh removeMagazine _x} forEach _Magazinveh;

            for "_i" from 1 to count _pylon do
                {
               private _veh setPylonLoadOut [(_Pylon Select _i-1),""];     
                sleep 0.001;
                };    
            
            [PLAYER_NAME, PLAYER_SIDE, typeOf _veh, _bewaffnungpreis, "+", "weapons"] call EFUNC(common,updateBudget);            
            
            private _txt = format["%1 entwaffnet für %2 €.", _Fname, _bewaffnungpreis];
            ["Entwaffnen", _txt, "green"] call EFUNC(gui,message);

			closeDialog 0;   