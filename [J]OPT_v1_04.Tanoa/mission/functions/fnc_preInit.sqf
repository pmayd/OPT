#include "script_component.hpp"

LOG_1("############################# %1 #############################",missionName);

XGreyText = {"<t color='#f0bfbfbf'>" + _this + "</t>"};
XRedText = {"<t color='#f0ff0000'>" + _this + "</t>"};
XOrangeText = {"<t color='#F3B601'>" + _this + "</t>"};
XBlueText = {"<t color='#655EDE'>" + _this + "</t>"};
XTuerkiesText = {"<t color='#00D3BF'>" + _this + "</t>"};

opt_allow_movement = false; // globale Variable, muss jeder haben zu beginn
missionStarted = false;

// Startparameter auslesen und als globale Variablen verfügbar machen
// By James: moderner Ansatz ohne 20 Zeilen Code
// Das Spiel liest bereits alle Parameter aus und speichert sie in "BIS_fnc_storeParamsValues_data"
// 1. Namen aller Parameter
// 2. führe globale Variable mit diesem Namen ein
if (!isServer) exitWith{};
_paramNames = ("true" configClasses (getMissionConfig "Params")) apply {configName _x};
{	
	missionNamespace setVariable [_x, [_x] call BIS_fnc_getParamValue, true];
} forEach _paramNames;

LOG_1("%1 --- preInit.sqf is processed",diag_ticktime);