/* by psycho
["track_name", duration] spawn OPT_Core_fnc_Music;		// optional params
["track", 30] spawn OPT_Core_fnc_Music;
*/
params [
	["_title",Nil,[""]],
	["_duration",0,[0]]
];

_playlist = [
	"LeadTrack02_F",
	"LeadTrack04a_F",
	"LeadTrack05_F",
	"LeadTrack01a_F",
	"LeadTrack01b_F",
	"BackgroundTrack03_F",
	"LeadTrack05_F_EPC",
	"LeadTrack02_F_EPC",
	"LeadTrack01_F_EPA",
	"LeadTrack06_F"
];

if (isNil "_title") then {
	_title = selectRandom _playlist;
};

0 fadeMusic 0.25;
playMusic _title;

_duration = if (_duration > 0) then {
	getNumber (configfile >> "CfgMusic" >> _title >> "duration")
} else {
	_duration
};

sleep (_duration - 12);
10 fadeMusic 0.0;
sleep 11;
playMusic "";
2 fadeMusic 0.5;


true