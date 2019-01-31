/**
* Description:
* open parachute whenever player ejects from an air vehicle that is at least GVAR(minHeight) above ground
*
* Author:
* James
*
* Arguments:
* 0: <OBJECT> unit
* 1: <OBJECT> vehicle
*
* Return Value:
* None
*
* Server only:
* no
*
* Public:
* no - should be called only by GetOutMan EH
*
* Global:
* no
*
* Sideeffects:
* atach parachute to unit
* delete parachute after landing
*
* Example:
* [player, heli] call EFUNC(autoparachute,openParachute);
*/
#include "script_component.hpp"

/* PARAMS */
params
[
   ["_unit", objNull, [objNull], 1],
   ["_vec", objNull, [objNull], 1]
];

/* VALIDATION */
if (_unit isEqualTo objNull or _vec isEqualTo objNull) exitWith{};
if !(_vec isKindOf "Air") exitWith{};
private _isWater = surfaceIsWater position _vec;
private _pos =  [getPosATL _unit, getPosASLW _unit] select _isWater;
if (_pos select 2 < GVAR(minHeight)) exitWith{};
if (vehicle player != player) exitWith{};

/* CODE BODY */
// use different getPos commands depending on surface type
[
    GVAR(openingTime),
    [_unit, _isWater],
    {
        (_this select 0) params ["_unit", "_isWater"];

        private _parachute = createVehicle ["Steerable_Parachute_F", [0,0,0], [], 0, "FLY"];
        private _pos =  [getPosATL _unit, getPosASLW _unit] select _isWater;
        [_parachute setPosATL _pos, parachute setPosASLW _pos] select _isWater;

        _unit moveinDriver _parachute;

        [_parachute] spawn 
        {
            params ["_parachute"];
            waitUntil {driver _parachute isEqualTo objNull};
            deleteVehicle _parachute;
        }

    },
    {
        ["Fallschirm", AUTOPARACHUTE_OPEN_PARACHUTE_CANCLE, "red"] call EFUNC(gui,message);
    },
    AUTOPARACHUTE_OPEN_PARACHUTE_PROGRESS_BAR_TXT,
    {
        (_this select 0) params ["_unit", "_pos", "_isWater"];

        alive _unit
    }
] call ace_common_fnc_progressBar;