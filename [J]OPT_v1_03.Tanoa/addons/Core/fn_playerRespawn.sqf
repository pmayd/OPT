player setVariable ["tf_unable_to_use_radio", false];
player setVariable ["tf_voiceVolume", 1.0, true];
opt_EarPlugs = 1;
//opt_Satchel = objNull;		is grad raus
0 fadeSound 1;

/*
if (isNil "opt_first_run") then {
	opt_first_run = true;
} else {
	["playerChanged", [player, OPT_Core_realPlayer]] call AME_Core_fnc_triggerEvent;
	[player, [missionNamespace, "tcb_inv"]] call BIS_fnc_loadInventory;
};
*/

[player, [missionNamespace, "tcb_inv"]] call BIS_fnc_loadInventory;


if (dialog) then {
	[] spawn {
		while {dialog} do {
			closeDialog 5566;
			closeDialog 5651;
			closeDialog 0;
		};
	};
};

[] spawn {
	titleCut ["","BLACK IN", 4];
	"dynamicblur" ppeffectenable true;
	"dynamicblur" ppeffectadjust [5];
	"dynamicblur" ppeffectcommit 0;
	"dynamicblur" ppeffectadjust [0];
	"dynamicblur" ppeffectcommit 5;
};

//{
//	deleteVehicle _x;
//	true
//} count opt_player_satchels;
//opt_player_satchels = [];