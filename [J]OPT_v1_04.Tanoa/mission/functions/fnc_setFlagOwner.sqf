/**
* Author: James
* script runs when flag was captured by a player. Set new ownership for all clients.
*
* Arguments:
* 0: <SIDE> playerSide or unknown for setup
* 1: <OBJECT> flag
*
* Return Value:
* None
*
* Example:
* [] call fnc_setFlagOwner.sqf;
*
*/
#include "script_component.hpp"

params ["_side","_flag"];

switch (_side) do {
	case (west) : { //wenn spieler der zieht westen ist
		_flag setFlagTexture "\A3\Data_F\Flags\Flag_nato_CO.paa";
		_flag setVariable ["owner", _side, true];
		#ifdef __OPT_Sector_Message__
			//_marker = _flag getVariable "opt_flagMarker";
			//_marker setMarkerColor "ColorBLUFOR";
			//_parr setMarkerColor "ColorBLUFOR";
            _txt = "NATO hat einen Sektor zurückerobert";
            [QEGVAR(gui,message), ["Sektorkampf", _txt, "blue"]] call CBA_fnc_globalEvent;
		#endif
	};
	case (east) : {
		_flag setFlagTexture "\A3\Data_F\Flags\Flag_csat_CO.paa";
		_flag setVariable ["owner", _side, true];
		#ifdef __OPT_Sector_Message__
			//_marker = _flag getVariable "opt_flagMarker";
			//_marker setMarkerColor "ColorOPFOR";
			//_parr setMarkerColor "ColorOPFOR";
			_txt = "CSAT hat einen Sektor zurückerobert";
            [QEGVAR(gui,message), ["Sektorkampf", _txt, "red"]] call CBA_fnc_globalEvent;
		#endif
	};
	default {};
};

_side_calculated = resistance;
_side_calculated = [] call FUNC(calcDominator);

systemChat format ["calculated Side: %1", _side_calculated];

switch (_side_calculated) do {
	case (east) : {
		GVARMAIN(dominator) = east;
        _log_msg = format["Dominator ist CSAT"];
        [QEGVAR(log,write), ["Fahne", _log_msg]] call CBA_fnc_serverEvent;

		#ifdef __OPT_Sector_Message__
		    _txt = "CSAT dominiert das Gebiet";
            [QEGVAR(gui,message), ["Sektorkampf", _txt, "red"]] call CBA_fnc_globalEvent;
		#endif
	};
	case (west) : {
		GVARMAIN(dominator) = west;
        _log_msg = format["Dominator ist NATO"];
        [QEGVAR(log,write), ["Fahne", _log_msg]] call CBA_fnc_serverEvent;

		#ifdef __OPT_Sector_Message__
		     _txt = "NATO dominiert das Gebiet";
            [QEGVAR(gui,message), ["Sektorkampf", _txt, "blue"]] call CBA_fnc_globalEvent;
		#endif
	};
	default {GVARMAIN(dominator) = sideUnknown};
};

publicVariable QGVARMAIN(dominator);

true