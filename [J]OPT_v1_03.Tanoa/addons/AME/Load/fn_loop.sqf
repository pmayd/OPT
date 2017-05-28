_lastTarget = cursorTarget;

if (_lastTarget isKindOf "Car" || _lastTarget isKindOf "Helicopter") then {
    _loadedItems = _lastTarget getVariable ["AME_Load_loadedObjects", []];
    {
        _itemName = getText (configFile >> "CfgVehicles" >> typeOf _x >> "displayName");
        [
            ("Unload " + _itemName) call XOrangeText,
            _lastTarget,
            5,
            "isNull objectParent player && {[_target, """ + (netId _x) + """] call AME_Load_fnc_isLoaded} && {alive _target}",
            {
                _vehicle = _this select 0;
                _item = _this select 3;

                _position = (getPosATL player) findEmptyPosition [1, 12, typeOf _item];
                if (count _position == 0) exitWith {["Not enough space to unload here" call XRedText] call OPT_Core_fnc_dynamicText};

                [
                    "Unloading",
                    8,
                    {
                        _vehicle = _this select 0;
                        _item = _this select 1;
                        _position = _this select 2;

						if (player distance2D _vehicle > 10) exitWith {
							["Fahrzeug zu weit entfernt" call XRedText] call OPT_Core_fnc_dynamicText;
						};
						
                        _loadedItems = _vehicle getVariable ["AME_Load_loadedObjects", []];
                        _loadedItems = _loadedItems - [_item];

                        _vehicle setVariable ["AME_Load_loadedObjects", _loadedItems, true];

                        player allowDamage false;
                        detach _item;
                        _item enableSimulationGlobal true;
						[_item, false] remoteExec ["hideObjectGlobal", 2, false];
                        
                        _position set [2, (_position select 2) + 1];
                        _item setPosATL _position;

                        player reveal _item;
                        player allowDamage true;
						
						
						if (!(_item isKindOf 'Slingload_base_F') && {isNull (player getVariable ['AME_DragDrop_Item', objNull])} && {isNull (_item getVariable ['AME_DragDrop_Player', objNull])}) then {
							player setVariable ["AME_DragDrop_Item", _item, true];
							_item setVariable ["AME_DragDrop_Player", player, true];

							player playActionNow "grabDrag";
							waitUntil {animationState player in ["amovpercmstpslowwrfldnon_acinpknlmwlkslowwrfldb_2", "amovpercmstpsraswpstdnon_acinpknlmwlksnonwpstdb_2", "amovpercmstpsnonwnondnon_acinpknlmwlksnonwnondb_2", "acinpknlmstpsraswrfldnon", "acinpknlmstpsnonwpstdnon", "acinpknlmstpsnonwnondnon"]};

							_attachPoint = [0, 1.3, ((_item modelToWorld [0,0,0]) select 2) - ((player modelToWorld [0,0,0]) select 2)];
							_item attachTo [player, _attachPoint];
						};
						

                        _itemName = getText (configFile >> "CfgVehicles" >> typeOf _item >> "displayName");
                        _vehicleName = getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName");
						[("Unloaded " + _itemName + " out of " + _vehicleName)] call OPT_Core_fnc_dynamicText;
                    },
                    [_vehicle, _item, _position]
                ] call AME_Core_fnc_Progress_showBar;
            },
            _x
        ] call AME_Core_fnc_Interaction_addAction;
    } count _loadedItems;
};

if ((_lastTarget isKindOf "StaticWeapon" || _lastTarget isKindOf "ReammoBox_F") && {(OPT_all_container find _lastTarget) <= -1} && {player distance _lastTarget < 3}) then {
	_vehicles = _lastTarget nearEntities [["Car", "Helicopter"], 10];
    {
        _vehicleName = getText (configFile >> "CfgVehicles" >> typeOf _x >> "displayName");
        [
            ("Load in " + _vehicleName) call XOrangeText,
            _lastTarget,
            5,
            "isNull objectParent player && {isNull (_target getVariable [""AME_DragDrop_Player"", objNull])}",
            {
                _item = _this select 0;
                _vehicle = _this select 3;

                [
                    "Loading in",
                    8,
                    {
                        _item = _this select 0;
                        _vehicle = _this select 1;

						if (damage _vehicle > 0.7) exitWith {
							["Fahrzeug zu stark beschädigt" call XRedText] call OPT_Core_fnc_dynamicText;
                        };
						
						if (player distance2D _vehicle > 10) exitWith {
							["Fahrzeug zu weit entfernt" call XRedText] call OPT_Core_fnc_dynamicText;
						};
						
                        if (!([_item, netId _vehicle] call AME_Load_fnc_canLoad)) exitWith {
							["Frachtraum voll" call XRedText] call OPT_Core_fnc_dynamicText;
                        };

                        _loadedItems = _vehicle getVariable ["AME_Load_loadedObjects", []];
                        _loadedItems pushBack _item;

                        _vehicle setVariable ["AME_Load_loadedObjects", _loadedItems, true];

                        _item attachTo [AME_Load_Anchor, [0,0,0], ""];
                        _item enableSimulationGlobal false;
						[_item, true] remoteExec ["hideObjectGlobal", 2, false];

                        _itemName = getText (configFile >> "CfgVehicles" >> typeOf _item >> "displayName");
                        _vehicleName = getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName");

						[("Loaded " + _itemName + " in " + _vehicleName)] call OPT_Core_fnc_dynamicText;
                    },
                    [_item, _vehicle]
                ] call AME_Core_fnc_Progress_showBar;
            },
            _x
        ] call AME_Core_fnc_Interaction_addAction;
    } count _vehicles;
};

waitUntil {!isNull cursorTarget && {cursorTarget != _lastTarget}};
true spawn AME_Load_fnc_loop;