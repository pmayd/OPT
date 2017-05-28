#include "..\..\..\setup\setup.sqf"
#define GV2(obje,varname) (obje getVariable varname)
private ["_ar", "_wf", "_nt"];
_cf = diag_frameno;
if (_cf == xprevPFrame) exitWith {};
xprevPFrame = _cf;
if (count perframe_array > 0) then {
	{
		_ar = GV2(perframe_store,_x);
		if (isNil "_ar") then {_ar = []};
		if (count _ar > 0) then {
			_wf = _ar select 1;
			if (_wf == 0) then {
				call (_ar select 0);
			} else {
				_nt = _ar select 2;
				if (time >= _nt) then {
					call (_ar select 0);
					_ar set [2, time + (_ar select 1)];
				};
			};
		};
	} forEach perframe_array;
};