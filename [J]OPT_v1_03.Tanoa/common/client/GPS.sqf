#include "..\..\setup\setup.sqf"
ScriptName "client\marker.sqf";

#define MARKERREFRESH 1
#define MARKERSYMBOL "mil_triangle"
#define MARKERSIZE [0.8, 0.8]
#define MARKERALPHA 0.6

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
	_all = true;
	#endif
	
	//Modus
	//_all=Schalter;
	//if ((player isKindOf "OPT_NATO_Gruppenfuehrer_T") or (player isKindOf "OPT_CSAT_Gruppenfuehrer_T")) then {_Modus=1;};
	if (((player isKindOf "OPT_NATO_Offizier_T") or (player isKindOf "OPT_CSAT_Offizier_T")) and _all) then {_Modus=2;};
	
	_markerw = [];
	_markere = [];

	if (playerside == west) then
	{
		for "_i" from 1 to 80 do
		{
			_marker = createMarkerLocal [format["W%1marker",_i],[0,0]];
			_markerw = _markerw + [_marker];
			_marker setMarkerTypeLocal MARKERSYMBOL;
			_marker setMarkerColorLocal "ColorBLUEFOR";
			_marker setMarkerSizeLocal MARKERSIZE;
			_marker setMarkerAlphaLocal MARKERALPHA;
			sleep 0.01;
		};	
		
	};

	if (playerside == east) then
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
			if (side (leader _x) == west) then
				{	
				_leadergroupwest pushBack leader _x;
				};					
			} forEach allGroups;
				
			{
			if (_x == player) then
				{
				[_gruppeinheitenwest,units group _x] call BIS_fnc_arrayPushStack;
				};
			} foreach _leadergroupwest;
			
			{
			if (side (leader _x) == east) then
				{	
				_leadergroupeast pushBack leader _x;
				};					
			} forEach allGroups;
			
						{
			if (_x == player) then
				{
				[_gruppeinheiteneast,units group _x] call BIS_fnc_arrayPushStack;
				};
			} foreach _leadergroupeast;
			
		if (_Modus==0) then
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
				
		if (_Modus==1) then
				{		
				[_westplayer,_leadergroupwest] call BIS_fnc_arrayPushStack;
				[_eastplayer,_leadergroupeast] call BIS_fnc_arrayPushStack;
						
				[_westplayer,_gruppeinheitenwest] call BIS_fnc_arrayPushStack;
				[_eastplayer,_gruppeinheiteneast] call BIS_fnc_arrayPushStack;			
				};		
				
		if (_Modus==2) then
				{
					{
					if (side _x == west) then
						{
						_westplayer pushBack _x;
						};
					} foreach playableUnits;
					
					{
					if (side _x == east) then
						{
						_eastplayer pushBack _x;
						};
					} foreach playableUnits;	
				};					
		//systemChat format ["G:%1",_westplayer];
									
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
						_marker setmarkertextlocal format ["%1",_name];
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
						_marker setmarkertextlocal format ["%1",_name];
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