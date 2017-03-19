//by psycho
//init only by client
diag_log format ["%1 --- TcB i_client.sqf startet",diag_ticktime];
if (isNil "x_global_chat_logic") then {x_global_chat_logic = "Logic" createVehicleLocal [0,0,0]};

__ccppfln(common\client\func\x_perframe.sqf);
[] execVM "addons\opt3_magRepack\MagRepack_init_sv.sqf";
__cppfln(opt_TFARfrequencies,common\client\opt_TFARfrequencies.sqf);
__cppfln(opt_tfarVehicleLr,common\client\opt_tfarVehicleLr.sqf);

if ((typeOf player) in OPT_GPSunits) then {execVM "common\client\opt3_gps.sqf"};


#ifdef __SHOW_CUSTOM_PLAYERMARKER__
__ccppfln(common\client\func\player_marker.sqf);
#endif

#ifdef __INTRO_ENABLED__
execVM "common\client\intro.sqf";
#endif

#ifdef __BREATH_VISIBLE__
execVM "common\client\foggy_breath.sqf";
#endif

#ifdef __BLOOD_SCREEN__
player addeventhandler ["hit",{
	_hit = _this select 2;
	_sqf = [0.7 + _hit] spawn tcb_fnc_screen;
	"dynamicblur" ppeffectenable true;
	"dynamicblur" ppeffectadjust [1];
	"dynamicblur" ppeffectcommit 0;
	"dynamicblur" ppeffectadjust [0];
	"dynamicblur" ppeffectcommit (1 + random 1);
}];
#endif

#ifndef __INTRO_ENABLED__
[] spawn {
	titleCut ["","BLACK IN", 3.5];
	"dynamicblur" ppeffectenable true;
	"dynamicblur" ppeffectadjust [5];
	"dynamicblur" ppeffectcommit 0;
	"dynamicblur" ppeffectadjust [0];
	"dynamicblur" ppeffectcommit 5;
};
#endif

// checking for failed player init
if (isMultiplayer && !isServer) then {	// only on dedicated environment
	true spawn {
		private "_puid";
		waitUntil {player == player && local player};
		_puid = getPlayerUID player;
		if (isNil "_puid") exitWith {diag_log "UID is Nil - init stoped"; endMission "LOSER";};
		if (_puid == "") exitWith {diag_log "UID is empty - init stoped"; endMission "LOSER";};
		if (!isNil "opt_allowedSides") then {
			if !(playerSide in opt_allowedSides) exitWith {diag_log format ["wrong side: %1", playerSide]; endMission "LOSER";};
		};
	};
};

_pos = if (playerSide == blufor) then {getMarkerPos "respawn_east"} else {getMarkerPos "respawn_west"};
["ProtectionZone_Invisible_F", _pos, 150, 20] spawn opt_fnc_wallChain;



if (isNil "respawndelay") then {
	_num = getNumber (missionConfigFile/"respawndelay");
	if (_num != 0) then {
		missionNamespace setVariable ["tcb_ais_respawndelay", _num];
	};
} else {
	missionNamespace setVariable ["tcb_ais_respawndelay", 999];
};

tcb_ais_killcam_quotes = [
	[(localize "STR_QUOTE_1"),(localize "STR_AUTHOR_1")],
	[(localize "STR_QUOTE_2"),(localize "STR_AUTHOR_2")],
	[(localize "STR_QUOTE_3"),(localize "STR_AUTHOR_3")],
	[(localize "STR_QUOTE_4"),(localize "STR_AUTHOR_4")],
	[(localize "STR_QUOTE_5"),(localize "STR_AUTHOR_5")],
	[(localize "STR_QUOTE_6"),(localize "STR_AUTHOR_6")],
	[(localize "STR_QUOTE_7"),(localize "STR_AUTHOR_7")],
	[(localize "STR_QUOTE_8"),(localize "STR_AUTHOR_8")],
	[(localize "STR_QUOTE_9"),(localize "STR_AUTHOR_9")],
	[(localize "STR_QUOTE_10"),(localize "STR_AUTHOR_10")],
	[(localize "STR_QUOTE_11"),(localize "STR_AUTHOR_11")],
	[(localize "STR_QUOTE_12"),(localize "STR_AUTHOR_12")],
	[(localize "STR_QUOTE_13"),(localize "STR_AUTHOR_13")],
	[(localize "STR_QUOTE_14"),(localize "STR_AUTHOR_14")],
	[(localize "STR_QUOTE_15"),(localize "STR_AUTHOR_15")],
	[(localize "STR_QUOTE_16"),(localize "STR_AUTHOR_16")],
	[(localize "STR_QUOTE_17"),(localize "STR_AUTHOR_17")],
	[(localize "STR_QUOTE_18"),(localize "STR_AUTHOR_18")],
	[(localize "STR_QUOTE_19"),(localize "STR_AUTHOR_19")],
	[(localize "STR_QUOTE_20"),(localize "STR_AUTHOR_20")],
	[(localize "STR_QUOTE_21"),(localize "STR_AUTHOR_21")],
	[(localize "STR_QUOTE_22"),(localize "STR_AUTHOR_22")],
	[(localize "STR_QUOTE_23"),(localize "STR_AUTHOR_23")],
	[(localize "STR_QUOTE_24"),(localize "STR_AUTHOR_24")],
	[(localize "STR_QUOTE_25"),(localize "STR_AUTHOR_25")],
	[(localize "STR_QUOTE_26"),(localize "STR_AUTHOR_26")],
	[(localize "STR_QUOTE_27"),(localize "STR_AUTHOR_27")],
	[(localize "STR_QUOTE_28"),(localize "STR_AUTHOR_28")],
	[(localize "STR_QUOTE_29"),(localize "STR_AUTHOR_29")],
	[(localize "STR_QUOTE_30"),(localize "STR_AUTHOR_30")],
	[(localize "STR_QUOTE_31"),(localize "STR_AUTHOR_31")],
	[(localize "STR_QUOTE_32"),(localize "STR_AUTHOR_32")],
	[(localize "STR_QUOTE_33"),(localize "STR_AUTHOR_33")],
	[(localize "STR_QUOTE_34"),(localize "STR_AUTHOR_34")],
	[(localize "STR_QUOTE_35"),(localize "STR_AUTHOR_35")],
	[(localize "STR_QUOTE_36"),(localize "STR_AUTHOR_36")],
	[(localize "STR_QUOTE_37"),(localize "STR_AUTHOR_37")],
	[(localize "STR_QUOTE_38"),(localize "STR_AUTHOR_38")],
	[(localize "STR_QUOTE_39"),(localize "STR_AUTHOR_39")],
	[(localize "STR_QUOTE_40"),(localize "STR_AUTHOR_40")],
	[(localize "STR_QUOTE_41"),(localize "STR_AUTHOR_41")],
	[(localize "STR_QUOTE_42"),(localize "STR_AUTHOR_42")],
	[(localize "STR_QUOTE_LAST"),(localize "STR_AUTHOR_LAST")]
];

diag_log format ["%1 --- TcB i_client.sqf processed",diag_ticktime];