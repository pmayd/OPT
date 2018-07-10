/**
* Author: James
* main radar script, runs in stackedEH environment
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_runRadarEast.sqf;
*
*/
#include "script_component.hpp"

private _container = [] call FUNC(getRadar);
private _size = 3500;
private _markerwest = [];
private _markerost = [];
private _objekteDF = 350;
private _Geschwindigkeitkapp = 275;
private _Geschwindigkeitfaktor = 5;

for "_i" from 1 to 10 do {
	private _marker = [
        format["%1_%2", QGVAR(contact_marker_west), _i],
        [0,0],
        "mil_dot",
        "",
        [1,1],
        "ICON",
        "ColorBlue",
        "Solid",
        0,
        0,
        false
    ] call EFUNC(common,createMarker);
	_markerwest pushBack _marker;
};

for "_i" from 1 to 10 do {
	private _marker = [
        format["%1_%2", QGVAR(contact_marker_east), _i],
        [0,0],
        "mil_dot",
        "",
        [1,1],
        "ICON",
        "ColorRed",
        "Solid",
        0,
        0,
        false
    ] call EFUNC(common,createMarker);
	_markerost pushBack _marker;
};

private _Radarring = [
    QGVAR(contact_marker_ring),
    [0,0],
    "",
    "",
    [0,0],
    "ELLIPSE",
    "ColorGrey",
    "Border",
    0,
    0,
    false
] call EFUNC(common,createMarker);

private _RadarZONE = createTrigger ["EmptyDetector", getPos _container];
_RadarZONE setTriggerArea [_size, _size, 0, false, 0];
_RadarZONE setTriggerActivation ["ANY", "PRESENT", true];
_RadarZONE setTriggerStatements ["this", "", ""];

[QGVAR(radarActiveEH), "onEachFrame", {
    params  ["_container", "_Radarring", "_RadarZONE", "_markerost", "_markerwest", "_size"];
    private _Radaranzeige = [];

    if (damage _container > GVAR(maxDammage)) exitWith {

        [QGVAR(radarActiveEH), "onEachFrame"] call BIS_fnc_removeStackedEventHandler;

        {deleteMarker _x;} foreach _markerost;
        {deleteMarker _x;} foreach _markerwest;
        deleteMarker _Radarring;
        deleteVehicle _RadarZONE;
        // delete objects around container - James
        [] call FUNC(undeployRadar);

        removeAllActions _container;

        // remove ACE dragging entries
        ["cargo", "deactivateDragging", [GVAR(containerEast)], false] remoteExecCall [QEFUNC(common,execFunc), 0, true]; // has to be called on each client and also JIP
    };

    // reset all marker
    {

        if (markerAlpha _x != 0) then {
            _x setMarkerAlphaLocal 0;
        };

    } forEach (_markerost + _markerwest);

    if !(_container getVariable [QGVAR(isDeployed), false]) then {
        _Radarring setMarkerAlphaLocal 0;

    } else {
        
        if (markerAlpha _Radarring == 0) then {
            _Radarring setMarkerPosLocal getPos _container;
            _Radarring setMarkerSizeLocal [_size, _size];
            _Radarring setMarkerAlphaLocal 1;

            _RadarZONE setPos getPos _container;
        };       
       
        private _units = list _RadarZONE;
        
        private _signalLoss = [false] call FUNC(calcSignalLoss);

        {
            
            if ((_x iskindof "AIR") and ((275 - ((getPos _x select 2) * (5 - _signalLoss))) < (speed _x))) then { 
                _Radaranzeige pushBack _x;
            };	
        
        //systemChat format ["X:%1 R:%2 B1:%3 B2:%4",_x,_Radaranzeige,(_x iskindof "AIR"),((275 - ((getPos _x select 2)*(5 - _signalLoss)))< (speed _x))];	
        } forEach _units;
        
        if (count _Radaranzeige > 0) then	{
            for "_i" from 0 to (count _Radaranzeige - 1) do {
                _obj = _Radaranzeige select _i;

                //systemChat format ["O:%1 OS:%2 B1:%3 B2:%4",_obj,side _obj,((side _obj) == east),(_obj iskindof "Helicopter")];
                if (side _obj == east) then {
                    _marker = _markerost select _i;

                    if ((_obj iskindof "Helicopter") and !(_obj iskindof "OPT_O_UAV_01_F") and !(_obj iskindof "Steerable_Parachute_F")) then {
                        _marker setMarkerPosLocal (getPosATLVisual (vehicle _obj));
                        _marker setMarkerTypeLocal "b_air";
                        _marker setMarkerAlphaLocal 1;
                        //systemChat format ["O:%1 M:%2 P:%3",_obj,_marker,(getPosATLVisual (vehicle _obj))];					
                    };

                    if (_obj iskindof "Plane") then {
                        _marker setMarkerPosLocal (getPosATLVisual (vehicle _obj));
                        _marker setMarkerTypelocal "b_plane";
                        _marker setMarkerAlphaLocal 1;
                    };	
                };
                if (side _obj == west) then {
                    _marker = _markerwest select _i;		

                    if ((_obj iskindof "Helicopter") and !(_obj iskindof "OPT_B_UAV_01_F") and !(_obj iskindof "Steerable_Parachute_F")) then {
                        _marker setMarkerPosLocal (getPosATLVisual (vehicle _obj));
                        _marker setMarkerTypelocal "b_air";
                        _marker setMarkerAlphaLocal 1;
                    };

                    if (_obj iskindof "Plane") then {
                        _marker setMarkerPosLocal (getPosATLVisual (vehicle _obj));
                        _marker setMarkerTypelocal "b_plane";
                        _marker setMarkerAlphaLocal 1;
                    };
                    
                };
            };
        };
    };

}, [_container, _Radarring, _RadarZONE, _markerost, _markerwest, _size]] call BIS_fnc_addStackedEventHandler;

