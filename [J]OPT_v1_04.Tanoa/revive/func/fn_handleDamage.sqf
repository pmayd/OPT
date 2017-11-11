////////////////////////////////////////////////
// Handle Death
////////////////////////////////////////////////

// event handler that handles damage (obviously)
// if head or body damage exceeds the SRS_damageThreshold defined in fn_init.sqf, 
// then the player is knocked out.  Otherwise the total damage of the unit is tallied
// with each body part representing the following percentages:
// Head: 40%, Body: 40%, Legs: 10%, Hands: 10%
/*
 _this select 0 (unit): Object the event handler is assigned to

_this select 1 (hitSelection): Name of the selection where the unit was damaged. "" for over-all structural damage, "?" for unknown selections.

_this select 2 (damage): Damage to the above selection (sum of dealt and prior damage)

_this select 3 (source): The source unit that caused the damage

_this select 4 (projectile): Class name of the projectile that inflicted the damage ("" for unknown, such as falling damage)

_this select 5 (hitPartIndex): Hit part index of the hit point, -1 otherwise

_this select 6 (instigator): Person who pulled the trigger

_this select 7 (hitPoint): Hit point Cfg name 
*/
params ["_unit", "_hitSelection", "_damage", "_source", "_projectile", "_hitPartIndex", "_instigator", "_hitPoint"];

if (FAR_Debugging) then {
	systemChat format["Körperteil: %1 - Schaden: %2 (gesamt: %3)", _this select 1, _this select 2, damage (_this select 0)];
};

/*
_getTotalDamage = {
	_curUnit = _this select 0;

	_head  = _curUnit getHit "head";
	_body = _curUnit getHit "body";
	_legs  = _curUnit getHit "legs";
	_hands = _curUnit getHit "hands";

	_totalDamage = (_head * 0.4) + (_body * 0.4) + (_legs * 0.1) + (_hands * 0.1);
	//systemChat format["Gesamtschaden: %1 (%2, %3, %4, %5)", _totalDamage, _head * 0.4, _body * 0.4, _legs * 0.1, _hands * 0.1];

	if((_head >= SRS_damageThreshold) || (_body >= SRS_damageThreshold)) then{
		_totalDamage = SRS_damageThreshold;		// nie höher als 0.95!
	};
	_totalDamage	
};
*/
_return = 0;

// falls Einheit bewusstlos -> mache nichts, Schaden 0!
if ((_unit getVariable ["FAR_isUnconscious", 0]) == 1) then{
	_return = 0;
} else {
	
	switch(_hitSelection) do{

		// Kopf
		case "neck";
		case "head":{
			_return = 1.3 * _damage; // 30% erhöhter Schaden
		};

		// Extremitäten
		case "legs";
		case "hands";
		case "arms": {
			_return = 1.2 * _damage; // 20% erhöhter Schaden
		};

		// Gesamtschaden 
		/*
		case "": {
			// falls in Fahrzeug -> übernehme damage!
			if (vehicle _unit != _unit) then {
				_return = _damage;
			} else {
				_return = 0; // Gesamtschaden ignorieren -> one shot kill bug
			};
		};
		*/

		// alle anderen Teile
		default {
			_return = _damage;
		};

	};
		
	if(_return >= SRS_damageThreshold) then {				//Psycho, Inhalt in einen Framehandler auslagern um mehrfache Auslösung zu verhindern...
		_return = 0;
		if (FAR_Debugging) then {
			diag_log format["FAR REVIVE: Schadensgrenzwert überschritten für: %1", name _unit];
		};

		if (isNil "opt_addons_var_unconciousHandle" && !isNull _unit && isPlayer _unit && alive _unit) then {
			opt_addons_var_unconciousHandle = [_unit, _instigator] spawn opt_addons_fnc_Unconcious;
			// da Spieler nicht mehr sterben kann, muss Abschuss hier geloggt werden!
			["opt_eh_server_log_kill", [_unit, _instigator]] call CBA_fnc_serverEvent;
		};

	};

};

BIS_hitArray = _this; BIS_wasHit = True;
_return