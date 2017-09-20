//by psycho
#include "setup\setup.sqf"

diag_log format ["%1 --- TcB initServer.sqf startet", diag_ticktime];

// legt alle wichtigen classnames wie Flaggen und Einheiten fest
__ccppfln(setup\setup_classnames.sqf);
// definiert und überträgt alle public variablen vom Server an die clients
__ccppfln(setup\setup_publicVariables.sqf);
// definiert CBA EH auf dem Server
__ccppfln(common\server\i_events.sqf);

//Function that adds dynamic groups to the mission as seen in End Game
["Initialize"] call BIS_fnc_dynamicGroups;

// ensure that disconnected players body will be removed - wont work with BI corpseManagerMode(!)
addMissionEventHandler ["HandleDisconnect", {
	_unit = _this select 0;
	[_unit] spawn {_torso = _this select 0; sleep 5; deleteVehicle _torso;};
	false
}];


// Schutzwall um die Basis für Arti- und Mörserbeschuss
// nur auf dem Server, da createVehicle global funktioniert
["ProtectionZone_Invisible_F", getMarkerPos "respawn_east", 150, 20] spawn opt_fnc_wallChain;
["ProtectionZone_Invisible_F", getMarkerPos "respawn_west", 150, 20] spawn opt_fnc_wallChain;

#ifdef __OPT_Sector_Message__
	_allFlagPoles = [];
	_allFlagPoles = opt_csat_flags + opt_nato_flags;
	{
		_flag = _x;
		_m_name = str(_flag) + str(_forEachIndex);
		_m_pos = getPos _flag;
		_marker = createMarker [_m_name, _m_pos];
		_marker setMarkerShape "ELLIPSE";
		
		_var = format ["%1",_flag];
		_side = _flag getVariable [_var, Nil];
		if (!isNil {_side}) then {
			_color = if (_side == west) then {"ColorBlufor"} else {"ColorOpfor"};
			_marker setMarkerColor _color;
		} else {
			_marker setMarkerColor "ColorBlack";
		};
		_marker setMarkerSize [5,5];
		_marker setMarkerBrush "SOLID";
		_marker setMarkerAlpha 1;
		_flag setVariable ["opt_flagMarker", _marker];
	} forEach _allFlagPoles;
#endif

// post-init area:
[] spawn {
	if (!isNil "HQ_CSAT") then {
		HQ_CSAT addMPEventHandler ["mpkilled", {
			[_this select 0] spawn {
				diag_log format ['########## CSAT Fahrzeug %1 wurde zerstoert ##########', getText (configFile >> 'CfgVehicles' >> typeOf (_this select 0) >> 'displayName')];
				["opt_logEvent", _txt] call tcb_fnc_NetCallEvent;
				sleep 240;
				deleteVehicle (_this select 0);
			};
		}];
	};
	if (!isNil "HQ_NATO") then {
        HQ_NATO addMPEventHandler ["mpkilled", {
            [_this select 0] spawn {
                diag_log format ['########## NATO Fahrzeug %1 wurde zerstoert ##########', getText (configFile >> 'CfgVehicles' >> typeOf (_this select 0) >> 'displayName')];
                ["opt_logEvent", _txt] call tcb_fnc_NetCallEvent;
                sleep 240;
                deleteVehicle (_this select 0);
            };
        }];
	};

	//[] spawn compileFinal preprocessFileLineNumbers "addons\opt3_sidemissions\sm3_createTrucks.sqf";
	
	// EH für alle im Editor gesetzten Fahrzeuge: loggt Zerstörung
	{
		_x addMPEventHandler ["killed", {
			(_this select [0,2]) call tcb_fnc_handleDeadVehicle;
		}];
	} forEach vehicles;
	
};

diag_log format ["%1 --- TcB initServer.sqf processed", diag_ticktime];