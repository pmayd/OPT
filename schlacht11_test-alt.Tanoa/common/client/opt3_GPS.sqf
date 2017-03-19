/*
	OPT GPS

	Author: Quiksilver | Soldier Tracker v1.0.2 http://www.armaholic.com/page.php?id=26994
		Modified by schmingo (OPT MOD Team)

	v2015-01-30 | this script is part of OperationPandoraTrigger ArmA3 script collection
	
	changed / relocalized by psycho


*/


//=============================================================== INITIALIZATION


opt_hqObj = switch (playerSide) do {
	case west : {NatoBase};
	case east : {CsatBase};		// added by psycho
	default {HQ_Maintainer};	// independend is not a legal side!
};

sleep 0.1;
systemChat "GPS initialisiert";

//===== INIT MAP

waitUntil {sleep 0.1; !(isNull (findDisplay 12))};
clientEhDrawMap = ((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["Draw", opt_fnc_iconDrawMap];

//===== INIT GPS (waits for GPS to open)

disableSerialization;
_gps = controlNull;
while {isNull _gps} do {
	{
		if !(isNil {_x displayctrl 101}) then {
			_gps = _x displayctrl 101
		};
	} count (uiNamespace getVariable "IGUI_Displays");
	sleep 1;
};
clientEhDrawGps = _gps ctrlAddEventHandler ["Draw", opt_fnc_iconDrawGPS];


If (!isNil "opt_hqObj") then {
	if (!(alive opt_hqObj) || {isNull opt_hqObj}) then {player sideChat "GPS-Station wurde zerstört | GPS offline.";};
};
