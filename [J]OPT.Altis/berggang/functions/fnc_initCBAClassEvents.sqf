/**
* Author: James
* initialize CBA class EH
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_initCBAClassEvents.sqf;
*
*/
#include "script_component.hpp"

private _condition = format
[
	"((driver _target) == _this) and 
    (isEngineOn _target) and 
    ((speed _target) > 0) and 
    ((speed _target) < 20) and 
    (vectorDir _target) select 2 > %1 and
	!([_target] call %2)",
	GVAR(minGradient),
	QFUNC(hasDamagedTrackOrWheel)
];

[
	"LandVehicle", 
	"init", 
	{
    
		params ["_vec"];

		_vec addAction
		[
			"<t color='#800040'>Berggang einlegen</t>",
			{
				params ["_target", "_caller", "_actionId", "_arguments"];
				[_target, _caller] spawn FUNC(speedUp);
			},
			[],
			0,
			false,
			true,
			"",
			_condition,
			5
		];
    },
	nil, 
	nil, 
	true
] call CBA_fnc_addClassEventHandler;