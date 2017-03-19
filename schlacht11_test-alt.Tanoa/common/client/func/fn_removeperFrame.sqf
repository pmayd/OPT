#include "../../../setup.sqf"
private "_name";
_name = _this select 0;
_name = toLower _name;
perframe_store setVariable [_name, nil];
perframe_array = perframe_array - [_name];