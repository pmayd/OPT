if (isDedicated || !hasInterface) exitWith {};

[
    "Drag" call XGreyText,
    ["StaticWeapon", "ReammoBox_F"],
    2,
    "!(_target isKindOf 'Slingload_base_F') &&
	{isNull (player getVariable ['AME_DragDrop_Item', objNull])} &&
	{isNull (_target getVariable ['AME_DragDrop_Player', objNull])}",
    {
        _draggedObject = _this select 0;

        if (_draggedObject isKindOf "StaticWeapon") then {
            _gunner = gunner _draggedObject;
            if (!isNull _gunner && {alive _gunner}) then {
                _gunner setPosASL getPosASL _gunner;
            };
        };

        player setVariable ["AME_DragDrop_Item", _draggedObject, true];
        _draggedObject setVariable ["AME_DragDrop_Player", player, true];

        player playActionNow "grabDrag";
        waitUntil {animationState player in ["amovpercmstpslowwrfldnon_acinpknlmwlkslowwrfldb_2", "amovpercmstpsraswpstdnon_acinpknlmwlksnonwpstdb_2", "amovpercmstpsnonwnondnon_acinpknlmwlksnonwnondb_2", "acinpknlmstpsraswrfldnon", "acinpknlmstpsnonwpstdnon", "acinpknlmstpsnonwnondnon"]};

        _attachPoint = [0, 1.3, ((_draggedObject modelToWorld [0,0,0]) select 2) - ((player modelToWorld [0,0,0]) select 2)];
        _draggedObject attachTo [player, _attachPoint];
    }
] call AME_Core_fnc_Interaction_addAction;