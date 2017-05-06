// by psycho
params [
	["_p", player],
	["_score", 1, [0]]
];

if (isServer) then {
	_p addScore _score;
};