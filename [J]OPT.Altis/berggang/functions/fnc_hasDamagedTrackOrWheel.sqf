/**
* Description:
* check if vehicle has damaged tracks or wheels (above allowed damage in settings)
* 
* Author: 
* James
*
* Arguments:
* 0: <OBJECT> vehicle
*
* Return Value:
* <BOOLEAN> true - vehicle is damaged beyond threshold, false - otherwise
*
* Server only:
* no
*
* Public:
* yes
*
* Global:
* no
*
* Sideeffects:
* no

* Example:
* [vehicle player] call EFUNC(berggang,hasDamagedTrackOrWheel);
*
*/
#include "script_component.hpp"

/* PARAMS */
params 
[
	["_vehicle", objNull, [objNull], 1]
];

/* VALIDATION */
private _return = false;
if (_vehicle isEqualTo objNull) exitWith{_return};

/* CODE BODY */
private _allHitpoints = getAllHitPointsDamage _vehicle;

// filter only hitpoints with damage
// if track or wheel, exit with true
{
	_hitPoint = tolower (_allHitpoints select 0 select _forEachIndex);

	if 
	(
		(
			_hitPoint find "track" != -1 or 
			_hitPoint find "wheel" != -1
		) and
		_x > GVAR(maxDamageToTracksOrWheels)
	) exitWith{_return = true};
		
} forEach ((_allHitpoints select 2) select {_x > 0}) ;

_return
