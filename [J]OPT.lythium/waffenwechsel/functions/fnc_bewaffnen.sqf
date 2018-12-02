/**
* Funktion 
* bewaffnet ein Fahrzeug mit der Auswahl aus dem Waffenwechsel-Dialog
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
* 
* 
*
*/

#include "script_component.hpp"

/* PARAMS */
params [
    "_veh",
    "_side",
    "_weaponsVeh",
    "_magazineVeh",
    "_pylon",
    "_buyDatalink",
    "_buyGunMagazine",
    "_buyGunWeapon",
    "_bewaffnungpreis",
    "_vehDisplayName",
    "_buyRakMagazine",
    "_buyControl"
];

/* VALIDATION */

/* CODE BODY */
if (_side == civilian) then {    
    if (_buyDatalink) then {
        _veh setVehicleReportOwnPosition true;
        _veh setVehicleReportRemoteTargets true;
        _veh setVehicleReceiveRemoteTargets true;                    

        [PLAYER_NAME, PLAYER_SIDE, typeOf _veh, _wert, "-", "weapons"] call EFUNC(common,updateBudget);
        
        private _txt = format["%1 ausgerüstet für %2 €.", typeOf _veh, _wert];
        ["Ausrüsten", _txt, "green"] call EFUNC(gui,message);
                            
    };    
    
    closeDialog 0;

} else {
    {_veh removeWeapon _x} forEach _weaponsVeh;    
    {_veh removeMagazine _x} forEach _magazineVeh;    
        
    for "_i" from 1 to (count _pylon) do {
        _veh setPylonLoadOut [_pylon select (_i -1), ""];     
        sleep 0.001;
    };    

    if (_veh isKindOf "Air") then  {    
        if ((count _buyGunMagazine) > 0) then {    
            if ((_veh isKindOf "OPT_B_Heli_Attack_01_F_un") or (_veh isKindOf "OPT_O_Heli_Attack_02_F_un")) then {
                {
                    _veh addMagazineTurret [_x, [0]]                    
                } forEach _buyGunMagazine;

                {
                    _veh addWeaponTurret [_x, [0]]
                } forEach _buyGunWeapon;         
                                       
            } else {    
                {
                    _veh addMagazine [_x, 9999];
                } forEach _buyGunMagazine;

                {
                    _veh addWeapon _x
                } forEach _buyGunWeapon;    
            };
        };    

        if ((count _buyRakMagazine) > 0) then {
            for "_i" from 1 to (count _buyRakMagazine) do {
                if ((_veh isKindOf "OPT_B_Heli_Attack_01_F_un") or (_veh isKindOf "OPT_O_Heli_Attack_02_F_un")) then {
                    if (_buyControl select (_i - 1) == 0) then {                            
                        _veh setPylonLoadOut [_pylon select (_i - 1), _buyRakMagazine select (_i - 1), true, [0]];                                 
                    } else {
                        _veh setPylonLoadOut [_pylon select (_i - 1), _buyRakMagazine select (_i - 1)];     
                    };

                } else {    
                    _veh setPylonLoadOut [_pylon select (_i - 1), _buyRakMagazine select (_i - 1)];     
                };
                sleep 0.001;
            };    
        };
    } else  {
        if ((count _buyGunMagazine) > 0) then {                
            {
                _veh addMagazine [_x, 9999];
            } forEach _buyGunMagazine;

            {
                _veh addWeapon _x;
            } forEach _buyGunWeapon;
        };

        if (_buyDraht) then {
            _veh animateSource ["showSLATHull", 1];
            _veh animateSource ["showSLATTurret", 1];
        };

        if (_buyTarnung) then {
            _veh animateSource ["showCamonetPlates1", 1];
            _veh animateSource ["showCamonetPlates2", 1];
            _veh animateSource ["showCamonetHull", 1];
            _veh animateSource ["showCamonetCannon", 1];
            _veh animateSource ["showCamonetTurret", 1];
        };    
    };

    if (_buyDatalink) then {
        _veh setVehicleReportOwnPosition true;
        _veh setVehicleReportRemoteTargets true;
        _veh setVehicleReceiveRemoteTargets true;
    };    
    
    if ((_bewaffnungpreis - _wert) > 0) then {                
        [PLAYER_NAME, PLAYER_SIDE, typeOf _veh, (_bewaffnungpreis - _wert), "+", "weapons"] call EFUNC(common,updateBudget);
        
        private _txt = format["%1 ausgerüstet, Gutschrift %2 €.", _vehDisplayName, (_bewaffnungpreis - _wert)];
        ["Ausrüsten", _txt, "green"] call EFUNC(gui,message);
    
        [name player, _wert, _txt] remoteExecCall [QFUNC(cbatext), playerSide, false];
    } else {
        [PLAYER_NAME, PLAYER_SIDE, typeOf _veh, ((_bewaffnungpreis - _wert) * (-1)), "-", "weapons"] call EFUNC(common,updateBudget);
        
        private _txt = format["%1 ausgerüstet für %2 €.", _vehDisplayName, (_bewaffnungpreis - _wert)];
        ["Ausrüsten", _txt, "green"] call EFUNC(gui,message);
                    
        [name player, _wert, _txt] remoteExecCall [QFUNC(cbatext), playerSide, false];
    };    
    
    closeDialog 0;
};