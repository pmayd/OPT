
// _position = switch (side player) do {
// 				case west: {getPos "Bonus_NATO"};
// 				case east: {getPos "Bonus_CSAT"};
private ["_position", "_bonusVehicle", "_BonusMarker", "_Bonus"];

_position = getPos Bonus_NATO;

_bonusVehicle = "I_MBT_03_cannon_F";


_BonusMarker = createMarker ["BonusMarker", _position];
_BonusMarker setMarkerType "Empty";
_BonusMarker setMarkerShape "ELLIPSE";
_BonusMarker setMarkerAlpha 0;
_BonusMarker setMarkerSize [1000,1000];

_Bonus = createVehicle [_bonusVehicle, getMarkerPos _BonusMarker, [], 1000, "NONE"];