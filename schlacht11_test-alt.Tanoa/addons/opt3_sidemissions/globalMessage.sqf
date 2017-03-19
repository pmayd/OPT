/*
	Sidemission Broadcast

	Author: schmingo (OPT MOD Team)

	v2015-01-07 | this script is part of OperationPandoraTrigger ArmA3 script collection

	[[_sidemission,_destroyer,_success],"addons\opt3_sidemissions\globalMessage.sqf"] execVM "callglobalscript.sqf";
*/

if (local player) then {

	private ["_sidemission", "_destroyer", "_success", "_sideDestroyer"];

	_sidemission 	= _this select 0;
	_destroyer 		= _this select 1;
	_success 		= _this select 2;

	// player sideChat "global message geladen.";
	// player sideChat format ["sidemission: %1", _sidemission];
	// player sideChat format ["destroyer: %1", _destroyer];
	// player sideChat format ["success: %1", _success];

	switch (_sidemission) do {

		case 3: {
				switch (side _destroyer) do {
						case west: {
									if (player isKindOf "OPT_Maintainer") then { 
										if (_success == 1) then { titleText ["NATO Sidemission 3 gewonnen!", "PLAIN", 20]; sleep 20; titleText ["","PLAIN"]; };
										if (_success == 0) then { titleText ["NATO hat einen Treibstoff-LKW zerstört!", "PLAIN", 10]; sleep 10; titleText ["","PLAIN"];};
									} else {
										hint "NATO hat einen Treibstoff-LKW zerstört!";
										if (_success == 1) then { hint "NATO hat Sidemission 3 gewonnen!"; };
									};
						};
						case east: {
									if (player isKindOf "OPT_Maintainer") then { 
										if (_success == 1) then { titleText ["CSAT Sidemission 3 gewonnen!", "PLAIN", 20]; sleep 20; titleText ["","PLAIN"]; };
										if (_success == 0) then { titleText ["CSAT hat einen Treibstoff-LKW zerstört!", "PLAIN", 10]; sleep 10; titleText ["","PLAIN"]; };
									} else {
										hint "CSAT hat einen Treibstoff-LKW zerstört!";
										if (_success == 1) then { hint "CSAT hat Sidemission 3 gewonnen!"; };
									};
						};
				};
		};	
	};
};