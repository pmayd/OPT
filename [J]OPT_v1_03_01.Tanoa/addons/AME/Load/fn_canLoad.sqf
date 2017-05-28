_object = _this select 0;
_vehicle = objectFromNetId (_this select 1);

_cargo = 0;
if (_vehicle isKindOf "Car") then {
    _cargo = 1;
};
if (_vehicle isKindOf "Truck_F" || _vehicle isKindOf "Helicopter") then {
    _cargo = 2;
};
if (_vehicle isKindOf "Heli_Transport_02_base_F" || _vehicle isKindOf "Heli_Transport_03_base_F" || _vehicle isKindOf "Heli_Transport_04_base_F" || _vehicle isKindOf "O_T_VTOL_02_infantry_F" || _vehicle isKindOf "O_T_VTOL_02_vehicle_F" || _vehicle isKindOf "B_T_VTOL_01_vehicle_F" || _vehicle isKindOf "B_T_VTOL_01_infantry_F") then {
    _cargo = 4;
};

_loadedItems = _vehicle getVariable ["AME_Load_loadedObjects", []];
count _loadedItems < _cargo