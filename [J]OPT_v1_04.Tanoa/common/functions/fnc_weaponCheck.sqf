/**
* Author: James
* handle taken weapon according to player class
*
* Arguments:
*   unit: Object - Unit to which the event handler is assigned
*   container: Object - The container from which the item was taken (vehicle, box, etc.)
*   item: String - The class name of the taken item
*
* Return Value:
* None
*
* Example:
* [unit, container, item] call fnc_weaponCheck.sqf;
*
*/
#include "script_component.hpp"

params ["_unit", "_container","_item"];
_typeOfPlayer = typeOf _unit;
_bad_item_used = false;

// check launcher
if !(_typeOfPlayer in GVARMAIN(rocketmen)) then {
	{
        if (_x in GVARMAIN(launchers)) then {
            _unit removeWeapon _x;
            _bad_item_used = true;
        };
    } forEach (weapons _unit);
};

// check UAV Terminal
if !(_typeOfPlayer in GVARMAIN(operator)) then {
	{
        _unit unassignItem _x; 
        _unit removeItems _x
    } forEach ["B_UavTerminal","O_UavTerminal"];
};

// check medic item
if !(_typeOfPlayer in GVARMAIN(medic)) then {
	{
        _unit removeItems _x
    } forEach ["Medikit"]; //TODO: ACE
};

// check primary weapon
_pw = primaryWeapon _unit;
_spw = _unit getVariable ["opt_pw_storage", ""];

if (_pw != "") then {
	if (_pw != _spw) then {
		_w_typeStringArray = _pw splitString "_";
		_w_typeString = if (toUpper(_w_typeStringArray select 0) == "OPT") then {
            toUpper(_w_typeStringArray select 1)
        } else {
            toUpper(_w_typeStringArray select 0)
        };
		
		diag_log format ["--- %1 --- %2 --- %3", _pw, _w_typeStringArray, _w_typeString];
	
		_remove_pm = false;
		switch (true) do {
			case (_typeOfPlayer in GVARMAIN(snipers)) : {
                if (_w_typeString != "SRIFLE") then {
                    _remove_pm = true
                }
            };	// sniper
			case (_typeOfPlayer in GVARMAIN(soldatMG)) : {
                if (!(_w_typeString in ["LMG","MMG"])) then {
                    _remove_pm = true
                }
            };	// machine gunner
			case (_typeOfPlayer in GVARMAIN(crew) || _typeOfPlayer in GVARMAIN(pilots)) : {
                if (!(_w_typeString in ["HGUN","SMG"])) then {
                    _remove_pm = true;
                }
            };	// crew
			case (_typeOfPlayer in GVARMAIN(grenadiers)) : {
				_w_typeString = if (toUpper(_w_typeStringArray select 0) == "OPT") then {
                    toUpper(_w_typeStringArray select 3)
                } else {
                    toUpper(_w_typeStringArray select 2)
                };
				if (_w_typeString != "GL") then {
                    _remove_pm = true
                };	// grenadier
			};
			default {
                if (_w_typeString != "ARIFLE") then {
                    _remove_pm = true
                }
            };	// default - all assault rifle types
		};
	
		if (_remove_pm) then {
			_unit removeWeapon _pw;
			_bad_item_used = true;
		} else {
			_unit setVariable ["opt_pw_storage", _pw];
		};
	};
};

if (_bad_item_used) then {
    [QEGVAR(gui,message), ["Regelverstoß", "Waffe unzulässig für aktuelle Spielerklasse.<br/>Waffe wurde entfernt.", "red"]] call CBA_fnc_localEvent;
};