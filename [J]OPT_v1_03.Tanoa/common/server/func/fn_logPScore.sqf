// by psycho
// get player Scores, sort them and write down in log file
private ["_allScores","_score","_p","_sepScore","_inf","_soft","_tank","_air","_diff","_place","_side"];

if (!isServer) exitWith {};
_allScores = [];
{
	if (isPlayer _x) then {
		_sub = [score _x, _x];
		_allScores pushBack _sub;
	};
	true
} count playableUnits;
_allScores sort false;

diag_log "---- OPT Scoreboard (other means special operations like revive, flag pulling, etc...) ---";
{
	_score = _x select 0;
	_p = _x select 1;
	
	_sepScore = getPlayerScores _p;
	_inf = _sepScore select 0;
	_soft = _sepScore select 1;
	_tank = _sepScore select 2;
	_air = _sepScore select 3;
	_diff = _score - (_inf+_soft+_tank+_air);
	_place = (_forEachIndex + 1);
	
	_side = switch (playerSide) do {
		case (west) : {"Nato"};
		case (west) : {"Csat"};
		default {"unknown"};
	};
	
	diag_log format ["%1: %2 (%9) with %3 points (Inf: %4 / Soft: %5 / Tank: %6 / Air: %7 / Other: %8)",_place, name _p, _score, _inf, _soft, _tank, _air, _diff, _side];
} forEach _allScores;


true