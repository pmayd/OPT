/**
* Description:
* client GPS. Create map marker for leader of all groups and own squad members.
* all marker are local
* 
* Author: 
* [GNC]Lord-MDB & James
*
* Arguments:
* None
*
* Return Value:
* None
*
* Server only:
* no
*
* Public:
* no
*
* Global:
* no
*
* Sideeffects:
* create local marker
* 
* Example:
* [] spawn EFUNC(gps,gps);
*
*/
#include "script_component.hpp"

/* PARAMS */

/* VALIDATION */

/* CODE */
// default GPS mode: all squad units are visible
GVAR(mode) = 1;

// GPS mode: all units are visible in mode 2
if (typeOf player in GVARMAIN(officer) and GVAR(showAllUnits)) then {
    GVAR(mode) = 2;

};

// create 80 local empty marker for units of player side
private _markerPool = [];
for "_i" from 1 to 80 do {
    _markerPool pushBack ([PLAYER_SIDE, _i] call FUNC(createUnitMarker));

};    

// create special local player marker
private _markerplayer = [] call FUNC(createPlayerMarker);

sleep 1;

while {true} do {

    private _unitsToMark = [] call FUNC(selectUnits);

    // move all marker to origin and hide them
    {
        _x setMarkerPosLocal [0,0];
        _x setMarkerAlphaLocal 1;
    
    } foreach _markerPool;

    // update player marper
    _markerplayer setMarkerPosLocal (getPosATLVisual (vehicle player));        

    if ((count _unitsToMark) > 0) then {
        for "_i" from 0 to (count _unitsToMark - 1) do {   
            private _obj = _unitsToMark select _i;
            private _marker = _markerPool select _i;        

            if (alive _obj) then {
                private _name = UNIT_NAME(_obj);

                // update unit marker
                _marker setMarkerPosLocal (getPosATLVisual (vehicle _obj));
                _marker setMarkerDirLocal (getDirVisual (vehicle _obj));
                _marker setMarkerAlphaLocal 0.6;

                // vehicle info
                if (vehicle _obj != _obj) then {

                    private _vec_name = getText (configFile >> "cfgVehicles" >> typeOf (vehicle _obj) >> "displayName");

                    // Spezialfall Drohne
                    if ((vehicle _obj) in allUnitsUAV) then {
                        private _operator = (UAVControl vehicle _obj) select 0;

                        // UAV Operator ja/nein
                        if (!isNull _operator) then {
                            _marker setMarkerTextLocal format["%1 (%2)", _vec_name, UNIT_NAME(_operator)];

                        } else {
                            _marker setMarkerTextLocal format["%1 (---)", _vec_name];

                        };

                    } else {
                        _marker setMarkerTextLocal format["%1 (%2)", _vec_name, _name];

                    };

                } else {
                    if (isPlayer _obj) then {
                        if (_obj isEqualTo (leader _obj)) then {
                            _marker setMarkerTextLocal format["%1 (%2)", _name, {alive _x} count units _obj];
                            _marker setMarkerSizeLocal [0.9, 0.9];


                        } else {
                            _marker setMarkerTextLocal _name;

                        };

                    } else {
                        _marker setMarkerTextLocal "";
                        _marker setMarkerPosLocal [0,0];
                        _marker setMarkerAlphaLocal 1;

                    };

                };
            } else {
                _marker setMarkerTextLocal "";
                _marker setMarkerPosLocal [0,0];
                _marker setMarkerAlphaLocal 1;

            };
        };
    };    

    sleep GVAR(updateInterval);
};
