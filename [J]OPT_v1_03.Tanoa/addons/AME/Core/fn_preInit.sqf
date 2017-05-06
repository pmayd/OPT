removeAllMissionEventHandlers "Draw3D";

true spawn {
    "AME_Core_remoteFnc" addPublicVariableEventHandler {
        (_this select 1) call AME_Core_fnc_execRemoteFnc;
    };  
};

if (isDedicated || !hasInterface) exitWith {};


// go trough missionConfig and add every file named "fn_draw3D.sqf" to mission EH from AME space
_config = (missionConfigFile >> "CfgFunctions");
for "_i" from 0 to (count _config - 1) do { //module
    _moduleConfig = _config select _i;
    if ((configName _moduleConfig find "AME") == 0) then {
        for "_j" from 0 to (count _moduleConfig - 1) do { //category
            _categoryConfig = _moduleConfig select _j;
            for "_k" from 0 to (count _categoryConfig - 1) do { //function
                _functionConfig = _categoryConfig select _k;
                if (configName _functionConfig == "draw3D") then {
                    call compile format ["
                        addMissionEventHandler [""Draw3D"", {
                            _this call %1_fnc_%2;
                        }];
                    ", configName _moduleConfig, configName _functionConfig];
                };
            };
        };
    };
};

call AME_Core_fnc_initEvents;

AME_Core_Interaction_Actions = [];
AME_Core_keyDownEvents = [];