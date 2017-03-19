////////////////////////////////////////////////
// Stabilize Player
////////////////////////////////////////////////
private ["_injuredperson","_healer","_relpos","_dir","_offset","_time","_damage","_animChangeEVH","_skill_factor"];
_injuredperson = _this select 0;
_healer = _this select 1;

if (_healer getVariable ["FAR_isUnconscious",0] == 1) exitWith {};
_injuredperson setVariable ["tcb_healer", _healer, true];
tcb_healerStopped = false;

_healer selectWeapon primaryWeapon _healer;
sleep 1;
_healer playAction "medicStart";
tcb_animDelay = time + 2;

if (isPlayer _healer) then {
	_animChangeEVH = _healer addEventhandler ["AnimChanged", {
		private ["_anim","_healer"];
		_healer = _this select 0;
		_anim = _this select 1;
		if (primaryWeapon _healer != "") then {
			if (time >= tcb_animDelay) then {tcb_healerStopped = true};
		} else {
			if (_anim in ["amovpknlmstpsnonwnondnon","amovpknlmstpsraswlnrdnon"]) then {
				_healer playAction "medicStart";
			} else {
				if (!(_anim in ["ainvpknlmstpsnonwnondnon_medic0s","ainvpknlmstpsnonwnondnon_medic"])) then {
					if (time >= tcb_animDelay) then {tcb_healerStopped = true};
				};
			};
		};	
	}];
};

_offset = [0,0,0]; _dir = 0;
_relpos = _healer worldToModel position _injuredperson;
if((_relpos select 0) < 0) then{_offset=[-0.2,0.7,0]; _dir=90} else{_offset=[0.2,0.7,0]; _dir=270};
_injuredperson attachTo [_healer,_offset];
_injuredperson setDir _dir;

_time = time;

_skill_factor = if (_healer call opt_addons_fnc_isMedic) then {10+(random 5)} else {20+(random 10)};
_damage = (damage _injuredperson * _skill_factor);
if (_damage < 13) then {_damage = 13};
sleep 1;
while {
	time - _time < _damage
	&& {alive _healer}
	&& {alive _injuredperson}
	&& {(_healer distance _injuredperson) < 2}
	&& {_healer getVariable "FAR_isUnconscious" == 0}
	&& {!tcb_healerStopped}
} do {
	sleep 0.5;
	if (isPlayer _healer) then {["Try to stabilize",((time - _time) / (_damage)) min 1] spawn opt_addons_fnc_progressBar};
};

if (isPlayer _healer) then {_healer removeEventHandler ["AnimChanged", _animChangeEVH]};
detach _healer;
detach _injuredperson;

if (alive _healer && {_healer getVariable "FAR_isUnconscious" > 0}) then {
	_healer playAction "medicStop";
};
	
if (!alive _injuredperson) exitWith {["It's already to late for this guy.",0, 0.035 * safezoneH + safezoneY,5,0.3] spawn BIS_fnc_dynamicText};
if (!alive _healer) exitWith {_injuredperson setVariable ["tcb_healer", ObjNull, true]};
_injuredperson setVariable ["tcb_healer", ObjNull, true];

if (!tcb_healerStopped) then {
	if (time - _time > _damage) then {
		_injuredperson setVariable ["FAR_isStabilized", 1, true];
		_injuredperson setVariable ["FAR_isDragged", 0, true];
	};
} else {
	["You has stopped the process.",0, 0.035 * safezoneH + safezoneY,5,0.3] spawn BIS_fnc_dynamicText;
};


true