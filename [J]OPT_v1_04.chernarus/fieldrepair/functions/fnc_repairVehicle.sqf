/**
* Author: James
* field repair of a vehicle
*
* Arguments:
* 0: <OBJECT> vehicle to repair
*
* Return Value:
* None
*
* Example:
* [vehicle] call fnc_repairVehicle.sqf;
*
*/
#include "script_component.hpp"

params [["_veh", objNull]];

if (_veh isEqualTo objNull) exitWith {false};

// if another action is ongoing
if (GVAR(mutexAction)) exitWith {
	[QEGVAR(gui,message), ["Feldreparatur", STR_ANOTHER_ACTION, "yellow"]] call CBA_fnc_localEvent;
};

// if conditions are not met
if (not alive player or (player distance _veh) > 7 or (vehicle player != player) or speed _veh > 3) exitWith {
	[QEGVAR(gui,message), ["Feldreparatur", STR_REPAIR_CONDITIONS, "red"]] call CBA_fnc_localEvent;
};

// if player has no tool kit or vehicle was repaired more often than free repair
private _hasTK = [_veh] call FUNC(hasTK);
if !(_hasTK) exitWith {
	[QEGVAR(gui,message), ["Feldreparatur", STR_NEED_TOOLKIT, "red"]] call CBA_fnc_localEvent;
};

GVAR(mutexAction) = true;

player selectWeapon primaryWeapon player;	// psycho, animation only able to play while primary weapon is in use
sleep 1;
private _lastPlayerState = animationState player;

// player playActionNow "medicStartRightSide";
player playMove "Acts_carFixingWheel";
sleep 0.5;
private _maxlength = _veh getVariable [QGVAR(longrepair), [_veh] call FUNC(getPartsRepairTime)];
private _vehname = getText ( configFile >> "CfgVehicles" >> typeOf(_veh) >> "displayName");

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
[
	_maxlength,
	[_veh],
	{
		(_this select 0) params ["_veh"];

		player switchMove "";
		[QEGVAR(gui,message), ["Feldreparatur", STR_REPAIR_FINISHED, "green"]] call CBA_fnc_localEvent;

		[_veh] remoteExec [QFUNC(partRepair), _veh, false]; // called where vehicle is local!

		//if (_hastk == 1) then {player removeItem "ToolKit";};
		if (itemCargo _veh find "ToolKit" != -1) then { 
			["ToolKit", _veh] call FUNC(removeItemFromCargo);
		};
		_veh setVariable [QGVAR(longRepairTimes), (_veh getVariable [QGVAR(longRepairTimes), 0]) + 1 , true ];
		
	},
	{
		[QEGVAR(gui,message), ["Feldreparatur", STR_REPAIR_INTERRUPTED, "red"]] call CBA_fnc_localEvent;
	},
	format[STR_REPAIR_MSG_STRING, _maxlength, _vehname],
	{
		(_this select 0) params ["_veh"];
		alive player and (player distance _veh) < 7 and 
		player getVariable ["FAR_isUnconscious", 0] == 0 and // behebt Fehler, dass bewusstlose Soldaten weiter reparieren // TODO:
		isNull objectParent player and 
		speed _veh < 3
	}
] call ace_common_fnc_progressBar;

GVAR(mutexAction) = false; 

true