/**
* Author: James
* initialize CBA class event handler
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_initCBAClassEvents.sqf;
*
*/
#include "script_component.hpp"

/* Class EH */
// Engine EH für Piloten -> Log transportierte Soldaten
_success = ["Air", "GetIn", {
    /*
    vehicle: Object - Vehicle the event handler is assigned to
    position: String - Can be either "driver", "gunner" or "cargo"
    unit: Object - Unit that entered the vehicle
    (Since Arma 3 v1.36)
    turret: Array - turret path
    */
    params ["_vec", "_pos", "_unit"];

    // speichere Pilot als Variable des Objekts Heli
    if (_pos isEqualTo "driver") then {
        _vec setVariable [QGVAR(transport_pilot), _unit];
    };

    // speichere aktuellen Ort an der Einheit
    _unit setVariable [QGVAR(transport_start_loc), getPosASL _vec];
            
}] call CBA_fnc_addClassEventHandler;
if !(_success) then {ERROR("Failed adding ClassEventHandler 'GetIn' for Helicopters")};

_success = ["Air", "GetOut", {
    /*
    vehicle: Object - Vehicle the event handler is assigned to
    position: String - Can be either "driver", "gunner" or "cargo"
    unit: Object - Unit that left the vehicle
    turret: Array - turret path (since Arma 3 v1.36)
    */

    // logge transport von Spielern, falls Spieler nicht Pilot und Strecke > 500m
    _this call EFUNC(log,writeTransportDistance);

}] call CBA_fnc_addClassEventHandler;
if !(_success) then {ERROR("Failed adding ClassEventHandler 'GetOut' for Helicopters")};
