// by psycho
// track the mf flag

if (!local player) exitWith {};
params ["_flag","_caller","_id","_parr"];

_side = side _caller;

_owner = _flag getVariable ["owner", nil];

["setNewFlagOwner", [_side, _flag]] call tcb_fnc_NetCallEventCTS;

// log player
_message = "";
if (_side == west && _flag in opt_nato_flags or _side == east && _flag in opt_csat_flags) then {
    if (_flag in opt_nato_flags) then {
        _message = format ["NATO Flagge gesichert von %1", name _caller];
    } else {
        _message = format ["CSAT Flagge gesichert von %1", name _caller];
    };
} else {
    if (_flag in opt_nato_flags) then {
        _message = format ["NATO Flagge erobert von %1", name _caller];
    } else {
        _message = format ["CSAT Flagge erobert von %1", name _caller];
    };
};
["opt_eh_server_log_write", ["Fahne", _message]] call CBA_fnc_serverEvent;

if (_caller == player) then {["addScore",[_caller, 5]] call tcb_fnc_NetCallEventCTS};