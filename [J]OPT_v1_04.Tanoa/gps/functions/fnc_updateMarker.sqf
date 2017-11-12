/**
* Author: James
* main script, called each frame when missionEH "Map" is activateAddons
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_updateMarker.sqf;
*
*/
#include "script_component.hpp"

#define PLAYER_SIDE(var1) [var] call EFUNC(common,getPlayerSide)

private _westplayer = [];
private _eastplayer = [];
private _leadergroupwest=[];
private _leadergroupeast=[];
private _gruppeinheitenwest=[];	
private _gruppeinheiteneast=[];

// add all leaders from all groups		
{
    private _leader = leader _x;
    private _side = PLAYER_SIDE(_leader);

    if (_side == west) then {	
        _leadergroupwest pushBack _leader;

        // if player is leader, add all units
        if (_leader == player) then {
            _gruppeinheitenwest append (units _x);
        };
    };	

    if (_side == east) then {
        _leadergroupeast pushBack _leader;

        // if player is leader, add all units
        if (_leader == player) then {
            _gruppeinheiteneast append (units _x);
        };
    };			
		
} forEach allGroups;

// mode 0: only add other group leaders
if (GVAR(mode) == 0) then {					
    _westplayer append _leadergroupwest;
    _eastplayer append _leadergroupeast;
};

// mode 1: mode 0 + add all group units for leaders
if (GVAR(mode) == 1) then {		
    _westplayer append _leadergroupwest;
    _eastplayer append _leadergroupeast;
            
    _westplayer append _gruppeinheitenwest;
    _eastplayer append _gruppeinheiteneast;
};		

// mode 2: mode 1 + all other units   
if (GVAR(mode) == 2) then {
    {
        private _side = PLAYER_SIDE(_x);
        if (_side == west) then {
            _westplayer pushBack _x;
        };

        if (_side == east) then {
            _eastplayer pushBack _x;
        };
    } foreach allUnits;	// Drohnen für HL sichtbar machen
};					
//systemChat format ["G:%1",_westplayer];
                            
if (PLAYER_SIDE(player) == west) then {

    // create or update player marker
    private _marker = [] call FUNC(createPlayerMarker);
    _marker setmarkerposlocal (getPosATLVisual (vehicle player));		

    {
        private _obj = _x;
        private _marker = [_x] call FUNC(createUnitMarker);	

        //systemChat format ["O:%1",_obj];
        if (alive _obj) then {
            private _name = [_obj] call EFUNC(log,getPlayerName);

            // create or update unit marker
            _marker setmarkerposlocal (getPosATLVisual (vehicle _obj));
            _marker setmarkerdirlocal (getDirVisual (vehicle _obj));

            // Fahrzeuginfo
            if (vehicle _obj != _obj) then {
                private _vec_name = getText (configFile >> "cfgVehicles" >> typeOf (vehicle _obj) >> "displayName");

                // Spezialfall Drohne
                if ((vehicle _obj) in allUnitsUAV) then {
                    private _operator = (UAVControl vehicle _obj) select 0;

                    // UAV Operator ja/nein
                    if (!isNull _operator) then {
                        _marker setmarkertextlocal format ["%1 (%2)", _vec_name, name _operator];
                    } else {
                        _marker setmarkertextlocal format ["%1 (---)", _vec_name];
                    };
                } else {
                    _marker setmarkerTextLocal format["%1 (%2)", _vec_name, _name];
                };
                
            } else {
                if (isPlayer _obj) then {
                    _marker setmarkertextlocal format ["%1", _name];
                } else {
                    _marker setmarkertextlocal "";
                    _marker setMarkerPosLocal [0,0];
                };
            };
        } else  {
            deleteMarkerLocal _marker;
        };	
    } forEach (_westplayer - [player]);

};

if (PLAYER_SIDE(player) == east) then {

     // create or update player marker
    private _marker = [] call FUNC(createPlayerMarker);
    _marker setmarkerposlocal (getPosATLVisual (vehicle player));		

    {
        private _obj = _x;
        _marker = [_x] call FUNC(createUnitMarker);

        if (alive _obj) then {
            private _name = [_obj] call EFUNC(log,getPlayerName);

            _marker setmarkerposlocal (getPosATLVisual (vehicle _obj));
            _marker setmarkerdirlocal (getDirVisual (vehicle _obj));

            // Fahrzeuginfo
            if (vehicle _obj != _obj) then {

                private _vec_name = getText (configFile >> "cfgVehicles" >> typeOf (vehicle _obj) >> "displayName");

                // Spezialfall Drohne
                if ((vehicle _obj) in allUnitsUAV) then {
                    private _operator = (UAVControl vehicle _obj) select 0;

                    // UAV Operator ja/nein
                    if (!isNull _operator) then {
                        _marker setmarkertextlocal format ["%1 (%2)", _vec_name, name _operator];
                    } else {
                        _marker setmarkertextlocal format ["%1 (---)", _vec_name];
                    };
                } else {
                    _marker setmarkerTextLocal format["%1 (%2)", _vec_name, _name];
                };

            } else {
                if (isPlayer _obj) then {
                    _marker setmarkertextlocal format ["%1", _name];
                } else {
                    _marker setmarkertextlocal "";
                    _marker setMarkerPosLocal [0,0];
                };
            };

        } else {
            _marker setmarkerposlocal [0,0];
        };	

    } forEach (_eastplayer - [player]);

};