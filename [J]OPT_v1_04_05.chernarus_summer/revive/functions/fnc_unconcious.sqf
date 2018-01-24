/**
* Author: James
* make unit unconscious
*
* Arguments:
* 0: <OBJECT> unit that was hit
* 1: <OBJECT> instigator/killer of unit
*
* Return Value:
* None
*
* Example:
* [player, killer] call fnc_unconscious.sqf;
*
*/
#include "script_component.hpp"

params ["_unit", "_killer"];

if (_unit getVariable ["FAR_isUnconscious", 0] == 1) exitWith {};

if (isPlayer _unit) then {
	disableUserInput true;
};

[] spawn FUNC(reviveCamera);

// mute TFAR
[false] call FUNC(toggleTFAR);
	
// create marker
if (FAR_downMarker) then {
	[QGVAR(createMarker), [_unit]] call CBA_fnc_globalEvent;
};

// Death message
if (FAR_EnableDeathMessages) then {
	_name = [_unit, _killer] call FUNC(showKiller);
	if (_name != "") then {
		[_name] spawn {
			if (FAR_deathMassageIsShown) exitWith {};
			FAR_deathMassageIsShown = true;
			sleep 3.5;
			_txt = format ["%1",(_this select 0)];
			_print = [
				["verwundet durch:","align = 'right' size = '0.8'","#f0bfbfbf"],				// grey
				["","<br/>"],
				[_txt, "align = 'right' size = '1.2' font='PuristaBold'","#f07f7f00"]	// yellow
			];
			[_print, safezoneX, 0.95] spawn BIS_fnc_typeText2;
			FAR_deathMassageIsShown = false;
		};
	};
};
	
// Eject unit if inside vehicle
if (vehicle _unit != _unit) then {
	unAssignVehicle _unit;
	_unit action ["GetOut", vehicle _unit];
	sleep 2;
};

_unit setDamage 0;
_unit setVelocity [0,0,0];
_unit allowDamage false;
//_unit playMove "AinjPpneMstpSnonWrflDnon_rolltoback";
//_unit playActionNow "Down"; // verursacht ragdoll problem -> Stehaufmännchen
_unit setUnconscious true;

// time for animation
sleep 4;
//_unit switchMove "AinjPpneMstpSnonWrflDnon";
_unit enableSimulation false;
_unit setVariable ["FAR_isUnconscious", 1, true];

_bleedOut = time + FAR_BleedOut;

// fix the key binding after respawn/revive
disableUserInput false;
disableUserInput true;
disableUserInput false;

while {!isNull _unit && {alive _unit} && {_unit getVariable "FAR_isUnconscious" == 1} && {_unit getVariable "FAR_isStabilized" == 0} && {(FAR_BleedOut <= 0 || time < _bleedOut)}} do {
	if (FAR_checkNearbyMedics) then {
		hintSilent format["Ausgeblutet in %1 Sekunden\n\n%2", round (_bleedOut - time), [] call FUNC(checkForNearbyMedics)];
	};
	FAR_bleedoutMessage = format ["Ausgeblutet in %1 Sekunden", round (_bleedOut - time)];
	FAR_bleedoutTimer = round (_bleedOut - time);
	sleep 0.5;
};

if (_unit getVariable ["FAR_isStabilized", 1] == 1) then {
	//Unit has been stabilized. Disregard bleedout timer and unmute player
	//[true] call opt_addons_fnc_toggleTFAR; // Funk im stabilisierten Zustand möglich!
			
	while {!isNull _unit && {alive _unit} && {_unit getVariable "FAR_isUnconscious" == 1}} do {
		if (FAR_checkNearbyMedics) then {
			hintSilent format ["Du wurdest stabilisiert\n\n%1", call FUNC(checkForNearbyMedics)]
		};
		FAR_bleedoutMessage = "Stabilisiert";
		FAR_bleedoutTimer = FAR_BleedOut;
		sleep 0.5;
	};
};

// Player bled out
if (FAR_BleedOut > 0 && {time > _bleedOut} && {_unit getVariable ["FAR_isStabilized",0] == 0}) then {
	//["tfar_removeMapMarker", _unit] call tcb_fnc_NetCallEvent;
	_unit setDamage 1; // sofortiger Tod -> schließt Dialog automatisch?!
	disableUserInput false;
	_unit allowDamage true;
} else {
	// Player got revived
	_unit setVariable ["FAR_isStabilized", 0, true];
	// remove down marker
	[QGVAR(removeMarker), [_unit]] call CBA_fnc_globalEvent;
	sleep 3;
	
	// Clear the "medic nearby" hint
	hintSilent "";

	// Unmute TFAR
	[true] call FUNC(toggleTFAR);
	
	_unit enableSimulation true;
	_unit allowDamage true;
	_unit setDamage 0.6;
	_unit setFatigue 0.9;
	//_unit playMove "amovppnemstpsraswrfldnon";
	//_unit playMove "";
	_unit setUnconscious false;

	if (dialog) then {
		[] spawn {
			while {dialog} do {
				closeDialog 5566;
				closeDialog 5651;
				closeDialog 0;
			};
		};
	};
};

FAR_unconsciousHandler = nil;

true