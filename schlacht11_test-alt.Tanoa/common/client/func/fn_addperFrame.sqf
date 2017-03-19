#include "../../../setup.sqf"
#define GV2(obje,varname) (obje getVariable varname)
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
perframe_array pushBack _name;