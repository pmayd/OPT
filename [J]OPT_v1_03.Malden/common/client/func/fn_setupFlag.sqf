if (!isNil "opt_csat_flags") exitWith{};
// alle funktionierenden und fr die Wertung relevanten Flaggenmarker definieren
// Name hier eintragen so wie die Flaggen benannt sind - Dominator ist derjenige der mehr Flaggen als die gegnerische Seite besitzt (das gilt immer - wenn hier also eine Seite mehr Flaggen definiert bekommen hat ist sie autom. Dominator)
// wenn __OPT_Sector_Message__ in setup aktiviert werden automatisch die Marker um die Flaggen generiert. Achtung - Dummyflaggen bentigen weiterhin manuelle einen Marker

/* BY JAMES */
// automatisches Auslesen aller Flaggen mit dem Variablenname OPT_CSAT_FLAG_x und OPT_NATO_FLAG_x
// d.h. es knnen beliebig viele Flaggen gesetzt werden, der Name kann wie beim Kopieren automatisch
// bernommen mit OPT_CSAT_FLAG beginnen und eine beliebige Nummer haben.

{
    // erzeuge fr jede gefundene Flagge einen Marker auf der Karte
    #ifdef __OPT_FLAG_MARKER__
        _markerName = format["marker_%1_%2", _x, _forEachIndex];
        _marker = createMarkerLocal [_markerName, getPos _x];
        _marker setMarkerTypeLocal "flag_CSAT";
        _x setVariable ["opt_var_flag_marker", _marker];
    #endif

} foreach opt_csat_flags;

{
    // erzeuge fr jede gefundene Flagge einen Marker auf der Karte
    #ifdef __OPT_FLAG_MARKER__
        _markerName = format["marker_%1_%2", _x, _forEachIndex];
        _marker = createMarkerLocal [_markerName, getPos _x];
        _marker setMarkerTypeLocal "flag_NATO";
        _x setVariable ["opt_var_flag_marker", _marker];
    #endif

} foreach opt_nato_flags;


/*
Fuer jede Flagge in einem Sektor: unverwundbar, Logistik-Script aus
Sowie Actionmeneintrag fuer Spieler
*/
{
	_x addAction [
		'Flagge ziehen' call XRedText, 	// Anzeigetext
		'common\client\opt_flag.sqf', 	// Skript
		[], 														// Parameter fr Skript
		1, 															// priority
		true, 													    // showWindow
		true,														// hideOnUse 
		"",															// shortcut
		'((_target distance player) < 5) and vehicle player == player and MissionStarted and (OPT_PLAYTIME - (serverTime - opt_startTime)) > 0 and (playerSide != _target getVariable "owner")' // Flagge kann nur nach Missionsstart, in 5 m Radius, auerhalb eines Fahrzeugs und in Restspielzeit gezogen werden
	];
	_x allowDamage false; 						                    // Flagge kann nicht beschdigt werden
	_x setVariable ["R3F_LOG_disabled", true];                      // Flagge kann nicht verladen werden
} foreach (opt_csat_flags + opt_nato_flags);

// define standard sector owner
{
	if (!isNil {_x}) then {
		if (_x != objNull) then {
			_x setVariable ["owner", east, true];
		};
	};
} forEach opt_csat_flags;

{
	if (!isNil {_x}) then {
		if (_x != objNull) then {
			_x setVariable ["owner", west, true];
		};
	};
} forEach opt_nato_flags;