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
if (EGVAR(training,on)) then {

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
if (GVAR(flagFreeMineZoneOn)) then {

    GVAR(eh_ace_interactMenuClosed) = ["ace_interactMenuClosed", {
        _this spawn {
            _this params ["_menuType"];

            sleep 0.1;

            if (
                _menuType == 1 and // Eigenmenü
                ace_explosives_pfeh_running // explosive placing in progress
            ) then {
                waitUntil { ace_explosives_placeAction == PLACE_APPROVE; }; // wait until explosive was placed by player

                private _explosive = nearestObject [player, "ACE_Explosives_Place"];

                // allow satchel and charge
                if ((typeOf _explosive) find "SatchelCharge" != -1 or (typeOf _explosive) find "DemoCharge" != -1) exitWith {};    

                // only if near flag
                if ({_explosive distance _x <= GVAR(flagFreeMineZoneRadius)} count (GVARMAIN(nato_flags) + GVARMAIN(csat_flags)) == 0) exitWith {};

                deleteVehicle _explosive;    
                // Warnhinweis
                private _txt = SECTORCONTROL_MINE_FREE_FLAG_MESSAGE;
                ["Sperrzone", _txt, "red"] call EFUNC(gui,message);

            };
        };

    }] call CBA_fnc_addEventHandler;
};

