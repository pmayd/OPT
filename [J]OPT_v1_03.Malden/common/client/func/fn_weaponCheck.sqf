// by psycho
private ["_remove_pm", "_bad_item_used", "_typeOfPlayer"];
params ["_player", "_container","_item"];
_typeOfPlayer = typeOf _player;
_bad_item_used = false;

// check launcher
if !(_typeOfPlayer in opt_rocketmen) then {
	{if (_x in opt_launchers) then {_player removeWeapon _x; _bad_item_used = true}} forEach (weapons _player);
};
// check UAV Terminal
if !(_typeOfPlayer in opt_operator) then {
	{_player unassignItem _x; _player removeItems _x} forEach ["B_UavTerminal","O_UavTerminal"];
};
// check medic item
if !(_typeOfPlayer in opt_medic) then {
	{_player removeItems _x} forEach ["Medikit"];
};

// check primary weapon
_pw = primaryWeapon _player;
_spw = _player getVariable ["opt_pw_storage",""];

if (_pw != "") then {
	if (_pw != _spw) then {
		_w_typeStringArray = _pw splitString "_";
		_w_typeString = if (toUpper(_w_typeStringArray select 0) == "OPT") then {toUpper(_w_typeStringArray select 1)} else {toUpper(_w_typeStringArray select 0)};
		
		diag_log format ["--- %1 --- %2 --- %3",_pw,_w_typeStringArray,_w_typeString];
	
		_remove_pm = false;
		switch (true) do {
			case (_typeOfPlayer in opt_snipers) : {if (_w_typeString != "SRIFLE") then {_remove_pm = true}};	// sniper
			case (_typeOfPlayer in opt_soldatMG) : {if (!(_w_typeString in ["LMG","MMG"])) then {_remove_pm = true}};	// machine gunner
			case (_typeOfPlayer in opt_crew || {_typeOfPlayer in opt_pilots}) : {if (!(_w_typeString in ["HGUN","SMG"])) then {_remove_pm = true;}};	// crew
			case (_typeOfPlayer in opt_grenadiers) : {
				_w_typeString = if (toUpper(_w_typeStringArray select 0) == "OPT") then {toUpper(_w_typeStringArray select 3)} else {toUpper(_w_typeStringArray select 2)};
				if (_w_typeString != "GL") then {_remove_pm = true};	// grenadier
			};
			default {if (_w_typeString != "ARIFLE") then {_remove_pm = true}};	// default - all assault rifle types
		};
	
		if (_remove_pm) then {
			_player removeWeapon _pw;
			_bad_item_used = true;
		} else {
			_player setVariable ["opt_pw_storage", _pw];
		};
	};
};


if (_bad_item_used) then {
	["<t size='0.8' shadow='1' color='#f0ff0000'>Regelverstoß! - Waffe wurde entfernt.</t>", (safeZoneX - 0.1), (safeZoneY + 0.3), 3, 1, 0, 2] spawn BIS_fnc_dynamicText;
};