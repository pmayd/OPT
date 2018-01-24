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
if (OPT_PARAM_TRAINING == 1) then {

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
			if (_x getVariable [QGVAR(isFlagMovable), false]) exitWith {_flag = _x};
		} foreach GVARMAIN(csat_flags) + GVARMAIN(nato_flags);

		if (_flag isEqualTo objNull) then {

			// check for flag nearby
			_obj = nearestObjects [_pos, ["FlagPole_F"], 50];
			if (count _obj == 0) exitWith {};

			_obj = _obj select 0;
			_obj setVariable [QGVAR(isFlagMovable), true];
			systemChat "Flagge kann verschoben werden. Platzieren mit erneutem ALT + Linksklick";
		} else {
			_flag setpos _pos;
			_flag setVariable [QGVAR(isFlagMovable), false];
			_marker = _flag getVariable QGVAR(flagMarker);
			_marker setMarkerPos _pos; // global new marker
		};
		
	}] call BIS_fnc_addStackedEventHandler;
};

// EH für Minensperre
#ifdef __MINE_FREE_FLAG__
	if (OPT_PARAM_MINE_FREE_FLAG == 1) then {

        GVAR(eh_ace_interactMenuClosed) = ["ace_interactMenuClosed", {
            _this spawn {
                _this params ["_menuType"];

                sleep 0.1;

                if (
                    _menuType == 1 and // Eigenmenü
                    {(_x distance player) <= __MINE_FREE_FLAG_RADIUS__} count (GVARMAIN(csat_flags) + GVARMAIN(nato_flags)) > 0 and 
                    ace_explosives_pfeh_running // explosive placing in progress
                ) then {
                    ace_explosives_placeAction = PLACE_CANCEL; // end explosive setup process
                    
                    // Warnhinweis
                    private _txt = SECTORCONTROL_MINE_FREE_FLAG_MESSAGE;
                    [QEGVAR(gui,message), ["Sperrzone", _txt, "red"]] call CBA_fnc_localEvent;

                };
            };

        }] call CBA_fnc_addEventHandler;
	};
#endif
