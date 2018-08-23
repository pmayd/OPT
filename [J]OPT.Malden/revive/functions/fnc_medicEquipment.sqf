/**
* Author: James
* spawn medical objects and store in FAR_medequipArray
*
* Arguments:
* 0: <OBJECT> healer
* 1: <OBJECT> patient
*
* Return Value:
* None
*
* Example:
* [player, cursorObject] call fnc_handleRevive.sqf;
*
*/
#include "script_component.hpp"

params ["_healer","_injured"];

if (!local _healer) exitWith {};

if ([_healer] call FUNC(isMedic)) then {
	private _defi_pos = _healer modelToWorld [-0.5,0.2,0];
	private _defi = "Land_Defibrillator_F" createVehicle _defi_pos;
	_defi setPos _defi_pos;
	_defi setDir (getDir _healer - 180);

	FAR_medequipArray pushBack _defi;

	if (damage _injured >= 0.5 && {(random 2) >= 1}) then {
		private _bb_pos = _healer modelToWorld [0.4,(0.2 - (random 0.5)),0];
		private _bb = "Land_BloodBag_F" createVehicle _bb_pos;
		_bb setPos _bb_pos;
		_bb setDir (random 359);
		FAR_medequipArray pushBack _bb;
	};
};

for "_i" from 1 to (1 + (round random 3)) do {
	private _band_pos = _healer modelToWorld [(random 1.3),(0.8 + (random 0.6)),0];
	private _band = "Land_Bandage_F" createVehicle _band_pos;
	_band setPos _band_pos;
	_band setDir (random 359);
	FAR_medequipArray pushBack _band
};
if (random 2 >= 1) then {
	private _ab_pos = _healer modelToWorld [-0.8,(0.6 - (random 0.4)),0];
	private _ab = "Land_Antibiotic_F" createVehicle _ab_pos;
	_ab setPos _ab_pos;
	_ab setDir (random 359);
	FAR_medequipArray pushBack _ab;
};

true