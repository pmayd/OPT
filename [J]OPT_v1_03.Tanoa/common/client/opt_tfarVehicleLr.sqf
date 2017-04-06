/*
	Check TFAR vehicle Longrange Radios

	Author: schmingo (OPT MOD Team)

	v2015-02-25 | this script is part of OperationPandoraTrigger ArmA3 script collection
*/

// rewritten by psycho
private ["_vehicle","_encryption","_LRinside", "_vec","_VehicleLR","_i"];
if (!local player) exitWith {};

_LRinside = false;
_vec = vehicle player;

while {true} do {
	sleep 3;
	_i = 0;
	waitUntil {vehicle player != player && {vehicle player != _vec}};
	_vec = vehicle player;
	if (alive player && {(_vec call TFAR_fnc_getVehicleSide) != playerSide}) then {
		_LRinside = _vec call TFAR_fnc_hasVehicleRadio;
		if (_LRinside) then {
			_VehicleLR = player call TFAR_fnc_VehicleLR;
			_encryption = _VehicleLR call TFAR_fnc_getLrRadioCode;
			
			if (playerSide == west) then {
				if (toLower(_encryption) == "_opfor") then {
					If (OPT_TFAR_INTERCEPTION == 0) then {
						[_VehicleLR select 0, _VehicleLR select 1, "_bluefor"] call TFAR_fnc_setLrRadioCode;
						systemChat "Die Funk-Verschlüsselung wurde geändert.";
					} else {
						for "_i" from 0 to 8 do {
							[_VehicleLR select 0, _VehicleLR select 1, _i] call TFAR_fnc_setLrChannel;
							[_VehicleLR select 0, _VehicleLR select 1, "30.00"] call TFAR_fnc_setLrFrequency;
						};
						systemChat "Frequenz auf Beginn des Frequenzbandes gestellt";
					};
				};
			} else {
				if (toLower(_encryption) == "_bluefor") then {
					If (OPT_TFAR_INTERCEPTION == 0) then {
						[_VehicleLR select 0, _VehicleLR select 1, "_opfor"] call TFAR_fnc_setLrRadioCode;
						systemChat "Die Funk-Verschlüsselung wurde geändert.";
					} else {
						for "_i" from 0 to 8 do {
							[_VehicleLR select 0, _VehicleLR select 1, _i] call TFAR_fnc_setLrChannel;
							[_VehicleLR select 0, _VehicleLR select 1, "30.00"] call TFAR_fnc_setLrFrequency;
						};
						systemChat "Frequenz auf Beginn des Frequenzbandes gestellt";
					};
				};			
			};
		};
	};
};