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

// EH für Aufnahme von Funkgeräten 
player addEventHandler["Take", {
    /*
         unit: Object - Unit to which the event handler is assigned
        container: Object - The container from which the item was taken (vehicle, box, etc.)
        item: String - The class name of the taken item
    */
    params ["_unit", "_container", "_item"];

    if ((_item find "TFAR_" == 0) or (_item find "tf_" == 0)) then {
        [] call FUNC(setTFARFrequencies);
    };

}];

player addEventHandler ["GetInMan", {
    /*
    unit: Object - Unit the event handler is assigned to
    position: String - Can be either "driver", "gunner" or "cargo"
    vehicle: Object - Vehicle the unit entered
    turret: Array - turret path
    */
    params ["_unit", "_pos", "_vec", "_turret"];

    if ((_vec call TFAR_fnc_getVehicleSide) != player getVariable QGVARMAIN(playerSide)) then {
        // check if there is a radio in the vehicle
		_LRinside = _vec call TFAR_fnc_hasVehicleRadio;
		if (_LRinside) then {
			_VehicleLR = player call TFAR_fnc_VehicleLR;
			_encryption = _VehicleLR call TFAR_fnc_getLrRadioCode;
			
			switch (player getVariable QGVARMAIN(playerSide)) do  {
                case west: {
                    if (toLower(_encryption) == "_opfor") then {
                        If (OPT_PARAM_TFAR_INTERCEPTION == 0) then {
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
                        If (OPT_PARAM_TFAR_INTERCEPTION == 0) then {
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

// EH entfernt alle Funkgeräte einer Leiche aus dem Inventar/Weste/Rucksack
player addEventHandler ["Killed", {
    params ["_unit", "_killer", "_instigator", "_effects"];

    // Funkgeräte löschen
    _inventory = (assignedItems _unit) + (items _unit);
    if ((backpack _unit find "TFAR_" == 0) or (backpack _unit find "tf_" == 0)) then {
        removeBackpack _unit;
    };

    {
        if ((_x find "TFAR_" == 0) or (_x find "tf_" == 0)) then {
            
            _unit unassignItem _x;
            _unit removeItem _x;
        };
    } foreach _inventory;

}];
