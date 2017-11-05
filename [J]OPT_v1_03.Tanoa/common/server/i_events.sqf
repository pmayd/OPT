/**
registriert alle Events via CBA Event Handling 
wird in der initServer.sqf aufgerufen
*/

// loggt Abschüsse
["opt_eh_server_log_kill", {
	params ["_victim", "_killer"];

	private _cat = "Abschuss";
	private _message = "";

	// Abschuss war Spieler oder Fahrzeug?
	if (_victim isKindOf "Man") then {

        _uid = getPlayerUID _victim;
        _id = (opt_ListOfPlayers apply {_x select 0}) find _uid;
        _nameVictim = (opt_ListOfPlayers select _id) select 1;

        _uid = getPlayerUID _killer;
        _id = (opt_ListOfPlayers apply {_x select 0}) find _uid;
        _nameKiller = (opt_ListOfPlayers select _id) select 1;

		if (_victim == _killer || isNull _killer) then {
			_message = format["%1 (%2) von: Selbstverschulden.", _nameVictim, _victim getVariable "opt_var_playerSide"];

		} else {
			_message = format["%1 (%2) von: %3 (%4).", _nameVictim, _victim getVariable "opt_var_playerSide", _nameKiller, _killer getVariable "opt_var_playerSide"];

		};

	} else {
        private _vec = _victim;
		private _faction = (getText(configFile >> 'CfgVehicles' >> typeOf _vec >> 'faction'));
		private _name = (getText(configFile >> 'CfgVehicles' >> typeOf _vec >> 'displayName'));
		_message = format["Fahrzeug: %1 (%2) - ", _name, _faction];

		// Täter nicht bekannt?
		if (isNull _killer) then {
			_message = format["%1 von: unbekannt", _message];

		} else {

			// Selbstverschulden?
			if (_vec == _killer) then {
				_message = format["%1 von: Selbstverschulden", _message];

			} else {
                _uid = getPlayerUID _killer;
                _id = (opt_ListOfPlayers apply {_x select 0}) find _uid;
                _nameKiller = (opt_ListOfPlayers select _id) select 1;
				_message = format["%1 von: %2 (%3).", _message, _nameKiller, _faction];

			};

		};

	};

	// übergib Kategorie und Nachricht an log-FUnktion
	["opt_eh_server_log_write", [_cat, _message]] call CBA_fnc_localEvent;

}] call CBA_fnc_addEventHandler;


// schreibt eine log Nachricht in die SERVER-RPT
["opt_eh_server_log_write", {
	params ["_category","_message"];

	private _timestemp = [serverTime - opt_startTime] call CBA_fnc_formatElapsedTime;

	diag_log format["OPT LOG BEGIN: %1 - %2 || %3 :OPT LOG END", _timestemp, _category, _message ];
	

}] call CBA_fnc_addEventHandler;

// update budget
["opt_eh_server_update_budget", {
	params ["_side", "_unitCost", "_sign"];

	private _cat = "Budget";
	private _message = "";
	private _budget_neu = 0;

	switch (_sign) do {
		case "-": {
				if (_side == WEST) then {
					_budget_neu = opt_west_budget - _unitCost;

				} else {
					_budget_neu = opt_east_budget - _unitCost;

				};

		};

		case "+":  {
				if (_side == WEST) then {
					_budget_neu = opt_west_budget + _unitCost;

				} else {					
					_budget_neu = opt_east_budget + _unitCost;

				};

		};

	};

	// server log sowie Aktualisierung via publicVarialbe
	if (_side == WEST) then {
		_message = format["NATO alt: %1 - neu: %2 - Differenz: %3%4", opt_west_budget, _budget_neu, _sign, _unitCost];
		opt_west_budget = _budget_neu;
		publicVariable "opt_west_budget";

	} else {
		_message = format["CSAT alt: %1 - neu: %2 - Differenz: %3%4", opt_east_budget, _budget_neu, _sign, _unitCost];
		opt_east_budget = _budget_neu;
		publicVariable "opt_east_budget";

	};
	
	["opt_eh_server_log_write", [_cat, _message]] call CBA_fnc_localEvent;

}] call CBA_fnc_addEventHandler;

// Zeus neu vergeben
["opt_eh_server_renew_curator", {

	params ["_operator"];

	if (_operator in (allCurators apply {getAssignedCuratorUnit _x})) then {
        _id = (allCurators apply {getAssignedCuratorUnit _x}) find _operator;
        _module = allCurators select _id;
        unassignCurator _module;
        _operator assignCurator _module;	
    };
    
}] call CBA_fnc_addEventHandler;

// store player in player list on server
["opt_eh_server_updatePlayerList", {

    params ["_uid", "_name", "_side"];

    if (_uid in (opt_listOfPlayers apply {_x select 0})) exitWith{};

    opt_listOfPlayers pushBack [_uid, _name, _side];
    publicVariable "opt_listOfPlayers";

}] call CBA_fnc_addEventHandler;

["opt_eh_server_printPlayerList", {

    private _cat = "Fraktionsübersicht";
    {
        _message = format["%1 (%2)", _x select 1, _x select 2];
        ["opt_eh_server_log_write", [_cat, _message]] call CBA_fnc_localEvent;

    } forEach opt_ListOfPlayers;

}] call CBA_fnc_addEventHandler;