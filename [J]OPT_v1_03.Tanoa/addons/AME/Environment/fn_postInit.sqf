enableEnvironment true;

//enableRadio false;
enableSentences false;
showSubtitles false;
enableSaving [false,false];
enableTeamswitch false;

disableRemoteSensors true;


if (isDedicated || !hasInterface) exitWith {};

// first set of weather
true spawn {
	waitUntil {!isNil "OPT_weather"};
	
	skipTime -24;
	86400 setRain (OPT_weather select 0);
	86400 setFog (OPT_weather select 1);
	86400 setOvercast (OPT_weather select 2);
	skipTime 24;
	simulweatherSync;
	setwind (OPT_weather select 3);
	setdate OPT_real_date;
};