/**
* Author: James
* main GPS script, running looped in the background with specified interval
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

while {true} do {

    if (visibleMap or visibleGPS) then {
        private _westplayer = [];
        private _eastplayer = [];
        private _leadergroupwest=[];
        private _leadergroupeast=[];
        private _gruppeinheitenwest=[];    
        private _gruppeinheiteneast=[];

        // add all leaders from all groups        
        {
            private _leader = leader _x;
            private _side = UNIT_SIDE(_leader);

            if (_side == west) then {    
                _leadergroupwest pushBack _leader;

                if (player in units _leader) then {
                    _gruppeinheitenwest append (units _x);
                };

            };    

            if (_side == east) then {
                _leadergroupeast pushBack _leader;

                if (player in units _leader) then {
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
                private _side = UNIT_SIDE(_x);
                if (_side == west) then {
                    _westplayer pushBack _x;
                };

                if (_side == east) then {
                    _eastplayer pushBack _x;
                };
            } foreach allPlayers;    // Drohnen für HL sichtbar machen
        };                    

        if (PLAYER_SIDE == west) then {

            // create or update player marker
            private _marker = [] call FUNC(createPlayerMarker);
            _marker setMarkerPosLocal (getPosATLVisual (vehicle player));        

            {
                private _unit = _x;

                //systemChat format ["O:%1",_unit];
                if (alive _unit and _unit getVariable ["FAR_isUnconscious", 0] == 0) then {
                    private _marker = [_unit] call FUNC(createUnitMarker);
                    private _name = UNIT_NAME(_unit);
                    
                    // create or update unit marker
                    _marker setMarkerPosLocal (getPosATLVisual (vehicle _unit));
                    _marker setMarkerDirLocal (getDirVisual (vehicle _unit));
                    
                    // Fahrzeuginfo
                    if (vehicle _unit != _unit) then {
                        private _vec_name = getText (configFile >> "cfgVehicles" >> typeOf (vehicle _unit) >> "displayName");

                        // Spezialfall Drohne
                        if ((vehicle _unit) in allUnitsUAV) then {
                            private _operator = (UAVControl vehicle _unit) select 0;

                            // UAV Operator ja/nein
                            if (!isNull _operator) then {
                                _marker setMarkerTextLocal format ["%1 (%2)", _vec_name, name _operator];
                            } else {
                                _marker setMarkerTextLocal format ["%1 (---)", _vec_name];
                            };
                        } else {
                            _marker setMarkerTextLocal format["%1 (%2)", _vec_name, _name];
                        };
                        
                    } else {
                        if (isPlayer _unit) then {
                            _marker setMarkerTextLocal format ["%1", _name];
                        } else {
                            [_unit] call FUNC(clearMarker);
                        };
                    };
                } else  {
                    [_unit] call FUNC(clearMarker);
                };    
            } forEach _westplayer;

        };

        if (PLAYER_SIDE == east) then {

            // create or update player marker
            private _marker = [] call FUNC(createPlayerMarker);
            _marker setMarkerPosLocal (getPosATLVisual (vehicle player));        

            {
                private _unit = _x;
                
                if (alive _unit and _unit getVariable ["FAR_isUnconscious", 0] == 0) then {
                    _marker = [_unit] call FUNC(createUnitMarker);
                    private _name = UNIT_NAME(_unit);
                    
                    // create or update unit marker
                    _marker setMarkerPosLocal (getPosATLVisual (vehicle _unit));
                    _marker setMarkerDirLocal (getDirVisual (vehicle _unit));
                    
                    // Fahrzeuginfo
                    if (vehicle _unit != _unit) then {

                        private _vec_name = getText (configFile >> "cfgVehicles" >> typeOf (vehicle _unit) >> "displayName");

                        // Spezialfall Drohne
                        if ((vehicle _unit) in allUnitsUAV) then {
                            private _operator = (UAVControl vehicle _unit) select 0;

                            // UAV Operator ja/nein
                            if (!isNull _operator) then {
                                _marker setMarkerTextLocal format ["%1 (%2)", _vec_name, name _operator];
                            } else {
                                _marker setMarkerTextLocal format ["%1 (---)", _vec_name];
                            };
                        } else {
                            _marker setMarkerTextLocal format["%1 (%2)", _vec_name, _name];
                        };

                    } else {
                        if (isPlayer _unit) then {
                            _marker setMarkerTextLocal format ["%1", _name];
                        } else {
                            [_unit] call FUNC(clearMarker);
                        };
                    };

                } else {
                    [_unit] call FUNC(clearMarker);
                };   

            } forEach _eastplayer;

        };
    };

    sleep GVAR(updateInterval);
};
