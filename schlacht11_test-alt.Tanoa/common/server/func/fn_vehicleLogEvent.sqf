// by psycho
if (!isServer) exitWith {};
_vec = _this select 0;

if (isNil "_vec") exitWith {diag_log "undifened vehicle destroyed"};

_faction = (getText(configFile >> 'CfgVehicles' >> typeOf _vec >> 'faction'));
_name = (getText(configFile >> 'CfgVehicles' >> typeOf _vec >> 'displayName'));

_txt = format ['########## Fahrzeug zerstört: %1 %2 ##########', _faction, _name];
["opt_logEvent", _txt] call tcb_fnc_NetCallEvent;

true