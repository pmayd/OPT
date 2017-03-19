// by Xeno
#include "../../../setup.sqf"
#define GV2(obje,varname) (obje getVariable varname)

perframe_store = "Land_HelipadEmpty_F" createVehicleLocal [0,0,0];
perframe_array = [];

xfaddPerFrame = {
	private ["_name", "_code", "_time", "_ar"];
	_name = _this select 0;
	_code = _this select 1;
	_time = _this select 2; //_time = 0 = every frame
	_name = toLower _name;
	_ar = GV2(perframe_store,_name);
	if (isNil "_ar") then {_ar = []}; // workaround for getVariable default bug
	_ar set [0, _code];
	_ar set [1, _time];
	_ar set [2, 0];
	perframe_store setVariable [_name, _ar];
	perframe_array set [count perframe_array, _name];
};

xfremovePerFrame = {
	private "_name";
	_name = _this select 0;
	_name = toLower _name;
	perframe_store setVariable [_name, nil];
	perframe_array = perframe_array - [_name];
};

xfperFrame = {
	private ["_ar", "_wf", "_nt"];
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
};
_layer = "tcbFrameLayer" call BIS_fnc_rscLayer;
_layer cutRsc ["FrameHandlerRsc","PLAIN"];