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
private _size = GVAR(radarDruchmesser);
private _markerwest = [];
private _markerost = [];
private _Geschwindigkeitfaktor = 5;

for "_i" from 1 to 10 do
{
    private _marker =
    [
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

for "_i" from 1 to 10 do
{
    private _marker =
    [
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

private _Radarring =
[
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

while {true} do
{

    if (visibleMap or visibleGPS) then
    {
        private _Radaranzeige = [];

        if (damage _container > GVAR(maxDammage)) exitWith
        {
            // client actions
            _markerost apply {deleteMarkerLocal _x;};
            _markerwest apply {deleteMarkerLocal _x;};
            deleteMarkerLocal _Radarring;
            removeAllActions _container;

            // server actions
            // delete trigger on server -> global effect
            [[_RadarZONE], {deleteVehicle (_this select 0);}] remoteExecCall ["spawn", 2, false];
            // delete objects around container -> global
            [_container] remoteExec [QEFUNC(composition,undeployComposition), 2, false];

            // remove ACE dragging entries
            ["cargo", "deactivateDragging", [_container], false] remoteExecCall [QEFUNC(common,execFunc), 0, true]; // has to be called on each client and also JIP
            ["cargo", "deactivateCargo", [_container], false] remoteExecCall [QEFUNC(common,execFunc), 2, true]; // global effect
        };  

        // reset all marker
        (_markerost + _markerwest) apply
        {

            if (markerAlpha _x != 0) then {
                _x setMarkerAlphaLocal 0;
            };

        };

        if !(_container getVariable [QEGVAR(composition,deployed), false]) then
        {
            _Radarring setMarkerAlphaLocal 0;

        } 
		else
        {

            if (markerAlpha _Radarring == 0) then
            {
                _Radarring setMarkerPosLocal getPos _container;
                _Radarring setMarkerSizeLocal [_size, _size];
                _Radarring setMarkerAlphaLocal 1;

                _RadarZONE setPos getPos _container;
            };

            private _units = list _RadarZONE;
            private _signalLoss = [false] call FUNC(calcSignalLoss);

			_Radaranzeige = 
			[
			_units,
			_signalLoss	
			] 
			call FUNC(runRadarFormel); 
			
			//systemChat format ["R:%1",_Radaranzeige];   

            if (count _Radaranzeige > 0) then
            {
                for "_i" from 0 to (count _Radaranzeige - 1) do
                {
                    _obj = _Radaranzeige select _i;

                    //systemChat format ["O:%1 OS:%2 B1:%3 B2:%4",_obj,side _obj,((side _obj) == east),(_obj iskindof "Helicopter")];
                    if (side _obj == east) then
                    {
                        _marker = _markerost select _i;

                        if (
                            (_obj iskindof "Helicopter") and
                            !(_obj iskindof "OPT_O_UAV_01_F") and
                            !(_obj iskindof "Steerable_Parachute_F")
                        ) then
                        {
                            _marker setMarkerPosLocal (getPosATLVisual (vehicle _obj));
                            _marker setMarkerTypeLocal "b_air";
                            _marker setMarkerAlphaLocal 1;
                            //systemChat format ["O:%1 M:%2 P:%3",_obj,_marker,(getPosATLVisual (vehicle _obj))];
                        };

                        if (_obj iskindof "Plane") then
                        {
                            _marker setMarkerPosLocal (getPosATLVisual (vehicle _obj));
                            _marker setMarkerTypelocal "b_plane";
                            _marker setMarkerAlphaLocal 1;
                        };
                    };

                    if (side _obj == west) then
                    {
                        _marker = _markerwest select _i;

                        if (
                            (_obj iskindof "Helicopter") and
                            !(_obj iskindof "OPT_B_UAV_01_F") and
                            !(_obj iskindof "Steerable_Parachute_F")
                        ) then
                        {
                            _marker setMarkerPosLocal (getPosATLVisual (vehicle _obj));
                            _marker setMarkerTypelocal "b_air";
                            _marker setMarkerAlphaLocal 1;
                        };

                        if (_obj iskindof "Plane") then
                        {
                            _marker setMarkerPosLocal (getPosATLVisual (vehicle _obj));
                            _marker setMarkerTypelocal "b_plane";
                            _marker setMarkerAlphaLocal 1;
                        };

                    };
                };
            };
        };
    };

    sleep GVAR(updateInterval);
};