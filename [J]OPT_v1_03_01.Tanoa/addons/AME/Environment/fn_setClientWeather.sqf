if (isDedicated || !hasInterface) exitWith {};
params ["_weather_data"];

240 setRain (_weather_data select 0);
240 setFog (_weather_data select 1);
240 setOvercast (_weather_data select 2);
setWind (_weather_data select 3);
//setDate (_weather_data select 4);
240 setRainbow (_weather_data select 5);