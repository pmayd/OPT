_title = _this select 0;
_duration = _this select 1;
_callback = _this select 2;
_arguments = _this select 3;
_onAbort = if (count _this > 4) then {_this select 4} else {{}};
_doAbort = if (count _this > 5) then {_this select 5} else {false};		// added by Psycho
_endTime = time + _duration;
_affectingObject = if (typeName _arguments == "ARRAY") then {_arguments select 0} else {_arguments};

if (typeName _affectingObject == "OBJECT") then {
    if (_affectingObject getVariable ["AME_Core_Progress_inUse", false]) exitWith {
		["Object in use" call XOrangeText] call OPT_Core_fnc_dynamicText;
    };

    _affectingObject setVariable ["AME_Core_Progress_inUse", true, true];
};

closeDialog 0;
createDialog "AME_Core_Progress_BarDlg";

_texts = player getVariable ["AME_Core_displayText", []];
_texts pushBack ("(" + _title + ")");
player setVariable ["AME_Core_displayText", _texts, true];

disableSerialization;
_progressBar = uiNamespace getVariable "AME_Core_Progress_ProgressBar";
_progressTitle = uiNamespace getVariable "AME_Core_Progress_ProgressTitle";

_progressBar ctrlSetPosition [safeZoneX + 0.3 * safeZoneW, safeZoneY + 0.2 * safeZoneH, 0.4 * safeZoneW, 0.005 * safeZoneH];
_progressBar ctrlCommit (_duration / accTime);

_progressTitle ctrlSetText _title;

waitUntil {!dialog || time > _endTime || !alive player || _doAbort};
closeDialog 0;

_texts = _texts - ["(" + _title + ")"];
player setVariable ["AME_Core_displayText", _texts, true];

if (time > _endTime) then {
    _arguments spawn _callback;
} else {
    ["Abbruch..." call XRedText] call OPT_Core_fnc_dynamicText;
    _arguments spawn _onAbort;
};

if (typeName _affectingObject == "OBJECT") then {
    _affectingObject setVariable ["AME_Core_Progress_inUse", false, true];
};