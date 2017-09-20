////////////////////////////////////////////////
// Stabilize Player
////////////////////////////////////////////////

params ["_injuredperson", "_healer"];


if (_healer getVariable ["FAR_isUnconscious",0] == 1) exitWith {};
_injuredperson setVariable ["tcb_healer", _healer, true];
tcb_healerStopped = false;

_healer selectWeapon primaryWeapon _healer;
sleep 1;
_healer playAction "medicStart";
tcb_animDelay = time + 2;

private "_animChangeEVH";
if (isPlayer _healer) then {
	_animChangeEVH = _healer addEventhandler ["AnimChanged", {
		params ["_healer", "_anim"];

		// Wenn Spieler zu Waffe greift -> beende Animation und Vorgang
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


private _offset = [0,0,0]; _dir = 0;
private _relpos = _healer worldToModel position _injuredperson;
if((_relpos select 0) < 0) then{_offset=[-0.2,0.7,0]; _dir=90} else{_offset=[0.2,0.7,0]; _dir=270};
_injuredperson attachTo [_healer,_offset];
_injuredperson setDir _dir;

private _time = time;

private _skill_factor = if (_healer call opt_addons_fnc_isMedic) then {10+(random 5)} else {20+(random 10)};
private _damage = (damage _injuredperson * _skill_factor);
if (_damage < 13) then {_damage = 13};
sleep 1;

// solange Zeit nicht abgelaufen, 
// beide am Leben, 
// Abstand zu Patient kleiner 2m,
// Heiler nicht bewusstlos und 
// Animation nicht abgebrochen
// -> aktualisiere Fortschrittsbalken
while {
	time - _time < _damage
	&& {alive _healer}
	&& {alive _injuredperson}
	&& {(_healer distance _injuredperson) < 2}
	&& {_healer getVariable "FAR_isUnconscious" == 0}
	&& {!tcb_healerStopped}
} do {
	sleep 0.5;
	if (isPlayer _healer) then {["Versuche zu stabilisieren",((time - _time) / (_damage)) min 1] spawn opt_addons_fnc_progressBar};
};

if (isPlayer _healer) then {_healer removeEventHandler ["AnimChanged", _animChangeEVH]};
detach _healer;
detach _injuredperson;

_healer playAction "medicStop";

	
if (!alive _injuredperson) exitWith {["Für diesen Kameraden kommt jede Hilfe zu spät.",0, 0.035 * safezoneH + safezoneY,5,0.3] spawn BIS_fnc_dynamicText};
if (!alive _healer) exitWith {_injuredperson setVariable ["tcb_healer", ObjNull, true]};
_injuredperson setVariable ["tcb_healer", ObjNull, true];

if (!tcb_healerStopped) then {
	if (time - _time > _damage) then {
		_injuredperson setVariable ["FAR_isStabilized", 1, true];
		_injuredperson setVariable ["FAR_isDragged", 0, true];

        private _message = format [
            "%1 (%2) wurde von %3 (%4) stabilisiert.", 
            name _injuredperson, 
            _injuredperson getVariable "opt_var_playerSide",
            name _healer,
            _healer getVariable "opt_var_playerSide"
        ];

        // übergib Kategorie und Nachricht an log-Funktion
	    ["opt_eh_server_log_write", ["Revive", _message]] call CBA_fnc_serverEvent;

	};
} else {
	["Du hast den Vorgang abgebrochen.",0, 0.035 * safezoneH + safezoneY,5,0.3] spawn BIS_fnc_dynamicText;
};


true