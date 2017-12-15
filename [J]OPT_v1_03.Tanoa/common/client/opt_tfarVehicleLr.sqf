/*
	Check TFAR vehicle Longrange Radios

	Author: schmingo (OPT MOD Team)

	v2015-02-25 | this script is part of OperationPandoraTrigger ArmA3 script collection
*/

// rewritten by James
if (!local player) exitWith {};

player addEventHandler ["GetInMan", {
    /*
    unit: Object - Unit the event handler is assigned to
    position: String - Can be either "driver", "gunner" or "cargo"
    vehicle: Object - Vehicle the unit entered
    turret: Array - turret path
    */
    params ["_unit", "_pos", "_vec", "_turret"];

    if ((_vec call TFAR_fnc_getVehicleSide) != playerSide) then {
        // check if there is a radio in the vehicle
		_LRinside = _vec call TFAR_fnc_hasVehicleRadio;
		if (_LRinside) then {
			_VehicleLR = player call TFAR_fnc_VehicleLR;
			_encryption = _VehicleLR call TFAR_fnc_getLrRadioCode;
			
			switch (playerSide) do  {
                case west: {
                    if (toLower(_encryption) == "_opfor") then {
                        If (OPT_TFAR_INTERCEPTION == 0) then {
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
                        If (OPT_TFAR_INTERCEPTION == 0) then {
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
        //[_vec] call opt_fnc_TFARFrequencies;
    };

}];
