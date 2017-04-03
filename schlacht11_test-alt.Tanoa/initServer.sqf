//by psycho
#include "setup\setup.sqf"

diag_log format ["%1 --- TcB initServer.sqf startet", diag_ticktime];

// legt alle wichtigen classnames wie Flaggen und Einheiten fest
#include "setup\setup_classnames.sqf"

//init only by server
["Initialize"] call BIS_fnc_dynamicGroups;

#ifdef __REMOVE_DEAD_AI_AND_VECS__
	tcb_addkilledhandler = __REMOVE_DEAD_AI_AND_VECS__;
	tcb_allunits_add = [];
	__cppfln(common\server\initaddkilledhandler.sqf);
#endif

// ensure that disconnected players body will be removed - wont work with BI corpseManagerMode(!)
addMissionEventHandler ["HandleDisconnect", {
	_unit = _this select 0;
	[_unit] spawn {_torso = _this select 0; sleep 5; deleteVehicle _torso;};
	false
}];

#include "setup\setup_publicVariable.sqf"
#include "common\server\i_events.sqf"

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

	// Beginnt mit dem Counter für die Spielzeit
	// startet erst, wenn MissionStarted = true gesetzt wird
	execVM "common\server\opt_countdown.sqf";
	//[] spawn compileFinal preprocessFileLineNumbers "addons\opt3_sidemissions\sm3_createTrucks.sqf";
	
	// EH für alle im Editor gesetzten Fahrzeuge: loggt Zerstörung
	{
		_x addMPEventHandler ["MPkilled", {
			params ["_vec", "_killer"];
			["opt_eh_server_log_vec_destroyed", [_vec, _killer]] call CBA_fnc_serverEvent;
		}];
	} forEach vehicles;
	
	execVM "addons\garbage\garbageCollector.sqf";
};

diag_log format ["%1 --- TcB initServer.sqf processed", diag_ticktime];