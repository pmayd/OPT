if (isDedicated || !hasInterface) exitWith {};

_texts = player getVariable ["AME_Core_displayText", []];

if (_texts find (name player) < 0) then {
	_texts pushBack (name player);
};
player setVariable ["AME_Core_displayText", _texts, true];