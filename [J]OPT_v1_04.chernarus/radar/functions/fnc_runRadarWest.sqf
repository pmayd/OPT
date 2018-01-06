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
* [parameter] call fnc_runRadarWest.sqf;
*
*/
#include "script_component.hpp"
if (playerSide == east) exitwith { false };

private _container = GVAR(containerWest);
private _size = 3500;
private _markerwest = [];
private _markerost = [];


for "_i" from 1 to 10 do {
	private _marker1 = createMarkerLocal [format["W%1AIR%2", _i, west],[0,0]];
	_markerwest pushBack _marker1;
	_marker1 setMarkerTypeLocal "mil_dot";
	_marker1 setMarkerColorLocal "ColorBlue";
	_marker1 setMarkerSizeLocal [1, 1];
};

for "_i" from 1 to 10 do {
	private _marker2 = createMarkerLocal [format["E%1AIR%2", _i, west],[0,0]];
	_markerost pushBack _marker2;
	_marker2 setMarkerTypeLocal "mil_dot";
	_marker2 setMarkerColorLocal "ColorRed";
	_marker2 setMarkerSizeLocal [1, 1];
};

private _Radarring = createMarkerLocal [format["Radarring%1", west],[0,0]];
_Radarring setMarkerShapeLocal "ELLIPSE";
_Radarring setMarkerBrushLocal "Border";
_Radarring setMarkerColorLocal "ColorGrey";
_Radarring setMarkerSizeLocal [0, 0];

private _RadarZONE = createTrigger ["EmptyDetector", (getpos _container)];
_RadarZONE setTriggerArea [_size, _size, 0, false, 0];
_RadarZONE setTriggerActivation ["ANY", "PRESENT", true];
_RadarZONE setTriggerStatements ["this", "", ""];

sleep 1;

[QGVAR(radarWestActive), "onEachFrame", {
    params  ["_container", "_Radarring", "_RadarZONE", "_markerost", "_markerwest", "_size"];
    _Radaranzeige = [];

    if !(alive _container) exitWith {};

    if !(_container getVariable ["RADARWESTaufgebaut", false]) then {
        _Radarring setmarkerposlocal getpos _container;
        _Radarring setMarkerSizeLocal [0, 0];
        
        {_x setmarkerposlocal [0,0]} foreach _markerost;
        {_x setmarkerposlocal [0,0]} foreach _markerwest;
        {_x setMarkerTypelocal "mil_dot";} foreach _markerost;
        {_x setMarkerTypelocal "mil_dot";} foreach _markerwest;

    } else {			
        _Radaranzeige = [];
                    
        if (PLAYER_SIDE isEqualTo blufor) then {
            _Radarring setmarkerposlocal getpos _container;
            _Radarring setMarkerSizeLocal [_size, _size];
            _RadarZONE setpos getpos _container;
            {_x setmarkerposlocal [0,0]} foreach _markerost;
            {_x setmarkerposlocal [0,0]} foreach _markerwest;
            {_x setMarkerTypelocal "mil_dot";} foreach _markerost;
            {_x setMarkerTypelocal "mil_dot";} foreach _markerwest;

            _units = list _RadarZONE;
			
			private _objekte = nearestTerrainObjects [getpos GVAR(containerWest), ["Tree","BUILDING"], 100];
			private _SignalDaempfung = RADAR_DAMPING(_objekte);
	           
            {
				
                if ((_x iskindof "AIR") and ((275 - ((getPos _x select 2)*(5 - _SignalDaempfung)))< (speed _x))) then { 
                    _Radaranzeige pushBack _x;
                };	
           	
            //systemChat format ["X:%1 R:%2 B1:%3 B2:%4",_x,_Radaranzeige,(_x iskindof "AIR"),((275 - ((getPos _x select 2)*(5 - _SignalDaempfung)))< (speed _x))];	
            } foreach _units;
            
            if (count _Radaranzeige > 0) then	{
                for "_i" from 0 to (count _Radaranzeige - 1) do {
                    _obj = _Radaranzeige select _i;

                    //systemChat format ["O:%1 OS:%2 B1:%3 B2:%4",_obj,side _obj,((side _obj) == east),(_obj iskindof "Helicopter")];
                    if (side _obj == east) then {
                        _marker = _markerost select _i;		

                        if ((_obj iskindof "Helicopter") and !(_obj iskindof "OPT_O_UAV_01_F")) then {
                            _marker setmarkerposlocal (getPosATLVisual (vehicle _obj));
                            _marker setMarkerTypelocal "b_air";
                            //systemChat format ["O:%1 M:%2 P:%3",_obj,_marker,(getPosATLVisual (vehicle _obj))];					
                        };

                        if (_obj iskindof "Plane") then {
                            _marker setmarkerposlocal (getPosATLVisual (vehicle _obj));
                            _marker setMarkerTypelocal "b_plane";
                        };	

                    } else {
                        _marker = _markerwest select _i;		

                        if ((_obj iskindof "Helicopter") and !(_obj iskindof "OPT_B_UAV_01_F")) then {
                            _marker setmarkerposlocal (getPosATLVisual (vehicle _obj));
                            _marker setMarkerTypelocal "b_air";
                        };

                        if (_obj iskindof "Plane") then {
                            _marker setmarkerposlocal (getPosATLVisual (vehicle _obj));
                            _marker setMarkerTypelocal "b_plane";
                        };

                    };
                };
            };
        };
    };

}, [_container, _Radarring, _RadarZONE, _markerost, _markerwest, _size]] call BIS_fnc_addStackedEventHandler;

waitUntil {!alive _container};

[QGVAR(radarEastActive), "onEachFrame"] call BIS_fnc_removeStackedEventHandler;

{deleteMarker _x;} foreach _markerost;
{deleteMarker _x;} foreach _markerwest;
deleteMarker _Radarring;
// delete objects around container - James
if (!isNil "Radarturmwest") then {
    deleteVehicle Radarturmwest;
};
if (!isNil "Radarnetzwest") then {
    deleteVehicle Radarnetzwest;
};

// Container destroyed? delete AddAction - James
if (!alive _container) then {
    removeAllActions _container;
};
