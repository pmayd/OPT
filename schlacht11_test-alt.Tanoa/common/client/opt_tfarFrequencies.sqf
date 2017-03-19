/*
	Set radio frequencies

	Author: schmingo (OPT MOD Team)

	v2015-01-29| this script is part of OperationPandoraTrigger ArmA3 script collection
	
	/ changed by psycho
*/
private ["_enabled", "_frequenciesSW", "_frequenciesLR", "_encryption", "_hasSW", "_hasLR", "_radioSW", "_radioLR"];
if !(local player) exitWith {};

// _enabled 		= player call TFAR_fnc_isTeamSpeakPluginEnabled;
_frequenciesSW 	= ["101","102","103","104","105","106","107","108"];
_frequenciesLR 	= ["31","32","33","34","35","36","37","38","39"];


_encryption = switch (playerSide) do {
	case west: {"_bluefor"};
	case east: {"_opfor"};
	case resistance: {"_independent"};
	default {"_independent"};
};

// sleep 5;
//waitUntil {player call TFAR_fnc_isTeamSpeakPluginEnabled; sleep 4};


_hasLR = player call TFAR_fnc_haveLRRadio;
_hasSW = player call TFAR_fnc_haveSWRadio;

// Set frequencies for Sw Rradio
if (_hasSW) then {
	_radioSW = player call TFAR_fnc_activeSwRadio;
	_settingsSW = _radioSW call TFAR_fnc_getSwSettings;
	_settingsSW set [2, _frequenciesSW];
	_settingsSW set [4, _encryption];
	[_radioSW, _settingsSW] call TFAR_fnc_setSwSettings;
	//player sideChat "ShortRange Kanäle programmiert.";
};

// Set frequencies for Lr radio
if (_hasLR) then {
	_radioLR = player call TFAR_fnc_activeLrRadio;
	_settingsLR = _radioLR call TFAR_fnc_getLrSettings;
	_settingsLR set [2, _frequenciesLR];
	_settingsLR set [4, _encryption];
	[_radioLR select 0, _radioLR select 1, _settingsLR] call TFAR_fnc_setLrSettings;
	//player sideChat "LongRange Kanäle programmiert.";
};