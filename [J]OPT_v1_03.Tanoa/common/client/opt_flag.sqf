// by psycho
// track the mf flag

if (!local player) exitWith {};
params ["_flag","_caller","_id","_parr"];

_side = _caller getVariable "opt_var_playerSide";

_owner = _flag getVariable ["owner", nil];

["setNewFlagOwner", [_side, _flag]] call tcb_fnc_NetCallEventCTS;

// log player
_message = "";

_uid = getPlayerUID _caller;
_id = (opt_ListOfPlayers apply {_x select 0}) find _uid;
_name = (opt_ListOfPlayers select _id) select 1;

if (_side == west && _flag in opt_nato_flags or _side == east && _flag in opt_csat_flags) then {
    if (_flag in opt_nato_flags) then {
        _message = format ["NATO Flagge gesichert von %1", _name];
    } else {
        _message = format ["CSAT Flagge gesichert von %1", _name];
    };
} else {
    if (_flag in opt_nato_flags) then {
        _message = format ["NATO Flagge erobert von %1", _name];
    } else {
        _message = format ["CSAT Flagge erobert von %1", _name];
    };
};
["opt_eh_server_log_write", ["Fahne", _message]] call CBA_fnc_serverEvent;

if (_caller == player) then {["addScore",[_caller, 5]] call tcb_fnc_NetCallEventCTS};