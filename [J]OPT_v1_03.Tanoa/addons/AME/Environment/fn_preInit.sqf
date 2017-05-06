setTerrainGrid 3.125;
//setViewDistance 5800;											// von setViewdistance
OPT_viewDistance = viewDistance;									
//setObjectViewDistance 5800;										// von 1800, kallek
OPT_objectViewDistance = getObjectViewDistance;

//0 setFog [0.5, 0.2, 0];

if (!isDedicated) then {
	call compile "setSimulWeatherLayers 0";
};

["vehicleChanged", {
    (_this select 0) params ["_currentVehicle", "_oldVehicle"];
    
    if (_currentVehicle isKindOf "Air") then {
        setViewDistance (OPT_viewDistance + 1500);
        setObjectViewDistance (OPT_objectViewDistance + 1500);	// von 700, kallek
    } else {
        setViewDistance OPT_viewDistance;
        setObjectViewDistance OPT_objectViewDistance;
    };
}] call AME_Core_fnc_bindEventHandler;


OPT_real_date = date;

if (isServer) then {
	// Min time seconds (real time) before a new weather forecast
	_mintime = 9000;												//von 2000, kallek
	// Max time seconds (real time) before a new weather forecast
	_maxtime = 9700;												//von 2700, kallek

	OPT_weather = [];
	OPT_weather = switch (true) do {
		case (overcast > 0.85): {	// rainy
			[1, 0, 1, [random 3, random 3, true], date];
		};
		case (overcast > 0.55) : {	// cloudy
			[0, 0, 0.6, [random 3, random 3, true], date];
		};
		case (overcast > 0.25) : {	// light cloudy
			[0, 0, 0.3, [random 3, random 3, true], date];
		};
		default {	// sunny
			[0, 0, 0, [random 3, random 3, true], date];
		};
	};

	skipTime -24;
	86400 setRain (OPT_weather select 0);
	86400 setFog (OPT_weather select 1);
	86400 setOvercast (OPT_weather select 2);
	skipTime 24;
	simulweatherSync;
	setWind (OPT_weather select 3);
	setDate OPT_real_date;

	publicVariable "OPT_weather";	// needed for first synchronisation and transition
	[OPT_weather] remoteExecCall ["AME_Environment_fnc_setClientWeather", 0, true];

	
	[_mintime, _maxtime] spawn {
		waitUntil {time > 1};
		private _lastrain = 0;
		private _rain = 0;
		private _overcast = 0;
		private _fog = 0;
		private _rainbow = 0;
		
		params ["_mintime", "_maxtime"];
		_timeforecast = _mintime + (random (_maxtime - _mintime));
		sleep _timeforecast;

		while {true} do {	// start random changing weather on server side
			_overcast = random 1;
			if(_overcast > 0.75) then {
				_rain = random 1;
			} else {
				_rain = 0;
			};
			
			if ((date select 3 > 2) && (date select 3 < 6)) then {
				_fog = 0.2 + (random 0.3);
			} else {
				if ((_lastrain > 0.6) && (_rain < 0.2)) then {
					_fog = random 0.25;
				} else {
					_fog = 0;
					_rainbow = 0;
					if (random 1 > 0.33) then {
						_rainbow = 0.7;
					};
				};
			};
			
			_wind = if (random 1 > 0.95) then {
				[random 7, random 7, true];
			} else {
				[random 3, random 3, true];
			};
			
			_lastrain = _rain;
			OPT_weather = [_rain, _fog, _overcast, _wind, date, _rainbow];
			
			240 setRain _rain;
			240 setFog _fog;
			240 setRainbow _rainbow;
			240 setOvercast _overcast;
			setWind _wind;
			
			[OPT_weather] remoteExecCall ["AME_Environment_fnc_setClientWeather", 0, true];
			
			_timeforecast = _mintime + (random (_maxtime - _mintime));
			sleep _timeforecast;
		};
	};
};