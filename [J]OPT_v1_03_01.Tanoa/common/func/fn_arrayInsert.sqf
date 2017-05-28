// function by Killzone Kid

/* Example
arr = [1,2,3,4];
[arr, ["a","b"], 2] call tcb_fnc_insert; //[1,2,"a","b",3,4]
*/

private ["_arr", "_i", "_res"];
_arr = _this select 0;
_i = _this select 2;

_res = [];
_res append (_arr select [0, _i]);
_res append (_this select 1);
_res append (_arr select [_i, count _arr - _i]);

_res