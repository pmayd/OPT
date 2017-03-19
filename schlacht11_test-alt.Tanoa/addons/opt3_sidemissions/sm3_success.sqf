/*
	Sidemission 2 - Destroy 3 Fueltrucks - Success check

	Author: schmingo (OPT MOD Team)

	v2015-03-16 | this script is part of OperationPandoraTrigger ArmA3 script collection
*/
if (isServer) then {

	private ["_vehicle", "_destroyer", "_sidemission", "_success"];

	_vehicle		= _this select 0;
	_destroyer		= _this select 1;
	_success		= 0;
	_sidemission	= 3;

	fn_logEntrySM3 = {
					_destroyer 	= _this select 0;
					_vehicle	= _this select 1;
					_success	= _this select 2;

					_side = switch (side _destroyer) do {
						case west: {"NATO"};
						case east: {"CSAT"};
					};
					//diag_log format ["########## Sidemission: SM3: %1 hat %2 zerstört ##########", _side, _vehicle];
					_txt = format format ["########## Sidemission: SM3: %1 hat %2 zerstört ##########", _side, _vehicle];
					["opt_logEvent", _txt] call tcb_fnc_NetCallEvent;
					
					if (_success == 1) then {
						//diag_log format ["########## Sidemission: SM3: %1 hat die Sidemission 3 gewonnen ##########", _side];
						_txt = format ["########## Sidemission: SM3: %1 hat die Sidemission 3 gewonnen ##########", _side];
						["opt_logEvent", _txt] call tcb_fnc_NetCallEvent;
					};
	};

///////////////////////////////////////////////////////////////////////////////////
// Broadcast Message / Create LogEntry

	switch (side _destroyer) do {
		case west: {
					successNATO_sm3 = successNATO_sm3 + [_vehicle];
					
					if ((count successNATO_sm3) < 3) then {
						_success = 0;
						[[_sidemission,_destroyer,_success],"addons\opt3_sidemissions\globalMessage.sqf"] execVM "callglobalscript.sqf";
						[_destroyer,_vehicle,_success] call fn_logEntrySM3;
					};

					if ((count successNATO_sm3) == 3) then { 
						_success = 1;
						[[_sidemission,_destroyer,_success],"addons\opt3_sidemissions\globalMessage.sqf"] execVM "callglobalscript.sqf";
						[_destroyer,_vehicle,_success] call fn_logEntrySM3;
					};
		};


		case east: {
					successCSAT_sm3 = successCSAT_sm3 + [_vehicle];
					
					if ((count successCSAT_sm3) < 3) then {
						_success = 0;
						[[_sidemission,_destroyer,_success],"addons\opt3_sidemissions\globalMessage.sqf"] execVM "callglobalscript.sqf";
						[_destroyer,_vehicle,_success] call fn_logEntrySM3;
					};

					if ((count successCSAT_sm3) == 3) then { 
						_success = 1;
						[[_sidemission,_destroyer,_success],"addons\opt3_sidemissions\globalMessage.sqf"] execVM "callglobalscript.sqf";
						[_destroyer,_vehicle,_success] call fn_logEntrySM3;
					};
		};
		case independent: {};
	};
};
