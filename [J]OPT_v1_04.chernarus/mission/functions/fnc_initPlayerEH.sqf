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

    if (OPT_PARAM_ONLY_PILOTS == 1) then {
        if (!(typeOf _unit in GVARMAIN(pilots)) && {!(typeOf _unit in ["O_Helipilot_F","B_Helipilot_F"])}) then {
            if (_vec isKindOf "Air" && _pos in GVAR(blockedVehiclePositions)) then {
                if (!(typeOf _vec in ["Steerable_Parachute_F", "NonSteerable_Parachute_F"])) then {
                    _unit action ["GetOut", _vec];
                    _txt = "Es ist nur Piloten erlaubt zu fliegen!";
                    [QEGVAR(gui,message), ["Slotsperre", _txt, "red"]] call CBA_fnc_localEvent;
                };
            };
        };
    };

    if (OPT_PARAM_ONLY_CREW == 1) then {
        if (!(typeOf _unit in GVARMAIN(crew)) && {!(typeOf _unit in ["O_crew_F","B_crew_F"])}) then {
            if (_pos in GVAR(blockedVehiclePositions)) then {
                if (typeOf _vec in GVARMAIN(crew_vecs) || _vec isKindOf "Tank") then {
                    _unit action ["GetOut", _vec];
                        _txt = "Dieser Platz ist Besatzungsmitgliedern vorbehalten!";
                    [QEGVAR(gui,message), ["Slotsperre", _txt, "red"]] call CBA_fnc_localEvent;
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

    if (OPT_PARAM_ONLY_PILOTS == 1) then {
        if (!(typeOf _unit1 in GVARMAIN(pilots)) && {!(typeOf _unit1 in ["O_Helipilot_F","B_Helipilot_F"])}) then {
            if (_vec isKindOf "Air" && (assignedVehicleRole  _unit1 select 0) in GVAR(blockedVehiclePositions)) then {
                if (!(typeOf _vec in ["Steerable_Parachute_F", "NonSteerable_Parachute_F"])) then {
                    _unit1 action ["GetOut", _vec];
                    _txt = "Es ist nur Piloten erlaubt zu fliegen!";
                    [QEGVAR(gui,message), ["Slotsperre", _txt, "red"]] call CBA_fnc_localEvent;
                };
            };
        };
    };

    if (OPT_PARAM_ONLY_CREW == 1) then {
        if (!(typeOf _unit1 in GVARMAIN(crew)) && {!(typeOf _unit1 in ["O_crew_F","B_crew_F"])}) then {
            if ( (assignedVehicleRole _unit1 select 0) in GVAR(blockedVehiclePositions)) then {
                if (typeOf _vec in GVARMAIN(crew_vecs) || _vec isKindOf "Tank") then {
                    _unit1 action ["GetOut", _vec];
                    _txt = "Dieser Platz ist Besatzungsmitgliedern vorbehalten!";
                    [QEGVAR(gui,message), ["Slotsperre", _txt, "red"]] call CBA_fnc_localEvent;
                };
            };
        };
    };

}];

true;