// by psycho
// handle spectating system
#include "\A3\ui_f\hpp\defineDIKCodes.inc"

if !(["IsInitialized"] call BIS_fnc_EGSpectator) then {
	["Initialize", [player, [], !isMultiplayer]] call BIS_fnc_EGSpectator;
	("exit_spect" call BIS_fnc_rscLayer) cutText ["To exit spectating press X or ESC", "PLAIN"];
} else {
	["Terminate"] call BIS_fnc_EGSpectator;
	player allowDammage true;
};


0 spawn {
	sleep 0.2;
	private "_disp";
	_disp = ["GetDisplay"] call BIS_fnc_EGSpectator;
	tcb_spect_handler = _disp displayAddEventHandler ["KeyDown", {
		if (param [1] in [DIK_X,DIK_ESCAPE]) then {
			_disp displayRemoveEventHandler ["KeyDown" ,tcb_spect_handler];
			["Terminate"] call BIS_fnc_EGSpectator;
			("exit_spect" call BIS_fnc_rscLayer) cutText ["", "PLAIN"];
			player allowDammage true;
			true
		} else {
			false
		};
	}];
};