if (isDedicated || !hasInterface) exitWith {};

_config = (missionConfigFile >> "CfgFunctions");
for "_i" from 0 to (count _config - 1) do { //module
    _moduleConfig = _config select _i;
    if ((configName _moduleConfig find "AME") == 0) then {
        for "_j" from 0 to (count _moduleConfig - 1) do { //category
            _categoryConfig = _moduleConfig select _j;
            for "_k" from 0 to (count _categoryConfig - 1) do { //function
                _functionConfig = _categoryConfig select _k;
                if ((configName _functionConfig find "player") == 0) then {
                    _charArray = toArray (configName _functionConfig);
                    reverse _charArray;
                    _charArray resize (count _charArray - 6);
                    reverse _charArray;
                    _eventName = toString _charArray;
                    diag_log format ["Bound %2_fnc_%3 to player %1", _eventName, configName _moduleConfig, configName _functionConfig];
                    call compile format ["
                        player addEventHandler [""%1"", {
                            _this call %2_fnc_%3;
                        }];
                    ", _eventName, configName _moduleConfig, configName _functionConfig];
                };
            };
        };
    };
};

true spawn {
    waitUntil {!isNull (findDisplay 46)};
    (findDisplay 46) displayAddEventHandler ["KeyDown", {
        _dikCode = _this select 1;
        _shift = _this select 2;
        _ctrlKey = _this select 3;
        _alt = _this select 4;
        
        _return = false;
        
        if (!_shift && !_ctrlKey && !_alt) then {
            {
                _boundDikCode = _x select 0;
                _code = _x select 1;
                _spawn = if (count _x > 2) then {_x select 2} else {false};
                
                if (_boundDikCode == _dikCode) exitWith {
                    if (_spawn) then {
                        _this spawn _code;
                        _return = true;
                    } else {
                        _return = _this call _code;
                    };
                };
            } count AME_Core_keyDownEvents;
        };
    
        _return
    }];
};

true call AME_Core_fnc_Interaction_loop;