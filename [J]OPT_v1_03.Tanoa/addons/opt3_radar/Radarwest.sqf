
private ["_Container","_markerwest","_markerost","_marker1","_marker2","_Radarring","_units","_Radaranzeige","_go"];

_Container = RADARContainerWEST;
_size= 3500;

_markerwest = [];
_markerost = [];
_Radaranzeige=[];
_units=[];
_go=true;

if (playerSide == east) exitwith {_go=false;};


	for "_i" from 1 to 10 do
		{
			_marker1 = createMarkerLocal [format["W%1AIR%2",_i,west],[0,0]];
			_markerwest = _markerwest + [_marker1];
			_marker1 setMarkerTypeLocal "mil_dot";
			_marker1 setMarkerColorLocal "ColorBlue";
			_marker1 setMarkerSizeLocal [1, 1];
		};
	for "_i" from 1 to 10 do
		{
			_marker2 = createMarkerLocal [format["E%1AIR%2",_i,west],[0,0]];
			_markerost = _markerost + [_marker2];
			_marker2 setMarkerTypeLocal "mil_dot";
			_marker2 setMarkerColorLocal "ColorRed";
			_marker2 setMarkerSizeLocal [1, 1];
		};
	_Radarring = createMarkerLocal [format["Radarring%1",west],[0,0]];
	_Radarring setMarkerShapeLocal "ELLIPSE";
	_Radarring setMarkerBrushLocal "Border";
	_Radarring setMarkerColorLocal "ColorGrey";
	_Radarring setMarkerSizeLocal [0, 0];
	
	_RadarZONE = createTrigger ["EmptyDetector",(getpos _Container)];
	_RadarZONE setTriggerArea [_size, _size,0,false,0];
	_RadarZONE setTriggerActivation ["ANY","PRESENT",true];
	_RadarZONE setTriggerStatements ["this", "", ""];

sleep 1;
		
while {((alive _Container) and _go)} do
	{
	if (!(RADARContainerWEST getVariable ["RADARWESTaufgebaut",false])) then
		{
		_Radarring setmarkerposLocal getpos _Container;
		_Radarring setMarkerSizeLocal [0, 0];
		{_x setmarkerposlocal [0,0]} foreach _markerost;
		{_x setmarkerposlocal [0,0]} foreach _markerwest;
		{_x setMarkerTypelocal "mil_dot";} foreach _markerost;
		{_x setMarkerTypelocal "mil_dot";} foreach _markerwest;
		};
	//systemChat format ["Turm:%1",RadarturmWest];		
	if (RADARContainerWEST getVariable ["RADARWESTaufgebaut",false]) then
		{	
		//systemChat format ["Turmstatus:%1",true];							
		while {((RADARContainerWEST getVariable ["RADARWESTaufgebaut",false]) and (Alive _Container) and _go)} do
			{
						_Radaranzeige=[];
				
						_Radarring setmarkerposLocal getpos _Container;
						_Radarring setMarkerSizeLocal [_size, _size];
						_RadarZONE setpos getpos _Container;
						{_x setmarkerposlocal [0,0]} foreach _markerost;
						{_x setmarkerposlocal [0,0]} foreach _markerwest;
						{_x setMarkerTypelocal "mil_dot";} foreach _markerost;
						{_x setMarkerTypelocal "mil_dot";} foreach _markerwest;

						_units=list _RadarZONE;
						
						//systemChat format ["Radaron:%1 B:%2",getMarkerSize _Radarring,_size];									
						
						{
						if ((_x iskindof "AIR") and ((getPos _x select 2)> 10)) then				// von 5 auf 10 geändert, kallek
							{
							//[_Radaranzeige,_x] call BIS_fnc_arrayPushStack;
							_Radaranzeige=_Radaranzeige + [_x];
							};	
						//systemChat format ["X:%1 R:%2 B1:%3 B2:%4",_x,_Radaranzeige,(_x iskindof "AIR"),((getPos _x select 2)> 10)];	// von 5 auf 10 geändert, kallek
						} foreach _units;
						
						if ((count _Radaranzeige) > 0) then
						{
							for "_i" from 1 to (count _Radaranzeige) do
							{
								_obj = _Radaranzeige select (_i - 1);
								_marker = _markerost select (_i - 1);		
								//systemChat format ["O:%1 OS:%2 B1:%3 B2:%4",_obj,side _obj,((side _obj) == east),(_obj iskindof "Helicopter")];
								if ((side _obj == east) and (_obj iskindof "Helicopter")) then
									{
									_marker setmarkerposlocal (getPosATLVisual (vehicle _obj));
									_marker setMarkerTypeLocal "b_air";
									//systemChat format ["O:%1 M:%2 P:%3",_obj,_marker,(getPosATLVisual (vehicle _obj))];						
									};
								if ((side _obj == east) and (_obj iskindof "Plane")) then
									{
									_marker setmarkerposlocal (getPosATLVisual (vehicle _obj));
									_marker setMarkerTypelocal "b_plane";
									};	
									
								_obj = _Radaranzeige select (_i - 1);
								_marker = _markerwest select (_i - 1);		
								//systemChat format ["O:%1",_obj];
								if ((side _obj == west) and (_obj iskindof "Helicopter")) then
									{
									_marker setmarkerposlocal (getPosATLVisual (vehicle _obj));
									_marker setMarkerTypelocal "b_air";
									};
								if ((side _obj == west) and (_obj iskindof "Plane")) then
									{
									_marker setmarkerposlocal (getPosATLVisual (vehicle _obj));
									_marker setMarkerTypeLocal "b_plane";
									};		
							};
						};							
			sleep 1;	
			};	
		};		
	sleep 1;	
	};
	
{deleteMarker _x;} foreach _markerost;
{deleteMarker _x;} foreach _markerwest;
deleteMarker _Radarring;
if (!isNil "Radarturmwest") then {
	deleteVehicle Radarturmwest;
};
if (!isNil "Radarnetzwest") then {
	deleteVehicle Radarnetzwest;
};
	
	 




