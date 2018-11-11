/**
* GPS
* 
* Author: [GNC]Lord-MDB
*
* Arguments:
* keine
* 
* Return Value:
* keine
* 
* Server only:
* nein
*
* Public:
* nein
* 
* Global:
* nein
* 
* Sideeffects:
* Markeranzeige Spieler
* 
* Example:
* 
* 
* 
*
*/

#include "script_component.hpp"



	PRIVATE ["_westplayer","_eastplayer","_modus","_marker","_markerplayer","_sides","_markerw","_markerwrespawn","_markere","_markererespawn","_marker","_markerav8","_obj","_name","_typename","_leadergroupwest","_gruppeinheitenwest","_leadergroupeast","_gruppeinheiteneast","_MARKERREFRESH"];
	

	_westplayer = [];
	_eastplayer = [];
	_marker=nil;
	GVAR(mode) = 1;
	
	//Modus
	if (typeOf player in GVARMAIN(officer) and GVAR(showAllUnits)) then {GVAR(mode) = 2;};

	_markerw = [];
	_markere = [];

	if (playerside == west) then
	{
		for "_i" from 1 to 80 do
		{
			_marker = createMarkerLocal [format["W%1marker",_i],[0,0]];
			_markerw = _markerw + [_marker];
			_marker setMarkerTypeLocal "mil_triangle";
			_marker setMarkerColorLocal "ColorBLUFOR";
			_marker setMarkerSizeLocal [0.8, 0.8];
			_marker setMarkerAlphaLocal 0.6;
			sleep 0.01;
		};	
		
	};

	if (playerside == east) then
	{
		for "_i" from 1 to 80 do
		{
			_marker = createMarkerLocal [format["E%1marker",_i],[0,0]];
			_markere = _markere + [_marker];
			_marker setMarkerTypeLocal "mil_triangle";
			_marker setMarkerColorLocal "ColorOPFOR";
			_marker setMarkerSizeLocal [0.8, 0.8];
			_marker setMarkerAlphaLocal 0.6;
			sleep 0.01;
		
		};
	};
	_markerplayer = createMarkerLocal ["playermarker",[0,0]];
	_markerplayer setMarkerTypeLocal "mil_circle";
	_markerplayer setMarkerColorLocal "ColorBrown";
	_markerplayer setMarkerSizeLocal [0.8, 0.8];
	_markerplayer setMarkerAlphaLocal 0.6;
	
	sleep 1;
	
	while {true} do
	{	

		_westplayer = [];
		_eastplayer = [];
		_leadergroupwest=[];
		_leadergroupeast=[];
		_gruppeinheitenwest=[];	
		_gruppeinheiteneast=[];
		
		{
			if (side (leader _x) == west) then
			{	
				_leadergroupwest pushBack leader _x;
			};	

			if (side (leader _x) == east) then
			{
				_leadergroupeast pushBack leader _x;
			};					
		} forEach allGroups;
				

		if (side player == east) then
			{	
			[_gruppeinheiteneast,units group player] call BIS_fnc_arrayPushStack;
			};
		if (side player == west) then
			{	
			[_gruppeinheitenwest,units group player] call BIS_fnc_arrayPushStack;
			};
			
		if (GVAR(mode)==0) then
		{		
			if (leader group player == leader player) then
			{
				[_westplayer,_leadergroupwest] call BIS_fnc_arrayPushStack;
				[_eastplayer,_leadergroupeast] call BIS_fnc_arrayPushStack;

				[_westplayer,_gruppeinheitenwest] call BIS_fnc_arrayPushStack;
				[_eastplayer,_gruppeinheiteneast] call BIS_fnc_arrayPushStack;			
			}
			else	
			{						
				[_westplayer,_leadergroupwest] call BIS_fnc_arrayPushStack;
				[_eastplayer,_leadergroupeast] call BIS_fnc_arrayPushStack;
			};
		};
				
		if (GVAR(mode)==1) then
		{		
			[_westplayer,_leadergroupwest] call BIS_fnc_arrayPushStack;
			[_eastplayer,_leadergroupeast] call BIS_fnc_arrayPushStack;
					
			[_westplayer,_gruppeinheitenwest] call BIS_fnc_arrayPushStack;
			[_eastplayer,_gruppeinheiteneast] call BIS_fnc_arrayPushStack;			
		};		
				
		if (GVAR(mode)==2) then
		{
			{
				if (side _x == west) then
				{
					_westplayer pushBack _x;
				};
			
				if (side _x == east) then
				{
					_eastplayer pushBack _x;
				};
			} foreach allUnits;	// Drohnen für HL sichtbar machen
		};					
		//systemChat format ["W:%1 C:%2",_westplayer,_eastplayer];
									
		if (playerside == west) then
		{
			{_x setmarkerposlocal [0,0]} foreach _markerw;
			_markerplayer setmarkerposlocal (getPosATLVisual (vehicle player));		

			if ((count _westplayer) > 0) then
			{
				for "_i" from 1 to (count _westplayer) do
				{
					(_markerw select (_i - 1)) setmarkerposlocal [0,0];	
					_obj = _westplayer select (_i - 1);
					_marker = _markerw select (_i - 1);		
					//systemChat format ["O:%1",_obj];
					if (alive _obj) then
					{
						_name = (name _obj);

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
					} 
					else 
					{
						_marker setmarkerposlocal [0,0];
					};
				};
			};	
		};

		if (playerside == east) then
		{
			{_x setmarkerposlocal [0,0]} foreach _markere;	
			_markerplayer setmarkerposlocal (getPosATLVisual (vehicle player));	
			if ((count _eastplayer) > 0) then
			{
				for "_i" from 1 to (count _eastplayer) do
				{
					(_markere select (_i - 1)) setmarkerposlocal [0,0];		
					_obj = _eastplayer select (_i - 1);
					_marker = _markere select (_i - 1);
					//systemChat format ["M:%1 ME:%2 S:%3 I:%4 CE:%5 EP:%6",_marker,_markere,(_i - 1),_i,(count _eastplayer),_eastplayer];
					if ((alive _obj)) then
					{
						_name = (name _obj);

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

					} 
					else 
					{
						_marker setmarkerposlocal [0,0];
					};				
				};
			};	
		};
	sleep GVAR(updateInterval);
	};
