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
    case (west) : { //wenn spieler der zieht NATO ist
        _flag setFlagTexture "\A3\Data_F\Flags\Flag_nato_CO.paa";
        _flag setVariable ["owner", _side, true];

    };
    case (east) : {
        _flag setFlagTexture "\A3\Data_F\Flags\Flag_csat_CO.paa";
        _flag setVariable ["owner", _side, true];

    };
    default {};
};

_side_calculated = [] call FUNC(calcDominator);
GVARMAIN(dominator) = _side_calculated;
publicVariable QGVARMAIN(dominator);

switch (_side_calculated) do {
    case (east) : {
        _log_msg = format["Dominator ist CSAT"];
        ["Fahne", _log_msg] call EFUNC(log,write);

    };
    case (west) : {
        _log_msg = format["Dominator ist NATO"];
        ["Fahne", _log_msg] call EFUNC(log,write);

    };
    default {GVARMAIN(dominator) = sideUnknown};
};

true