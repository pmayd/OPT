for "_i" from 0 to (count paramsArray - 1) do {
	_paramval = paramsArray select _i;
	if (_paramval != -99999) then {
		missionNamespace setVariable [configName ((missionConfigFile/"Params") select _i), _paramval];
	};
};

if (isServer) then {
	if (OPT_TRAINING > 0) then {
		opt_west_budget = 99999999;
		opt_east_budget = 99999999;
	} else {
		opt_west_budget = 3000000;		// Schlacht Budget Nato
		opt_east_budget = 2800000;		// Schlacht Budget Csat
	};
	publicVariable "opt_west_budget";
	publicVariable "opt_east_budget";
	
	OPT_vehicle_marker_storage = [];
	publicVariable "OPT_vehicle_marker_storage";
	
	0 spawn {
		waitUntil {time > 0};
		opt_missionStartTime = serverTime;
		opt_missionWeaponFreezeOverTime = opt_missionStartTime + OPT_TRUCETIME;
		opt_missionGameOverTime = opt_missionStartTime + OPT_PLAYTIME;
		
		opt_timeArray = [opt_missionStartTime, opt_missionWeaponFreezeOverTime, opt_missionGameOverTime];
		publicVariable "opt_timeArray";
	};
};

if (isDedicated || !hasInterface) exitWith {};

_config = (missionConfigFile >> "CfgFunctions");
for "_i" from 0 to (count _config - 1) do { //module
    _moduleConfig = _config select _i;
    if ((configName _moduleConfig find "OPT") == 0) then {
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


// This is needed to provide a player object for zeus controlled units. Important to ensure that player is not null here (which is done in autoload).
OPT_Core_realPlayer = player;
[{
    // There is no command to get the current player but BI has an variable in mission namespace we can use.
	_currentPlayer = missionNameSpace getVariable ["bis_fnc_moduleRemoteControl_unit", player];	// Psycho: isNull until a unit is remote controlled
    
    // If the player changed we trigger an event and update the global variable.
    if (OPT_Core_realPlayer != _currentPlayer) then {
        ["playerChanged", [_currentPlayer, OPT_Core_realPlayer]] call AME_Core_fnc_triggerEvent;
        OPT_Core_realPlayer = _currentPlayer;
    };
}] call AME_Core_fnc_onEachFrame;


call OPT_Core_fnc_briefing;

0 spawn {
	waitUntil {time > 0};
	[] call OPT_Core_fnc_playerRespawn;
//	call OPT_Core_fnc_Intro;				intro rausmachen?!

	if (OPT_TEAMBALANCE > 0 && OPT_TRAINING isEqualTo 0) then {
		_en_pa = if (playerSide == blufor) then {playersNumber opfor} else {playersNumber blufor};
		if ((playersNumber playerSide) > (_en_pa + OPT_TEAMBALANCE)) then {
			endMission (switch (playerSide) do {
				case (blufor) : {"balanceBLUFOR"};
				case (opfor) : {"balanceOPFOR"};
				default {"LOSER"};
			});
		};
	};
};

opt_killcam_quotes = [];
for "_i" from 1 to 42 do {
    opt_killcam_quotes pushBack [(localize format["STR_QUOTE_%1",_i]),(localize format["STR_AUTHOR_%1",_i])];
};