if (isDedicated || !hasInterface) exitWith {};
if (!(typeOf player in (opt_pilots + opt_operator))) exitWith {};

_pcs = entities "Land_PCSet_01_screen_F";

// add to each UAV PC addaction menu
{

	_x addAction [
		"Verbinden mit UAV-Station" call XOrangeText,
    {
      _terminal = _this select 0;
      [
        "verbinden...", 
        18,
        {
          _terminal = _this select 0;
		
					["In Kontrollstation eingeloggt"] call OPT_Core_fnc_dynamicText;
					player setVariable ["OPT_UAV_Station_logged", _terminal];
					
					if ((typeOf player) isEqualTo "OPT_NATO_Pilot_T") then {
						player removeWeapon "ItemGPS";
						player addWeapon "B_UavTerminal";
					};
					if ((typeOf player) isEqualTo "OPT_CSAT_Pilot_T") then {
						player removeWeapon "ItemGPS";
						player addWeapon "O_UavTerminal";
					};
        },
        [_terminal]
      ] call AME_Core_fnc_Progress_showBar;
    },
    [],
    1.5,
    false,
    true,
    "",
    "isNull (player getVariable ['OPT_UAV_Station_logged',objNull]) && {isNull objectParent player}"
  ];

	_x addAction [
		"Trennen mit UAV-Station" call XOrangeText,
    {
      _terminal = _this select 0;
      [
        "trennen...", 
        3,
        {
          _terminal = _this select 0;
		
					["Erfolgreich ausgeloggt"] call OPT_Core_fnc_dynamicText;
					player setVariable ["OPT_UAV_Station_logged", objNull];
					
					if ((typeOf player) isEqualTo "OPT_NATO_Pilot_T") then {
						player removeWeapon "B_UavTerminal";
						player addWeapon "ItemGPS";
					};
					if ((typeOf player) isEqualTo "OPT_CSAT_Pilot_T") then {
						player removeWeapon "O_UavTerminal";
						player addWeapon "ItemGPS";
					};
        },
        [_terminal]
      ] call AME_Core_fnc_Progress_showBar;
	  },
    [],
    1.5,
    false,
    true,
    "",
    "!isNull (player getVariable ['OPT_UAV_Station_logged',objNull])"
	];

} forEach _pcs;

0 spawn {
	waitUntil {time > 0};
	private _logged = false;
	
	while {true} do {
		waitUntil {sleep 0.647; !isNull (getConnectedUAV player)};
		_uav = getConnectedUAV player;
		
		if (typeOf _uav in OPT_big_uavs) then {
			if (isNull (player getVariable ["OPT_UAV_Station_logged",objNull])) then {
				player connectTerminalToUAV objNull;
				["Bitte erst in Kontrollstation einloggen" call XOrangeText] call OPT_Core_fnc_dynamicText;
			};
		} else {
			if (!(typeOf player in ["OPT_NATO_Operator_T","OPT_CSAT_Operator_T"])) then {
				player connectTerminalToUAV objNull;
				["Für diese Ausrüstung nicht geschult" call XOrangeText] call OPT_Core_fnc_dynamicText;
			};
		};
		
		waitUntil {sleep 0.524; isNull (getConnectedUAV player) || {!alive player} || {isNull (player getVariable ["OPT_UAV_Station_logged",objNull])} || {_uav != getConnectedUAV player}};
		if (!(typeOf player in ["OPT_NATO_Operator_T","OPT_CSAT_Operator_T"])) then {
			player connectTerminalToUAV objNull;
		};
	};
};

0 spawn {
	waitUntil {time > 3};

	while {true} do {
		waitUntil {sleep 1.423; !isNull (player getVariable ["OPT_UAV_Station_logged",objNull])};
		private _station = player getVariable ["OPT_UAV_Station_logged",objNull];
		waitUntil {sleep 1.211; !alive player || {player distance2D _station > 4} || {isNull (player getVariable ["OPT_UAV_Station_logged",objNull])}};
		player setVariable ["OPT_UAV_Station_logged", objNull];
		player connectTerminalToUAV objNull;
		
		if (alive player && {player distance2D _station > 4}) then {
			["Verbindung zur Kontrollstation verloren"] call OPT_Core_fnc_dynamicText;
		};
		
		if ((typeOf player) isEqualTo "OPT_NATO_Pilot_T") then {
			player removeWeapon "B_UavTerminal";
			player addWeapon "ItemGPS";
		};
		if ((typeOf player) isEqualTo "OPT_CSAT_Pilot_T") then {
			player removeWeapon "O_UavTerminal";
			player addWeapon "ItemGPS";
		};
	};
};