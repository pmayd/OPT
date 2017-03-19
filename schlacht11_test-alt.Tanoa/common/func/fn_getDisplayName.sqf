private ["_obj_name", "_obj_kind", "_cfg"];

_obj_name = _this select 0;
_obj_kind = _this select 1;
_cfg = switch (_obj_kind) do {case 0: {"CfgVehicles"};case 1: {"CfgWeapons"};case 2: {"CfgMagazines"};};

getText (configFile >> _cfg >> _obj_name >> "displayName")