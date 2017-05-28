#include "..\..\..\setup\setup.sqf"
private ["_ap","_as"];
if (isNil "opt_p_entities") then {opt_p_entities = []};

if (count opt_p_entities > 0) then {
	{
		_ap = __getMNsVar2((_x select 0));
		_as = _x select 0;
		if (!isNil "_ap" && {alive _ap} && {isPlayer _ap} && {side _ap == playerSide}) then {
			_strenght = _ap call tcb_fnc_checkGroupPower;
			_as setMarkerAlphaLocal _strenght;
			_as setMarkerPosLocal getPosASL _ap;
			_mt = [_x, 1, ""] call BIS_fnc_param;
			_as setMarkerTextLocal _mt;
			_mty = [_x, 2, "b_inf"] call BIS_fnc_param;
			_as setMarkerTypeLocal _mty;
			//_as setMarkerDirLocal (direction (vehicle _ap));
			_as setMarkerDirLocal 0;
		} else {
			_as setMarkerPosLocal [0,0];
			_as setMarkerTextLocal "";
			_as setMarkerAlphaLocal 0;
		};
	} forEach opt_p_entities;
};

true