diag_log format ["############################# %1 #############################", missionName];
#include "classDefinitions.hpp"

XGreyText = {"<t color='#f0bfbfbf'>" + _this + "</t>"};
XRedText = {"<t color='#f0ff0000'>" + _this + "</t>"};
XOrangeText = {"<t color='#F3B601'>" + _this + "</t>"};
XBlueText = {"<t color='#655EDE'>" + _this + "</t>"};
XTuerkiesText = {"<t color='#00D3BF'>" + _this + "</t>"};

OPT_Radar_raised = false;

if (isServer) then {
	EastPoints		= 0;
	publicVariable "EastPoints";
	WestPoints		= 0;
	publicVariable "WestPoints";
	
	addMissionEventHandler ["HandleDisconnect", {
		_unit = _this select 0;
		[_unit] spawn {_torso = _this select 0; sleep 5; deleteVehicle _torso;};
		false
	}];
};

if (isDedicated || !hasInterface) exitWith {};

("opt_HUD" call BIS_fnc_rscLayer) cutRsc ["opt_HudDisplay","PLAIN"];

// go trough missionConfig and add every file named "fn_draw3D.sqf" to mission EH from OPT space
_config = (missionConfigFile >> "CfgFunctions");
for "_i" from 0 to (count _config - 1) do { //module
    _moduleConfig = _config select _i;
    if ((configName _moduleConfig find "OPT") == 0) then {
        for "_j" from 0 to (count _moduleConfig - 1) do { //category
            _categoryConfig = _moduleConfig select _j;
            for "_k" from 0 to (count _categoryConfig - 1) do { //function
                _functionConfig = _categoryConfig select _k;
                if (configName _functionConfig == "draw3D") then {
                    call compile format ["
                        addMissionEventHandler ['Draw3D', {
                            _this call %1_fnc_%2;
                        }];
                    ", configName _moduleConfig, configName _functionConfig];
                };
            };
        };
    };
};