//by psycho
#include "setup\setup.sqf"

diag_log format ["%1 --- TcB initServer.sqf startet", diag_ticktime];

// Startparameter auslesen und als globale Variablen verfügbar machen
// By James: moderner Ansatz ohne 20 Zeilen Code
// Das spiel liest bereits alle Parameter aus und speichert sie in "BIS_fnc_storeParamsValues_data"
// 1. Namen aller Parameter
// 2. führe globale Variable mit diesem Namen ein
_paramNames = ("true" configClasses (getMissionConfig "Params")) apply {configName _x};
{	
	// braucht nicht global sein, da init.sqf für jeden ausgeführt wird
	missionNamespace setVariable [_x, [_x] call BIS_fnc_getParamValue];
} forEach _paramNames;

// legt alle wichtigen classnames wie Flaggen und Einheiten fest
#include "setup\setup_classnames.sqf"

//init only by server
["Initialize"] call BIS_fnc_dynamicGroups;

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
	execVM "addons\garbage\garbageCollector.sqf";

	{
		_x addMPEventHandler ["MPkilled", {
			(_this select [0,2]) call tcb_fnc_handleDeadVehicle;
		}];
	} forEach vehicles;
	
};

diag_log format ["%1 --- TcB initServer.sqf processed", diag_ticktime];