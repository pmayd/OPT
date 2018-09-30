/**
* Author: James
* process unit marker during update marker loop.
* Create or update unit marker and set marker text.
*
* Arguments:
* 0: <OBJECT> unit to be processed
*
* Return Value:
* None
*
* Example:
* [player] call fnc_processUnitMarker.sqf;
*
* Server only:
* no
*
* Public:
* no - called within updateMarker function
*
* Global:
* no - process each unit marker only locally for the client
*/
#include "script_component.hpp"

/* PARAMS */
params [
    ["_unit", objNull, [objNull], 1]
];

/* VALIDATION */
if (_unit isEqualTo objNull) exitWith{};

/* CODE BODY */
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
        // add group ID to leader marker
        if (isPlayer _unit) then {
            if (leader _unit isEqualTo _unit) then {
                _marker setMarkerTextLocal format ["%1 (%2)", _name, groupID (group _unit)];
            } else {
                _marker setMarkerTextLocal format ["%1", _name];
            };
            
        } else {
            [_unit, QGVAR(unitGPSMarker)] call EFUNC(common,clearMarker);
        };
    };
} else  {
    [_unit, QGVAR(unitGPSMarker)] call EFUNC(common,clearMarker);
};    
