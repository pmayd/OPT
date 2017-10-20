/**
* Author: James
* EH for players
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_initPlayerEH.sqf;
*
*/
#include "script_component.hpp"

/* EH für das Versetzen der Flaggen im Trainingsmodus */
if (OPT_TRAINING == 1) then {

	// use stackedEH, cannot override default behavior
	[QGVAR(move_flag), "onMapSingleClick", {
		/*
	    units: Array - leader selected units, same as groupSelectedUnits (same as _units param)
	    pos: Array - world Position3D of the click in format [x,y,0] (same as _pos param)
	    alt: Boolean - true if Alt key was pressed (same as _alt param)
	    shift: Boolean - true if Shift key was pressed (same as _shift param)
		*/

		// exit if no alt key was pressed
		if (!_alt) exitWith {};

		// if alt key was pressed -> was a flag chosen or should a flag be moved?
		// is there a flag that should be moved?
		_flag = objNull;
		{
			if (_x getVariable ["opt_var_flag_moveFlag", false]) exitWith {_flag = _x};
		} foreach GVARMAIN(csat_flags) + GVARMAIN(nato_flags);

		if (_flag isEqualTo objNull) then {

			// check for flag nearby
			_obj = nearestObjects [_pos, ["FlagPole_F"], 50];
			if (count _obj == 0) exitWith {};

			_obj = _obj select 0;
			_obj setVariable ["opt_var_flag_moveFlag", true];
			systemChat "Flagge kann verschoben werden. Platzieren mit erneutem ALT + Linksklick";
		} else {
			_flag setpos _pos;
			_flag setVariable ["opt_var_flag_moveFlag", false];
			_marker = _flag getVariable "opt_var_flag_marker";
			_marker setMarkerPos _pos; // global new marker
		};
		
	}] call BIS_fnc_addStackedEventHandler;
};


// EH für Minensperre
#ifdef __MINE_FREE_FLAG__
	if (OPT_MINE_FREE_FLAG == 1) then {

		player addEventHandler ["FiredMan", {
			/* 
			    0 unit: Object - Unit the event handler is assigned to (the instigator)
		        1 weapon: String - Fired weapon
                2 muzzle: String - Muzzle that was used
                3 mode: String - Current mode of the fired weapon
                4 ammo: String - Ammo used
                5 magazine: String - magazine name which was used
                6 projectile: Object - Object of the projectile that was shot out
                7 vehicle: Object - Vehicle, if weapon is vehicle weapon, otherwise objNull
    	    */
            if (_this select 1 == "Put" && ({(_x distance player) <= __MINE_FREE_FLAG_RADIUS__} count (GVARMAIN(csat_flags) + GVARMAIN(nato_flags)) > 0)) then {
                // lösche Mine
                deleteVehicle (_this select 6);
                // gib Spieler Mine zurück
                player addMagazine (_this select 5);
                // Warnhinweis
                _txt = "Mine in der Minensperrzone gelegt!<br/>Mine wurde zurück ins Inventar gelegt.";
                [QEGVAR(gui,message), ["Sperrzone", _txt, "red"]] call CBA_fnc_localEvent;
    	    };  

		}];

	};
#endif

