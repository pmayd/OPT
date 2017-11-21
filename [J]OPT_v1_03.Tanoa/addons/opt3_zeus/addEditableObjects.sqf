params ["_player"];

{
    _x addCuratorEditableObjects [[_player] - [zeus_ziv1, zeus_ziv2, zeus_ziv3], false];
} forEach [zeus_ziv1, zeus_ziv2, zeus_ziv3];