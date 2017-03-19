/*
	Sector Control Script

	Author: unknown
		Modified by schmingo (OPT MOD Team)

	v2015-02-06 | this script is part of OperationPandoraTrigger ArmA3 script collection
*/

if (!local player) exitWith {};
params ["_status","_marker","_points","_sektor"];

SIDE_WEST 	= 101;
SIDE_EAST 	= 100;
SIDE_CIV	= 103;

switch (_status) do {

	case SIDE_WEST: {
		_txt = format ["NATO hat Sektor %1 eingenommen", _sektor];
		[format ["<t size='0.8' shadow='1' color='#ffffff'>%1</t>",_txt], (safeZoneX - 0.2), (safeZoneY + 0.3), 3, 1, 0, 2] spawn BIS_fnc_dynamicText;
	};

	case SIDE_EAST: {
		_txt = format ["CSAT hat Sektor %1 eingenommen", _sektor];
		[format ["<t size='0.8' shadow='1' color='#ffffff'>%1</t>",_txt], (safeZoneX - 0.2), (safeZoneY + 0.3), 3, 1, 0, 2] spawn BIS_fnc_dynamicText;
	};

	case 0: {
		_txt = format ["%1 ist von niemandem besetzt",_sektor];
		[format ["<t size='0.8' shadow='1' color='#ffffff'>%1</t>",_txt], (safeZoneX - 0.2), (safeZoneY + 0.3), 3, 1, 0, 2] spawn BIS_fnc_dynamicText;
	};

	case -1: {
		_txt = format ["%1 ist von beiden besetzt",_sektor];
		[format ["<t size='0.8' shadow='1' color='#ffffff'>%1</t>",_txt], (safeZoneX - 0.2), (safeZoneY + 0.3), 3, 1, 0, 2] spawn BIS_fnc_dynamicText;
	};
	case -2: {
		_txt = "Keine Seite dominiert das Gebiet";
		[format ["<t size='0.8' shadow='1' color='#ffffff'>%1</t>",_txt], (safeZoneX - 0.2), (safeZoneY + 0.3), 3, 1, 0, 2] spawn BIS_fnc_dynamicText;
	};
	
	case -3: {
		Dominating = "NATO";
		_txt = "NATO dominiert das Gebiet";
		[format ["<t size='0.8' shadow='1' color='#ffffff'>%1</t>",_txt], (safeZoneX - 0.2), (safeZoneY + 0.3), 3, 1, 0, 2] spawn BIS_fnc_dynamicText;
	};
		
	case -4: {
		Dominating = "CSAT";
		_txt = "CSAT dominiert das Gebiet";
		[format ["<t size='0.8' shadow='1' color='#ffffff'>%1</t>",_txt], (safeZoneX - 0.2), (safeZoneY + 0.3), 3, 1, 0, 2] spawn BIS_fnc_dynamicText;
	};
		
	case -5: {
		systemChat format ["NATO: +%1 Punkt",_points];
		"CSAT" setMarkerTextlocal format ["%1 Punkte", EastPoints];
		"NATO" setMarkerTextlocal format ["%1 Punkte", WestPoints];
	};
		
	case -6: {
		systemChat format ["CSAT: +%1 Punkt",_points];
		"CSAT" setMarkerTextlocal format ["%1 Punkte", EastPoints];
		"NATO" setMarkerTextlocal format ["%1 Punkte", WestPoints];
	};	
		
	case -100: {
		if (_sektor == SIDE_WEST) 	then {_marker setMarkerColorLocal "ColorBlue";_marker setMarkerAlpha 0.75;};
		if (_sektor == SIDE_EAST) 	then {_marker setMarkerColorLocal "ColorRed"; _marker setMarkerAlpha 0.75;};
		if (_sektor == 0) 			then {/*_marker setMarkerColorLocal "ColorGreen";*/ _marker setMarkerAlpha 0.75;};			// psycho, dirty work around to disable neutral zone color
		if (_sektor == -1) 			then {_marker setMarkerColorLocal "ColorYellow"; _marker setMarkerAlpha 0.75;};							
	};	
};


true