/**
* Author: James
* revive player
*
* Arguments:
* 0: <OBJECT> target that wants to be revived
* 1: <OBJECT> unit that called the action
*
* Return Value:
* None
*
* Example:
* [cursorObject, player] call fnc_handleRevive.sqf;
*
*/
#include "script_component.hpp"

params ["_patient", "_healer"];

if (_healer getVariable ["FAR_isUnconscious", 0] == 1) exitWith {};

_patient setVariable ["FAR_healer", _healer, true];
FAR_healerStopped = false;

_healer selectWeapon primaryWeapon _healer;
sleep 1;
_healer playAction "medicStart";
FAR_animDelay = time + 2;

private "_animChangeEVH";
if (isPlayer _healer) then {
	_animChangeEVH = _healer addEventhandler ["AnimChanged", {
		params ["_healer", "_anim"];

		if (primaryWeapon _healer != "") then {
			if (time >= FAR_animDelay) then {FAR_healerStopped = true};
		} else {
			if (_anim in ["amovpknlmstpsnonwnondnon","amovpknlmstpsraswlnrdnon"]) then {
				_healer playAction "medicStart";
			} else {
				if (!(_anim in ["ainvpknlmstpsnonwnondnon_medic0s","ainvpknlmstpsnonwnondnon_medic"])) then {
					if (time >= FAR_animDelay) then {FAR_healerStopped = true};
				};
			};
		};	
	}];
};

private _offset = [0,0,0]; 
private _dir = 0;
private _relpos = _healer worldToModel position _patient;

if((_relpos select 0) < 0) then{
	_offset=[-0.2,0.7,0]; 
	_dir=90;

} else {
	_offset=[0.2,0.7,0]; 
	_dir=270;

};
sleep 0.02;

if (isPlayer _healer) then {
	[_healer, _patient] call FUNC(medicEquipment);
};

_patient attachTo [_healer,_offset];
_patient setDir _dir;

private _time = time;

private _skill_factor = if ([_healer] call FUNC(isMedic)) then {
	40+(random 10);
} else {
	70+(random 10);
};

private _damage = (damage _patient * _skill_factor);
if (_damage < 25) then {_damage = 25};
sleep 1;

if (_patient getVariable ["FAR_isStabilized", 0] == 1) then {
	_patient setVariable ["FAR_isStabilized", 1, true];
};


/*		
	* Arguments:
	* 0: Total Time (in game "time" seconds) <NUMBER>
	* 1: Arguments, passed to condition, fail and finish <ARRAY>
	* 2: On Finish: Code called or STRING raised as event. <CODE, STRING>
	* 3: On Failure: Code called or STRING raised as event. <CODE, STRING>
	* 4: (Optional) Localized Title <STRING>
	* 5: Code to check each frame (Optional) <CODE>
	* 6: Exceptions for checking EFUNC(common,canInteractWith) (Optional)<ARRAY>
*/
hint str(_damage);
[
	_damage,
	[_healer, _patient],
	{
		(_this select 0) params ["_healer", "_patient"];

		private _isMedic = _healer call FUNC(isMedic);
		private _healed = switch (true) do {
			case (_isMedic && {(items _healer) find "Medikit" > -1}): {
				0.05
			};
			case (_isMedic && {(items _healer) find "FirstAidKit" >= 0}): {
				_healer removeItem "FirstAidKit";
				0.25
			};
			case (!_isMedic && {(items _healer) find "FirstAidKit" >= 0}): {
				_healer removeItem "FirstAidKit"; 
				_patient setHit ["hands", 0.9]; 
				0.4
			};
			default {
				_patient setHit ["legs", 0.4]; 
				_patient setHit ["hands", 0.9]; 
				0.6
			};
		};
				
		_patient setVariable ["FAR_isUnconscious", 0, true];
		_patient setVariable ["FAR_isDragged", 0, true];

		private _name1 = PLAYER_NAME(_patient);
		private _name2 = PLAYER_NAME(_healer);

		private _message = format [
			"%1 (%2) wurde von %3 (%4) wiederbelebt.", 
			_name1, 
			PLAYER_SIDE(_patient),
			_name2,
			PLAYER_SIDE(_healer)
		];

		// übergib Kategorie und Nachricht an log-FUnktion
		[QEGVAR(log,write), ["Revive", _message]] call CBA_fnc_serverEvent;
		
	},
	{
		(_this select 0) params ["_healer", "_patient"];

		if (!alive _patient) exitWith {
			[QEGVAR(gui,message), ["San-System", FAR_REVIVE_ACTION_REVIVE_PATIENT_DIED, "yellow"]] call CBA_fnc_localEvent;
		};
		if (!alive _healer) exitWith {
			_patient setVariable ["FAR_healer", objNull, true]
		};

		if (FAR_healerStopped) then {
			[QEGVAR(gui,message), ["San-System", FAR_REVIVE_ACTION_REVIVE_CANCLED, "red"]] call CBA_fnc_localEvent;

		};

	},
	format[FAR_REVIVE_ACTION_REVIVE_BAR_TEXT, _damage],
	{
        (_this select 0) params ["_healer", "_patient"];

		// solange Zeit nicht abgelaufen, 
		// beide am Leben, 
		// Abstand zu Patient kleiner 2m,
		// Heiler nicht bewusstlos und 
		// Animation nicht abgebrochen
		// -> aktualisiere Fortschrittsbalken
		alive _healer and
		alive _patient and
		(_healer distance _patient) < 2 and
		_healer getVariable "FAR_isUnconscious" == 0 and
		!FAR_healerStopped

	}
] call ace_common_fnc_progressBar;

if (isPlayer _healer) then {
	_healer removeEventHandler ["AnimChanged", _animChangeEVH]
};
detach _healer;
detach _patient;	

_healer playAction "medicStop";

[] call FUNC(clearGarbage);

true