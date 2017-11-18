/*
	["Mein Text"] call AIS_Core_fnc_dynamicText;
*/

params [
    ["_text", "", ["",{}]],
    ["_color", "blue", [""]]
];

["OPT_gui_message", ["San-System", _text, _color]] call CBA_fnc_localEvent;

true