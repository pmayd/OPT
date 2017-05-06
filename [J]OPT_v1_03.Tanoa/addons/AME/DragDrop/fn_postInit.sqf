if (isDedicated || !hasInterface) exitWith {};

[
    "Drop" call XGreyText,
    player,
    0,
    "!(isNull (player getVariable ['AME_DragDrop_Item', objNull]))",
    {
        _draggedObject = player getVariable ["AME_DragDrop_Item", objNull];

        player playAction "released";

        if (isNull _draggedObject) exitWith {};

        player setVariable ["AME_DragDrop_Item", objNull, true];
        _draggedObject setVariable ["AME_DragDrop_Player", objNull, true];

        detach _draggedObject;
        player forceWalk false;
        _draggedObject setDamage (damage _draggedObject);

        _position = getPosATL _draggedObject;
        if (_position select 2 < 0) then {
            _position set [2, 0];
            _draggedObject setPosATL _position;
        };
    }
] call AME_Core_fnc_Interaction_addAction;