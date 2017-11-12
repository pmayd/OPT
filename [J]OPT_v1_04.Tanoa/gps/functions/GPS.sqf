/**
* Author: Lord & James
* custom GPS script for OPT purposes
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [parameter] call GPS.sqf;
*
*/
#include "script_component.hpp"

if (local player) then
{
	PRIVATE ["_westplayer","_eastplayer","_modus","_marker","_markerplayer","_sides","_markerw","_markerwrespawn","_markere","_markererespawn","_marker","_markerav8","_obj","_name","_typename","_leadergroupwest","_gruppeinheitenwest","_leadergroupeast","_gruppeinheiteneast","_MARKERREFRESH"];

	waitUntil {sleep 0.4; (Alive player)};

	_westplayer = [];
	_eastplayer = [];
	_marker=nil;
	_Modus = 0;
	_all = false;

	#ifdef __SHOW_ALL_UNITS__
		if (OPT_SHOW_ALL_UNITS == 1) then {
			_all = true;
		};
	#endif
	
	//Modus
	//_all=Schalter;
	//if ((player isKindOf "OPT_NATO_Gruppenfuehrer_T") or (player isKindOf "OPT_CSAT_Gruppenfuehrer_T")) then {_Modus=1;};
	if (((player isKindOf "OPT_NATO_Offizier_T") or (player isKindOf "OPT_CSAT_Offizier_T")) and _all) then {_Modus=2;};

	_markerw = [];
	_markere = [];

	if (playerSide == west) then
	{
		for "_i" from 1 to 80 do
		{
			_marker = createMarkerLocal [format["W%1marker",_i],[0,0]];
			_markerw = _markerw + [_marker];
			_marker setMarkerTypeLocal MARKERSYMBOL;
			_marker setMarkerColorLocal "ColorBLUFOR";
			_marker setMarkerSizeLocal MARKERSIZE;
			_marker setMarkerAlphaLocal MARKERALPHA;
			sleep 0.01;
		};	
		
	};

	if (playerSide == east) then
	{
		for "_i" from 1 to 80 do
		{
			_marker = createMarkerLocal [format["E%1marker",_i],[0,0]];
			_markere = _markere + [_marker];
			_marker setMarkerTypeLocal MARKERSYMBOL;
			_marker setMarkerColorLocal "ColorOPFOR";
			_marker setMarkerSizeLocal MARKERSIZE;
			_marker setMarkerAlphaLocal MARKERALPHA;
			sleep 0.01;
		
		};
	};
	_markerplayer = createMarkerLocal ["playermarker",[0,0]];
	_markerplayer setMarkerTypeLocal "mil_circle";
	_markerplayer setMarkerColorLocal "ColorBrown";
	_markerplayer setMarkerSizeLocal MARKERSIZE;
	_markerplayer setMarkerAlphaLocal MARKERALPHA;
	
	sleep 1;
	
	while {(true)} do
	{	
		_westplayer = [];
		_eastplayer = [];
		_leadergroupwest=[];
		_leadergroupeast=[];
		_gruppeinheitenwest=[];	
		_gruppeinheiteneast=[];
		
		{
			if (((leader _x) getVariable "opt_var_playerSide") == west) then
			{	
				_leadergroupwest pushBack leader _x;
			};	

			if (((leader _x) getVariable "opt_var_playerSide") == east) then
			{
				_leadergroupeast pushBack leader _x;
			};					
		} forEach allGroups;
			
		{
			if (_x == player) then
			{
				[_gruppeinheitenwest, units group _x] call BIS_fnc_arrayPushStack;
			};
		} foreach _leadergroupwest;
		
		{
			if (_x == player) then
			{
				[_gruppeinheiteneast, units group _x] call BIS_fnc_arrayPushStack;
			};
		} foreach _leadergroupeast;
			
		if (_Modus==0) then
		{		
			if (leader group player == leader player) then
			{
				_westplayer append _leadergroupwest;
				_eastplayer append _leadergroupeast;

				_westplayer append _gruppeinheitenwest;
				_eastplayer append _gruppeinheiteneast;			
			}
			else	
			{						
				_westplayer append _leadergroupwest;
				_eastplayer append _leadergroupeast;
			};
		};
				
		if (_Modus==1) then
		{		
			_westplayer append _leadergroupwest;
			_eastplayer append _leadergroupeast;
					
			_westplayer append _gruppeinheitenwest;
			_eastplayer append _gruppeinheiteneast;
		};		
				
		if (_Modus==2) then
		{
			{
				if ((_x getVariable "opt_var_playerSide") == west) then
				{
					_westplayer pushBack _x;
				};
			
				if ((_x getVariable "opt_var_playerSide") == east) then
				{
					_eastplayer pushBack _x;
				};
			} foreach allUnits;	// Drohnen für HL sichtbar machen
		};					
		//systemChat format ["G:%1",_westplayer];
									
		if (playerSide == west) then
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

		if (playerSide == east) then
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
		sleep MARKERREFRESH;
	};
};