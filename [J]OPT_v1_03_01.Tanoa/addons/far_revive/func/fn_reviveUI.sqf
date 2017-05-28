private ["_dialog","_labelwidth","_labelpos","_tick"];

_labelwidth = -1;
_labelpos = [];
_tick = 0;

#define BAR_CONTROL ((findDisplay 5566) displayCtrl 6699)
#define BAR_CONTROL_POS (ctrlPosition ((findDisplay 5566) displayCtrl 6699))

_dialog = createDialog "GREUH_respawn";
waitUntil {dialog};


while {dialog && alive player} do {
	if (!isNil "public_bleedout_message" && !isNil "public_bleedout_timer") then {
		if (_labelwidth == -1) then {
			_labelwidth = BAR_CONTROL_POS select 2;
		};
		
		_labelpos = [BAR_CONTROL_POS select 0, BAR_CONTROL_POS select 1, _labelwidth * (public_bleedout_timer / FAR_BleedOut), BAR_CONTROL_POS select 3];
		BAR_CONTROL ctrlSetPosition _labelpos;
		ctrlSetText [5567, public_bleedout_message];

		if (public_bleedout_timer <= 30) then {
			((findDisplay 5566) displayCtrl 5567) ctrlSetTextColor [1, 0, 0, 1];
			if (public_bleedout_timer % 2 == 0) then {
				((findDisplay 5566) displayCtrl 6698) ctrlSetTextColor [1, 0, 0, 1];
			} else {
				((findDisplay 5566) displayCtrl 6698) ctrlSetTextColor [1, 1, 1, 1];
			}
		} else {
			((findDisplay 5566) displayCtrl 5567) ctrlSetTextColor [1, 1, 1, 1];
		};
		
		BAR_CONTROL ctrlCommit 0.5;
		((findDisplay 5566) displayCtrl 6698) ctrlCommit 0.5;
	};
	
	if (_tick % 10 == 0) then {
		[10000] call BIS_fnc_bloodEffect;
	};
	
	_tick = _tick + 1;
	sleep 0.25;
};