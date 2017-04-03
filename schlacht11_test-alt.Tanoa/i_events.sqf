/**
registriert alle Events via CBA Event Handling 
wird in der init.sqf aufgerufen
*/

// fügt einen AddAction Eintrag hinzu
["opt_eh_client_add_action", {
	params ["_obj", "_parameter"];

	_obj addAction _parameter;

}] call CBA_fnc_addEventHandler;

// loggt zerstörte Fahrzeuge
["opt_eh_server_log_vec_destroyed", {
	if (!isServer) exitWith{};

	private _vec = param [0, objNull];
	private _killer = param [1, objNull];

	private _cat = "Fahrzeug zerstört";
	private _message = "";
	private _side = sideUnknown;

	// Falls Selbstzerstörung
	if (isNull _vec) then {
		_message = format["Fahrzeug: unbekannt - ", _message];

	} else {
		private _faction = (getText(configFile >> 'CfgVehicles' >> typeOf _vec >> 'faction'));
		private _name = (getText(configFile >> 'CfgVehicles' >> typeOf _vec >> 'displayName'));
		_message = format["Fahrzeug: %1 (%2) - ", _name, _faction];

	};

	if (isNull _killer) then {
		_message = format["%1 von: unbekannt", _message];

	} else {
		if (_vec == _killer) then {
			_message = format["%1 von: Selbstverschulden", _message];

		} else {
			private _faction = (getText(configFile >> 'CfgVehicles' >> typeOf _killer >> 'faction'));
			private _name = (getText(configFile >> 'CfgVehicles' >> typeOf _vec >> 'displayName'));
			if (_killer isKindOf "Man") then {
				_name = name _killer;

			};

			_message = format["%1 von: %2 (%3)", _message, _name, _faction];

		};

	};

	// übergib Kategorie und Nachricht an log-FUnktion
	["opt_eh_server_log_write", ["Fahrzeug zerstört", _message]] call CBA_fnc_localEvent;

}] call CBA_fnc_addEventHandler;

// schreibt eine log Nachricht in die SERVER-RPT
["opt_eh_server_log_write", {
	if (!isServer) exitWith{};

	params ["_category","_message"];

	private _timestemp = [serverTime - opt_startTime] call CBA_fnc_formatElapsedTime;

	diag_log format["OPT LOG BEGIN: %1 - %2 || %3 :OPT LOG END", _timestemp, _category, _message ];
	

}] call CBA_fnc_addEventHandler;

// update budget
["opt_eh_server_update_budget", {
	if (!isServer) exitWith{};

	params ["_side", "_unitCost", "_sign"];

	private _cat = "Budget aktualisiert";
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
