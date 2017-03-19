#include "../../../setup.sqf"
private ["_v", "_type", "_dir", "_pos", "_vel", "_dv"];
_v = _this select 0;
_type = typeOf _v;
_dir = direction _v;
_pos = position _v;
_vel = velocity _v;
{deleteVehicle _x} forEach ([_v] + crew _v);
_dv = createVehicle [_type, _pos, [], 0, "CAN_COLLIDE"];
_dv setDir _dir;
_dv setPos _pos;
_dv setVelocity _vel;
_dv setFuel 0;
_dv setDamage 1;
_dv setVariable ["ai_ddeadt", diag_tickTime];
__addDead(_dv)