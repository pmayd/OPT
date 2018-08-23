/**
* Author: James
* initialize all EH for player
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_initPlayerEH.sqf;
*
*/
#include "script_component.hpp"

/*-------------------------------
Event Handler für Spieler
Sind auch nach Respawn persistent
---------------------------------*/

// EH für Waffencheck
player setVariable ["opt_pw_storage", primaryWeapon player];
player addEventHandler ["Take", {_this call EFUNC(common,weaponCheck)}];

// EH für Positionssperre in Fahrzeugen beim Einsteigen
player addEventHandler ["GetInMan", {
    /*  
        unit: Object - Unit the event handler is assigned to
        position: String - Can be either "driver", "gunner" or "cargo"
        vehicle: Object - Vehicle the unit entered
        turret: Array - turret path
    */
    params ["_unit", "_pos", "_vec", "_turret"];

    if (OPT_PARAM_ONLY_PILOTS) then {
        if (!(typeOf _unit in GVARMAIN(pilots))) then {
            if (_vec isKindOf "Air" && _pos in EGVAR(warehouse,blockedVehiclePositions)) then {
                if (!(typeOf _vec in ["Steerable_Parachute_F", "NonSteerable_Parachute_F"])) then {
                    _unit action ["GetOut", _vec];
                    _txt = "Es ist nur Piloten erlaubt zu fliegen!";
                    ["Slotsperre", _txt, "red"] call EFUNC(gui,message);
                };
            };
        };
    };

    if (OPT_PARAM_ONLY_CREW) then {
        if (!(typeOf _unit in GVARMAIN(crew))) then {
            if (_pos in EGVAR(warehouse,blockedVehiclePositions)) then {
                if (typeOf _vec in GVARMAIN(crew_vecs) || _vec isKindOf "Tank") then {
                    _unit action ["GetOut", _vec];
                        _txt = "Dieser Platz ist Besatzungsmitgliedern vorbehalten!";
                    ["Slotsperre", _txt, "red"] call EFUNC(gui,message);
                };
            };
        };
    };
}];

// EH für Positionssperre in Fahrzeugen bei Platztausch
player addEventHandler ["SeatSwitchedMan", {
        /*  
           unit1: Object - Unit switching seat.
        unit2: Object - Unit with which unit1 is switching seat.
        vehicle: Object - Vehicle where switching seats is taking place.
    */
    params ["_unit1", "_unit2", "_vec"];

    if (OPT_PARAM_ONLY_PILOTS) then {
        if (!(typeOf _unit1 in GVARMAIN(pilots))) then {
            if (_vec isKindOf "Air" && (assignedVehicleRole  _unit1 select 0) in EGVAR(warehouse,blockedVehiclePositions)) then {
                if (!(typeOf _vec in ["Steerable_Parachute_F", "NonSteerable_Parachute_F"])) then {
                    _unit1 action ["GetOut", _vec];
                    _txt = "Es ist nur Piloten erlaubt zu fliegen!";
                    ["Slotsperre", _txt, "red"] call EFUNC(gui,message);
                };
            };
        };
    };

    if (OPT_PARAM_ONLY_CREW) then {
        if (!(typeOf _unit1 in GVARMAIN(crew))) then {
            if ( (assignedVehicleRole _unit1 select 0) in EGVAR(warehouse,blockedVehiclePositions)) then {
                if (typeOf _vec in GVARMAIN(crew_vecs) || _vec isKindOf "Tank") then {
                    _unit1 action ["GetOut", _vec];
                    _txt = "Dieser Platz ist Besatzungsmitgliedern vorbehalten!";
                    ["Slotsperre", _txt, "red"] call EFUNC(gui,message);
                };
            };
        };
    };

}];

true;