//by psycho
#include "macros.sqf"

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

#ifdef __OPT_Sector_Message__
	_allFlagPoles = [];
	_allFlagPoles = OPT_CSAT_FLAGs + OPT_NATO_FLAGs;
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

	execVM "common\server\opt_countdown.sqf";
	//[] spawn compileFinal preprocessFileLineNumbers "addons\opt3_sidemissions\sm3_createTrucks.sqf";
	
	{
		diag_log format ["%1",_x];
		_x addMPEventHandler ["MPkilled", {
			private "_vec";
			_vec = _this select 0;
			if (isNil "_vec") exitWith {diag_log "undifened vehicle destroyed"};
			_faction = (getText(configFile >> 'CfgVehicles' >> typeOf _vec >> 'faction'));
			_name = (getText(configFile >> 'CfgVehicles' >> typeOf _vec >> 'displayName'));
			_txt = format ['########## Fahrzeug zerstört: %1 %2 ##########', _faction, _name];
			diag_log _txt;
		}];
	} forEach vehicles;
	
	execVM "addons\garbage\garbageCollector.sqf";
};

diag_log format ["%1 --- TcB i_server.sqf processed", diag_ticktime];