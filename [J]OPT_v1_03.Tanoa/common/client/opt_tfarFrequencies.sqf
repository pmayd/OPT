/*
	Set radio frequencies

	Author: schmingo (OPT MOD Team)

	v2015-01-29| this script is part of OperationPandoraTrigger ArmA3 script collection
	
	/ changed by psycho
*/
if !(local player) exitWith {};

// _enabled 		= player call TFAR_fnc_isTeamSpeakPluginEnabled;
private _frequenciesSW 	= ["41","42","43","51","52","53","61","62","63"];
private _frequenciesLR 	= ["30","40","50","60","70","80"];

// frequencies can never be intercepted by inf
private _encryption = switch (playerSide) do {
	case west: {"_bluefor"};
	case east: {"_opfor"};
	case resistance: {"_independent"};
	default {"_independent"};
};

// look for prototype radios in player inventory and wait till replacement
waitUntil {!isNil {(call TFAR_fnc_ActiveSwRadio) call TFAR_fnc_getSwFrequency;}};
private _hasLR = player call TFAR_fnc_haveLRRadio;
private _hasSW = player call TFAR_fnc_haveSWRadio;

// Set frequencies for Sw Rradio
if (_hasSW) then {
	private _radioSW = player call TFAR_fnc_activeSwRadio;
	private _settingsSW = _radioSW call TFAR_fnc_getSwSettings;
	_settingsSW set [2, _frequenciesSW];
	_settingsSW set [4, _encryption];
	[_radioSW, _settingsSW] call TFAR_fnc_setSwSettings;
	//player sideChat "ShortRange Kanäle programmiert.";
};

// Set frequencies for Lr radio
if (_hasLR) then {
	private _radioLR = player call TFAR_fnc_activeLrRadio;
	private _settingsLR = _radioLR call TFAR_fnc_getLrSettings;
	_settingsLR set [2, _frequenciesLR];
	_settingsLR set [4, _encryption];
	[_radioLR, _settingsLR] call TFAR_fnc_setLrSettings;
	//player sideChat "LongRange Kanäle programmiert.";
};

systemChat "Frequenzen für LR und SR gesetzt!";