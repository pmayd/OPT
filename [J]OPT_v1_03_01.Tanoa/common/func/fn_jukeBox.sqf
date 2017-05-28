/* by psycho
["track_string", number] spawn tcb_fnc_jukeBox;
["track", 30] spawn tcb_fnc_jukeBox;

both params are optional!
*/

private ["_playlist","_num","_duration","_title","_dur"];
_playlist = ["LeadTrack02_F","LeadTrack04a_F","LeadTrack05_F","LeadTrack01a_F","LeadTrack01b_F","BackgroundTrack03_F","LeadTrack05_F_EPC","LeadTrack02_F_EPC","LeadTrack01_F_EPA","LeadTrack06_F"];

_title = if (count _this > 0) then {_this select 0} else {Nil};
_dur = if (count _this > 1) then {_this select 1} else {Nil};
if (isNil "_title") then {
	_num = floor (random count _playlist);
	_title = _playlist select _num;
};

0 fadeMusic 0.25;
playMusic _title;
_duration = if (isNil "_dur") then {getNumber (configfile >> "CfgMusic" >> _title >> "duration")} else {_dur};
sleep (_duration - 12);
10 fadeMusic 0.0;
sleep 11;
playMusic "";
2 fadeMusic 0.5;


true