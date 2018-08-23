/**
* Author: James
* initialize EH for player associated with TFAR_fnc_activeLrRadio
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

player addEventHandler ["GetInMan", {
    /*
    unit: Object - Unit the event handler is assigned to
    position: String - Can be either "driver", "gunner" or "cargo"
    vehicle: Object - Vehicle the unit entered
    turret: Array - turret path
    */
    params ["_unit", "_pos", "_vec", "_turret"];

    if ((_vec call TFAR_fnc_getVehicleSide) != PLAYER_SIDE) then {
        // check if there is a radio in the vehicle
        _LRinside = _vec call TFAR_fnc_hasVehicleRadio;
        if (_LRinside) then {
            _VehicleLR = player call TFAR_fnc_VehicleLR;
            _encryption = _VehicleLR call TFAR_fnc_getLrRadioCode;
            
            switch (PLAYER_SIDE) do  {
                case west: {
                    if (toLower(_encryption) == "_opfor") then {
                        If (OPT_PARAM_TFAR_INTERCEPTION) then {
                            [_VehicleLR, "_bluefor"] call TFAR_fnc_setLrRadioCode;
                            systemChat "Die Funk-Verschlüsselung wurde geändert.";
                        } else {
                            for "_i" from 0 to 8 do {
                                [_VehicleLR, _i] call TFAR_fnc_setLrChannel;
                                [_VehicleLR, "30.00"] call TFAR_fnc_setLrFrequency;
                            };
                            systemChat "Frequenz auf Beginn des Frequenzbandes gestellt";
                        };
                    };
                };
                case east:  {
                    if (toLower(_encryption) == "_bluefor") then {
                        If (OPT_PARAM_TFAR_INTERCEPTION) then {
                            [_VehicleLR, "_opfor"] call TFAR_fnc_setLrRadioCode;
                            systemChat "Die Funk-Verschlüsselung wurde geändert.";
                        } else {
                            for "_i" from 0 to 8 do {
                                [_VehicleLR, _i] call TFAR_fnc_setLrChannel;
                                [_VehicleLR, "30.00"] call TFAR_fnc_setLrFrequency;
                            };
                            systemChat "Frequenz auf Beginn des Frequenzbandes gestellt";
                        };
                    };            
                };
            };
        };
    } else {
        [_vec] call FUNC(setTFARFrequencies);
    };

}];
