/*
	Set radio frequencies

	Author: schmingo (OPT MOD Team)

    Arguments:
    0: <OBJECT> - vehicle

	v2015-01-29| this script is part of OperationPandoraTrigger ArmA3 script collection

	
	/ changed by psycho
*/
if !(local player) exitWith {};
params [["_vec", objNull, [objNull], 1]];

private _frequenciesSWCSAT 	= ["41","42","43","51","52","53","61","62","63"];
private _frequenciesLRCSAT 	= ["30","40","50","60","70","80"];
private _frequenciesSWNATO = ["71.9","72.9","73.9","74.9","75.9","76.9","77.9","78.9"];
private _frequenciesLRNATO = ["31.7","32.7","33.7","34.7","35.7","36.7","37.7","38.7"];
private _encryptionNATO = "_bluefor";
private _encryptionCSAT = "_opfor";

// frequencies can never be intercepted by inf
(switch (playerSide) do {
    case west: {["_bluefor", _frequenciesSWNATO, _frequenciesLRNATO]};
    case east: {["_opfor", _frequenciesSWCSAT, _frequenciesLRCSAT]};
    default {[]};
}) params ["_encryption", "_frequenciesSW", "_frequenciesLR"];

if (!(_vec isEqualTo objNull) and (_vec call TFAR_fnc_hasVehicleRadio)) then {

    private _radioLR = player call TFAR_fnc_VehicleLR;
	private _settingsLR = _radioLR call TFAR_fnc_getLrSettings;
	_settingsLR set [2, _frequenciesLR];
	_settingsLR set [4, _encryption];
	[_radioLR, _settingsLR] call TFAR_fnc_setLrSettings;
	//player sideChat "LongRange Kanäle programmiert.";

} else {

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
};

